## MinIO: Armazenamento de Objeto de Alto Desempenho para Ambientes de Nuvem e On-Premises

MinIO é um servidor de armazenamento de objetos de código aberto e de alto desempenho, projetado para ambientes de nuvem e on-premises. Ele oferece escalabilidade, durabilidade e desempenho excepcionais para armazenamento de dados não estruturados, como imagens, vídeos, arquivos de backup e muito mais.

### Principais Recursos

1. **Alta Performance**: MinIO é otimizado para oferecer alto desempenho, com suporte para transferência de dados rápida e paralela, garantindo tempos de resposta mínimos.

2. **Escalabilidade**: MinIO é altamente escalável, permitindo que você adicione e dimensione nós de armazenamento conforme necessário, sem interrupções no serviço.

3. **Durabilidade**: MinIO garante a durabilidade dos dados por meio de técnicas avançadas de redundância e distribuição de dados, garantindo a integridade dos dados mesmo em caso de falha de hardware.

4. **Compatibilidade com APIs S3**: MinIO oferece compatibilidade total com a API S3 da Amazon, permitindo que você use ferramentas e aplicativos existentes projetados para trabalhar com armazenamento de objetos S3.

5. **Segurança Avançada**: MinIO oferece recursos avançados de segurança, incluindo criptografia de dados em repouso e em trânsito, controle de acesso baseado em políticas e integração com sistemas de autenticação externos.

6. **Fácil Integração**: MinIO pode ser facilmente integrado com uma variedade de aplicativos e sistemas, graças à sua ampla compatibilidade com APIs e protocolos padrão.

### Casos de Uso Comuns

- **Armazenamento de Dados Não Estruturados**: MinIO é ideal para armazenar e gerenciar grandes volumes de dados não estruturados, como arquivos de mídia, arquivos de backup, logs e muito mais.

- **Armazenamento de Dados para Aplicações na Nuvem**: MinIO é uma escolha popular para armazenamento de dados para aplicativos nativos de nuvem, devido à sua escalabilidade, durabilidade e compatibilidade com APIs S3.

- **Armazenamento de Dados para Análise e Aprendizado de Máquina**: MinIO é frequentemente usado para armazenar dados para análise de big data e treinamento de modelos de aprendizado de máquina, devido à sua capacidade de lidar com grandes volumes de dados e oferecer alto desempenho.

### Como Usar o MinIO

1. **Instalação**: Você pode instalar o MinIO em um único nó ou em um cluster de nós para maior escalabilidade. O MinIO é distribuído como um único binário que pode ser executado em sistemas operacionais Linux, Windows e macOS.

2. **Configuração**: Após a instalação, você precisará configurar o MinIO com os parâmetros de configuração adequados, como nome de bucket, políticas de retenção, configurações de segurança, etc.

3. **Acesso aos Dados**: Depois de configurado, você pode acessar o MinIO por meio da interface da API S3 ou usando clientes compatíveis com S3, como o `awscli` ou bibliotecas de cliente S3 para sua linguagem de programação preferida.

4. **Gerenciamento de Dados**: Você pode usar as ferramentas fornecidas pelo MinIO ou desenvolver suas próprias para gerenciar e manipular os dados armazenados no MinIO, como fazer upload, download, exclusão e listagem de objetos.

O MinIO é uma escolha popular para armazenamento de objetos em ambientes de nuvem e on-premises, oferecendo desempenho excepcional, escalabilidade e durabilidade para uma variedade de casos de uso. Se você precisa de uma solução de armazenamento de objetos robusta e confiável, o MinIO é uma excelente opção.


## Como Usar o MinIO

### Baixar o Objeto MinIO

Baixe a definição de objeto do MinIO Kubernetes:

```bash
curl https://raw.githubusercontent.com/minio/docs/master/source/extra/examples/minio-dev.yaml -O
```

O arquivo descreve dois recursos do Kubernetes:

- Um novo namespace `minio-dev`.
- Um pod MinIO usando uma unidade ou volume no Nó de Trabalho para servir dados.

### Aplicar a Definição de Objeto MinIO

O comando a seguir aplica a configuração e implanta os objetos no Kubernetes:

```bash
kubectl apply -f minio-dev.yaml
```

A saída do comando deve ser semelhante ao seguinte:

```bash
namespace/minio-dev created
pod/minio created
```

Você pode verificar o estado do pod executando:

```bash
kubectl get pods -n minio-dev
```

A saída deve ser semelhante ao seguinte:

```bash
NAME  READY   STATUS  RESTARTS  AGE
minio 1/1     Running 0         77s
```

### Acessar Temporariamente a API e o Console do MinIO S3

Use o comando para encaminhar temporariamente o tráfego do pod MinIO para a máquina local:

```bash
kubectl port-forward pod/minio 9000 9090 -n minio-dev

```

O comando encaminha as portas do pod e para a porta correspondente na máquina local enquanto estiver ativo no shell. O comando só funciona enquanto estiver ativo na sessão do shell. O encerramento da sessão fecha as portas na máquina local.

Nota: As etapas a seguir deste procedimento pressupõem um comando ativo. Para configurar o acesso de longo prazo ao pod, configure o Ingress ou componentes de controle de rede semelhantes no Kubernetes para rotear o tráfego de e para o pod. A configuração do Ingress está fora do escopo desta documentação.

### Conectar-se ao Console do MinIO

Acesse o Console do MinIO abrindo um navegador na máquina local e navegando até http://127.0.0.1:9000. Inicie sessão na Consola com as credenciais minioadmin | minioadmin. Estas são as credenciais de utilizador raiz padrão.

# Conectar o Cliente MinIO (Opcional)

Se sua máquina local tiver instalado, você pode usar o cliente MinIO para autenticar e conectar-se à implantação do MinIO no Kubernetes.

## Configurar o Cliente MinIO

Use o seguinte comando para configurar um alias para o servidor MinIO:

```bash
mc alias set k8s-minio-dev http://127.0.0.1:9000 minioadmin minioadmin
```

## Verificar as Informações do Servidor MinIO

Você pode usar o seguinte comando para verificar as informações do servidor MinIO:

```bash
mc admin info k8s-minio-dev
```
Este comando fornecerá:

- O nome do alias
- O nome do host ou endereço IP e a porta do servidor MinIO
- A chave de acesso para um usuário do MinIO
- A chave secreta para um usuário MinIO
