# Configuração do Kubernetes - Scripts

Estes scripts foram desenvolvidos para realizar configurações específicas em máquinas de um cluster Kubernetes. Eles devem ser executados em todas as máquinas do cluster para garantir a consistência da configuração.

## Script Bash para Configuração do Kubernetes

### Descrição

O script bash `configurar_kubernetes.sh` realiza as seguintes ações:

1. Desativa a troca (swap) no sistema.
2. Modifica o arquivo `sysctl.conf` para habilitar o encaminhamento de IP.
3. Edita o arquivo `k8s.conf` para adicionar o módulo `br_netfilter`.
4. Reinicia o sistema para aplicar as alterações.

### Uso

#### Pré-requisitos

- Conexão SSH com a máquina do cluster.

#### Passos

1. Conecte-se à máquina do cluster usando SSH:

    ```bash
    ssh usuario@endereco-da-maquina
    ```
2.  Copiar os scripts para a vm:
       ```bash
    scp (script).sh /root/
    ```

3. Torne os scripts executáveis:

    ```bash
    chmod +x (script).sh 
    ```

4. Execute o script com privilégios de superusuário:

    ```bash
    sudo ./(script).sh
    ```

5. Reiniciar o sistem apos a aplicação dos scripts

### Notas Importantes

- Certifique-se de ter backups adequados antes de executar este script, pois ele realiza mudanças significativas no sistema.

- O encaminhamento de IP (ip forwarding) pode ter implicações de segurança. Certifique-se de entender as consequências antes de habilitá-lo.

### Importante: 
Estes scripts devem ser executados em todas as máquinas do cluster Kubernetes para garantir uma configuração uniforme. Certifique-se de seguir as instruções de uso em todas as máquinas antes de prosseguir.

---

