## Descrição dos Recursos do Ingress-Nginx

![Minhas Imagem](/img/ingress-nginx.png){width=700 height=250}

### Pods

## 1. Pod: ingress-nginx-admission-create-ng962

Estado: 0/1 Completed
Reinícios: 0
Idade: 15 horas
Descrição: Pod responsável pela criação de admissões relacionadas ao Ingress-Nginx. Completou com sucesso.
Pod: ingress-nginx-admission-patch-hlxlt

## 2. Pod: ingress-nginx-admission-patch-hlxlt

Estado: 0/1 Completed
Reinícios: 0
Idade: 15 horas
Descrição: Pod responsável pela aplicação de patches nas admissões do Ingress-Nginx. Completou com sucesso.
Pod: ingress-nginx-controller-66d9cb869b-hxkwn

## 3. Pod: ingress-nginx-controller-66d9cb869b-hxkwn 

Estado: 1/1 Running
Reinícios: 0
Idade: 15 horas
Descrição: Pod que hospeda o controlador principal do Ingress-Nginx, responsável pelo roteamento do tráfego com base nas regras de Ingress.
Serviços
Service: ingress-nginx-controller

### Serviços

## 1. Service: ingress-nginx-controller

Tipo: NodePort
Cluster IP: 10.107.54.190
External IP: Nenhum
Portas Expostas: 80:30767/TCP, 443:32345/TCP
Idade: 15 horas
Descrição: Serviço que expõe o controlador Ingress-Nginx para o tráfego externo.
Service: ingress-nginx-controller-admission

## 2. Service: ingress-nginx-controller-admission

Tipo: ClusterIP
Cluster IP: 10.103.175.154
External IP: Nenhum
Portas Expostas: 443/TCP
Idade: 15 horas
Descrição: Serviço usado para admissões relacionadas ao Ingress-Nginx.


### Deployments

## 1 Deployment: ingress-nginx-controller

Pronto/Total: 1/1
Atualizado: 1
Disponível: 1
Idade: 15 horas
Descrição: Implantação que gerencia a execução do Pod do controlador Ingress-Nginx.

### ReplicaSet

## 1. ReplicaSet: ingress-nginx-controller-66d9cb869b
Desejado/Atual/Pronto: 1/1/1
Idade: 15 horas
Descrição: Conjunto de réplicas que garante que haja uma instância do Pod do controlador Ingress-Nginx em execução.

### Jobs

## 1. Job: ingress-nginx-admission-create

Completos/Duração/Idade: 1/1/15 horas
Descrição: Job responsável pela criação de admissões relacionadas ao Ingress-Nginx.
Job: ingress-nginx-admission-patch

## 2. Completos/Duração/Idade: 1/1/15 horas
Descrição: Job responsável pela aplicação de patches nas admissões do Ingress-Nginx.
Esses recursos formam a infraestrutura do Ingress-Nginx no seu cluster Kubernetes, fornecendo funcionalidades cruciais para o roteamento de tráfego HTTP/HTTPS e a gestão de admissões relacionadas ao Ingress.

Esses recursos formam a infraestrutura do Ingress-Nginx no seu cluster Kubernetes, fornecendo funcionalidades cruciais para o roteamento de tráfego HTTP/HTTPS e a gestão de admissões relacionadas ao Ingress.