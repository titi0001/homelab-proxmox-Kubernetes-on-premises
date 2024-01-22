#!/bin/bash

# Verifica se o script é executado como superusuário (root)
if [[ $EUID -ne 0 ]]; then
   echo "Este script deve ser executado como superusuário" 
   exit 1
fi

# Configuração do Netplan
NETPLAN_CONFIG_FILE="/etc/netplan/01-netcfg.yaml"
NETPLAN_CONFIG_CONTENT=$(cat <<EOL
network:
    version: 2
    ethernets:
        eth0:
            addresses: [YOUR IP/]
            nameservers:
                addresses: [YOUR DNS]
            routes:
                - to: default
                  via: 0.0.0.
EOL
)

# Aplica as configurações do Netplan
echo "$NETPLAN_CONFIG_CONTENT" > "$NETPLAN_CONFIG_FILE"
netplan apply

# Exibe mensagem de conclusão
echo "Configuração do Netplan aplicada com sucesso."
