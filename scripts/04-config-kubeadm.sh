#!/bin/bash

# Obtém o endereço IP da máquina
IP_ADDRESS=$(hostname -I | cut -d' ' -f1)

# Executa o comando kubeadm init com o endereço IP da máquina
sudo kubeadm init --pod-network-cidr=10.10.0.0/16 --apiserver-advertise-address=$IP_ADDRESS
