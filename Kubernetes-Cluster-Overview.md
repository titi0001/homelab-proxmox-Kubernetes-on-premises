# Kubernetes Cluster Overview

Este repositório fornece uma visão geral das principais partes de um cluster Kubernetes, destacando os componentes essenciais para o gerenciamento eficiente de contêineres e aplicativos distribuídos.

## Componentes do Nó Mestre (Master Node)

- **kube-apiserver:** Componente que expõe a API do Kubernetes.
- **etcd:** Armazém de dados distribuído para configuração do cluster.
- **kube-scheduler:** Responsável por agendar os pods nos nós do cluster.
- **kube-controller-manager:** Gerencia controladores que regulam o estado do sistema.

## Componentes do Nó (Node)

- **kubelet:** Agente que comunica com o kube-apiserver e garante que os contêineres estejam em execução em um nó.
- **kube-proxy:** Mantém regras de rede no nó. Permite a comunicação entre os pods.

## Pods

- A menor unidade no modelo de objeto do Kubernetes. Contém um ou mais contêineres e compartilha recursos de rede e armazenamento.

## ReplicaSets

- Garante que um número especificado de réplicas de pods esteja sempre em execução.

## Deployments

- Gerencia ReplicaSets e fornece atualizações declarativas para os aplicativos.

## Services

- Abstração que define um conjunto lógico de pods e uma política de acesso à rede para esses pods.

## Volumes

- Fornece armazenamento persistente para os contêineres. Permite que os dados persistam mesmo quando os pods são movidos ou recriados.

## Namespace

- Fornece um escopo para nomes de recursos no cluster. Ajuda a organizar e isolar recursos.

## ConfigMaps e Secrets

- Permitem separar a configuração do aplicativo dos contêineres, permitindo uma melhor gestão e segurança.

## Ingress

- Gerencia o acesso externo aos serviços no cluster, permitindo roteamento com base em regras.

## kubectl

- Interface de linha de comando (CLI) para interagir com o cluster Kubernetes.

Este guia básico fornece uma visão geral das principais partes do Kubernetes. Consulte a documentação oficial do Kubernetes para obter informações mais detalhadas e avançadas: [Documentação do Kubernetes](https://kubernetes.io/docs/).
