#!/bin/bash

sudo apt-get install -y apt-transport-https ca-certificates curl
# Adiciona a chave GPG do repositório Kubernetes
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg

# Adiciona o repositório Kubernetes
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Atualiza a lista de pacotes
sudo apt-get update

# Instala os pacotes do Kubernetes
sudo apt-get install -y kubelet kubeadm kubectl

# Impede que as versões instaladas sejam atualizadas automaticamente
sudo apt-mark hold kubelet kubeadm kubectl
