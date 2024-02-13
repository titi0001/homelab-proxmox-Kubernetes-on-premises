# Instalação do NGINX Suite no Kubernetes

Este guia fornece instruções passo a passo para instalar o NGINX Suite em um ambiente Kubernetes utilizando o Instance Manager. O NGINX Suite é uma solução completa que oferece recursos avançados de balanceamento de carga, proxy reverso, segurança, monitoramento e muito mais.

## Pré-requisitos

Antes de começar, certifique-se de ter o seguinte:

- Um cluster Kubernetes configurado e funcional.
- Permissões de administrador para o cluster.
- Acesso ao terminal e ao cliente `kubectl` para interagir com o Kubernetes.
- Versão do tar 1.20 ou posterior.
- OpenSSL 1.1.1 ou posterior.
- Kubernetes 1.21.3 ou posterior (linux/amd64).
- Docker 20.10 ou posterior (linux/amd64).
- Um registro privado do Docker.

## Passos de Instalação

Siga os passos abaixo para instalar o NGINX Suite no Kubernetes:

1. Adicione o repositório do NGINX Stable Helm:

```bash
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
```

## Opção 1: Instalação com Helm

1. Instale o Instance Manager usando o Helm:

```bash
helm install nginx-ingress nginx-stable/nginx-ingress
```

## Opção 2: Instalação manual


1. Clone o repositório do Instance Manager:

```bash
git clone https://github.com/nginxinc/kubernetes-ingress.git
cd kubernetes-ingress/deploy-instance-manager
```
2. Crie um namespace para o NGINX Suite:

```bash
kubectl create namespace nginx-system
```

3. Aplique as configurações YAML do Instance Manager:

```bash
kubectl apply -f .
```


## Mais detalhes 

[Nginx-suite](https://docs.nginx.com/nginx-management-suite/installation/kubernetes/deploy-instance-manager/)