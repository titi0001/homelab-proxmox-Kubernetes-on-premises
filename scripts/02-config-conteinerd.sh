#!/bin/bash

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado como root."
  exit 1
fi

# Atualiza os repositórios e instala dependências
apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Constantes e Variáveis
CONTAINERD_CONFIG_FILE="/etc/containerd/config.toml"
K8S_CONF_FILE="/etc/sysctl.d/k8s.conf"

# Função para imprimir mensagens de erro
echo_error() {
  echo "Erro: $1" >&2
  exit 1
}

# Função para verificar e adicionar linhas em arquivos de configuração
add_line_to_file() {
  local file=$1
  local line=$2

  # Verifica se a linha já existe no arquivo
  if grep -qF "$line" "$file"; then
    echo "A linha '$line' já está presente em $file."
  else
    # Adiciona a linha ao arquivo
    echo "$line" | tee -a "$file" > /dev/null || echo_error "Falha ao adicionar a linha em $file."
    echo "Linha '$line' adicionada com sucesso em $file."
  fi
}

# ...

# Adiciona a configuração do SystemdCgroup ao arquivo
CONFIG_FILE="/caminho/do/seu/arquivo.toml"
SEARCH_TEXT='[plugins."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options]'

# Verifica se o arquivo existe
if [ ! -e "$CONFIG_FILE" ]; then
  echo "O arquivo $CONFIG_FILE não foi encontrado."
  exit 1
fi

# Verifica se o texto de pesquisa está presente no arquivo
if ! grep -qF "$SEARCH_TEXT" "$CONFIG_FILE"; then
  echo "O texto de pesquisa não foi encontrado no arquivo."
  exit 1
fi

# Altera a opção para SystemdCgroup = true
sed -i '/^\[plugins\."io.containerd.grpc.v1.cri".containerd.runtimes.runc.options\]$/,/^\[/ s/SystemdCgroup[[:space:]]*=[[:space:]]*false/SystemdCgroup = true/' "$CONFIG_FILE"

# Verifica se a alteração foi bem-sucedida
if [ $? -eq 0 ]; then
  echo "Opção SystemdCgroup alterada com sucesso em $CONFIG_FILE."
else
  echo "Falha ao alterar a opção SystemdCgroup em $CONFIG_FILE."
  exit 1
fi

# ...

# Reinicia o sistema (Descomente esta linha se estiver pronto para reiniciar)
echo "Reiniciando o sistema"
reboot
