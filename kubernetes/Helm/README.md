# Helm - Guia de Instalação e Utilização

O Helm é uma poderosa ferramenta de gerenciamento de pacotes para Kubernetes, que facilita a implantação e o gerenciamento de aplicativos em um cluster Kubernetes. Este guia fornecerá instruções passo a passo sobre como instalar o Helm e começar a usá-lo.

## Pré-requisitos

Antes de começar, certifique-se de que você tenha os seguintes pré-requisitos instalados:

- Kubernetes Cluster
- Kubectl (Kubernetes Command-Line Tool)
- Helm Binário

## Instalação do Helm

1. **instalar o Helm:**

```bash
   chmod +x 00-install-helm.sh
   ./00-install-helm.sh
```


## Utilizando o Helm

Agora que o Helm está instalado, você pode começar a usá-lo para gerenciar seus aplicativos no Kubernetes.

## 1. Adicionar repositórios

Helm usa repositórios para armazenar e compartilhar gráficos (charts). Você pode adicionar repositórios usando o comando:

```bash
   helm repo add nome-repositorio URL-do-repositorio
```

## 2. Pesquisar gráficos

Você pode procurar gráficos disponíveis em um repositório usando:

```bash
helm search repo nome-repositorio/pacote
```

## 3. Instalar um gráfico

Instale um gráfico em seu cluster usando:

```bash
helm install nome-do-release nome-repositorio/pacote
```

## 4. Atualizar um gráfico

Atualize um gráfico instalado para a versão mais recente:

```bash
helm upgrade nome-do-release nome-repositorio/pacote
```
## 5. Remover um gráfico

Remova um gráfico instalado do cluster:

```bash
helm uninstall nome-do-release
```

## 6. Listar gráficos instalados

Veja os gráficos instalados no cluster:

```bash
helm list
```

## 7. Criar seus próprios gráficos

Você pode criar seus próprios gráficos personalizados. Consulte a documentação oficial do [Helm](https://helm.sh/)
 para obter detalhes sobre como criar seus próprios gráficos.

### Conclusão
Agora você está pronto para começar a usar o Helm para gerenciar seus aplicativos no Kubernetes. Explore os recursos avançados do Helm conforme necessário, e consulte a documentação oficial para obter mais informações.