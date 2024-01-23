# Configuração do Kubernetes - Scripts

Estes scripts foram desenvolvidos para realizar configurações específicas em máquinas de um cluster Kubernetes. A execução destes scripts é crucial para garantir a consistência da configuração em todas as máquinas do cluster.

## Scripts Bash para Configuração do Kubernetes

### Descrição

Os seguintes scripts bash foram criados para simplificar a configuração do Kubernetes em diferentes máquinas do cluster:

1. **01-config-netplan.sh**
    - Configura o Netplan para ajustes específicos de rede.

2. **02-config-containerd.sh**
    - Configura o Containerd, o runtime de contêineres do Kubernetes.

3. **03-install-kubernetes.sh**
    - Instala os pacotes básicos do Kubernetes.

4. **04-config-kubeadm.sh**
    - Realiza configurações específicas para o Kubeadm. **Importante: Este script deve ser usado apenas na máquina que atuará como controlador do cluster. Após a execução, aplique o comando `kubeadm join` nos outros nós do cluster.**

5. **05-install-cni.sh**
    - Instala o Container Network Interface (CNI) necessário para a comunicação entre os pods. **Importante: Este script deve ser usado apenas na máquina que atuará como controlador do cluster.** O CNI foi configurado usando o Weave. Para outras opções de CNI, consulte a [documentação oficial do Kubernetes](https://kubernetes.io/pt-br/docs/concepts/cluster-administration/addons/).

### Uso

#### Pré-requisitos

- Conexão SSH com a máquina do cluster.

#### Passos

1. Conecte-se à máquina do cluster usando SSH:

    ```bash
    ssh usuario@endereco-da-maquina
    ```

2. Envie os scripts para a VM usando `scp`:

    ```bash
    scp 01-config-netplan.sh usuario@endereco-da-maquina:/root/
    scp 02-config-containerd.sh usuario@endereco-da-maquina:/root/
    scp 03-install-kubernetes.sh usuario@endereco-da-maquina:/root/
    scp 04-config-kubeadm.sh usuario@endereco-da-maquina:/root/
    scp 05-install-cni.sh usuario@endereco-da-maquina:/root/
    ```

3. Torne os scripts executáveis:

    ```bash
    chmod +x 01-config-netplan.sh
    chmod +x 02-config-containerd.sh
    chmod +x 03-install-kubernetes.sh
    chmod +x 04-config-kubeadm.sh
    chmod +x 05-install-cni.sh
    ```

4. Execute o script com privilégios de superusuário:

    ```bash
    sudo ./01-config-netplan.sh
    sudo ./02-config-containerd.sh
    sudo ./03-install-kubernetes.sh
    sudo ./04-config-kubeadm.sh  # Usar apenas no controlador
    sudo ./05-install-cni.sh  # Usar apenas no controlador
    ```

5. Reinicie o sistema após a aplicação dos scripts.

### Notas Importantes

- Certifique-se de ter backups adequados antes de executar esses scripts, pois eles realizam mudanças significativas no sistema.

- O encaminhamento de IP (ip forwarding) pode ter implicações de segurança. Certifique-se de entender as consequências antes de habilitá-lo.

### Importante:

- **Os scripts 04 e 05 devem ser executados apenas na máquina que atuará como controlador do cluster.**

- Estes scripts devem ser executados em todas as máquinas do cluster Kubernetes para garantir uma configuração uniforme. Certifique-se de seguir as instruções de uso em todas as máquinas antes de prosseguir.

---
