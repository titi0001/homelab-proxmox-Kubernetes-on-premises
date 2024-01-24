#!/bin/bash

# Baixa o script de instalação do Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

# Dá permissão de execução ao script
chmod 700 00-install-helm.sh

# Executa o script para instalar o Helm
./00-install-helm.sh
