#!/bin/bash

# Solicita ao usuário que insira os dados necessários
read -p "Digite o nome do cluster: " nome_do_cluster
read -p "Digite o endereço do servidor: " endereco_do_servidor
read -p "Digite o nome do contexto: " nome_do_contexto
read -p "Digite o nome do usuário: " nome_do_usuario
read -p "Digite o seu token: " seu_token

# Executa os comandos do kubectl com os dados fornecidos
kubectl config set-cluster $nome_do_cluster --server=$endereco_do_servidor --insecure-skip-tls-verify
kubectl config set-credentials $nome_do_usuario --token=$seu_token
kubectl config set-context $nome_do_contexto --cluster=$nome_do_cluster --user=$nome_do_usuario
kubectl config use-context $nome_do_contexto

echo "Configuração concluída com sucesso!"
