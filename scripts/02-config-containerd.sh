#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado como root."
  exit 1
fi

# Constantes e Variáveis
CONTAINERD_CONFIG_FILE="/etc/containerd/config.toml"
K8S_CONF_FILE="/etc/sysctl.d/k8s.conf"
SEARCH_TEXT='[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]'

# Atualiza os repositórios e instala dependências
apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Instala o containerd
sudo apt install -y containerd || echo_error "Falha ao instalar o containerd."
# Cria o diretório /etc/containerd se não existir
sudo mkdir -p /etc/containerd
# Gera a configuração padrão do containerd e a armazena em /etc/containerd/config.toml
sudo containerd config default | sudo tee "$CONTAINERD_CONFIG_FILE" > /dev/null || echo_error "Falha ao gerar a configuração do containerd."

# Altera a opção para SystemdCgroup = true
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' "$CONTAINERD_CONFIG_FILE"

# Verifica se a alteração foi bem-sucedida
if [ $? -eq 0 ]; then
  echo "Opção SystemdCgroup alterada com sucesso em $CONTAINERD_CONFIG_FILE."
else
  echo "Falha ao alterar a opção SystemdCgroup em $CONTAINERD_CONFIG_FILE."
  exit 1
fi

# Função para imprimir mensagens de erro (modificado para usar sudo)
echo_error() {
  echo "Erro: $1" >&2
  exit 1
}

# Desativa a swap
echo "Desativando swap"
sudo swapoff -a || echo_error "Falha ao desativar a swap."

# Habilita o encaminhamento de IP
echo "Habilitando encaminhamento de IP"
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf
sudo sysctl -p || echo_error "Falha ao habilitar o encaminhamento de IP."

# Adiciona módulos ao arquivo de configuração
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf > /dev/null || echo_error "Falha ao adicionar módulos ao arquivo de configuração."
overlay
br_netfilter
EOF

sudo modprobe overlay || echo_error "Falha ao carregar o módulo overlay."
sudo modprobe br_netfilter || echo_error "Falha ao carregar o módulo br_netfilter."

# Configurações do Kernel para o Kubernetes
echo "Configurando o Kernel para o Kubernetes"

# Adiciona as configurações ao arquivo
sudo cat <<EOF | sudo tee -a "$K8S_CONF_FILE" > /dev/null || echo_error "Falha ao adicionar configurações ao arquivo $K8S_CONF_FILE."
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

echo "Configurações adicionadas ao arquivo $K8S_CONF_FILE."

# Aplica as alterações
sudo sysctl --system || echo_error "Falha ao aplicar as alterações."

# Reboot
sudo reboot 
