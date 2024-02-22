# MinIO Client (mc): Uma Alternativa Moderna para Manipulação de Dados

O MinIO Client (mc) é uma ferramenta de linha de comando que fornece uma alternativa moderna aos comandos UNIX como ls, cat, cp, mirror e diff, com suporte para sistemas de arquivos e serviços de armazenamento em nuvem compatíveis com a Amazon S3.

O mc é construído para compatibilidade com a API S3 da AWS e é testado com o MinIO e o AWS S3 para funcionalidade e comportamento esperados.

O MinIO não fornece garantias para outros serviços compatíveis com o S3, pois a implementação da API S3 é desconhecida e, portanto, não suportada. Embora os comandos mc possam funcionar conforme documentado, qualquer uso desse tipo é por sua conta e risco.

O mc tem a seguinte sintaxe:

```bash
mc [GLOBALFLAGS] COMMAND --help
```

Veja o Resumo Rápido dos Comandos para uma lista de comandos suportados.

## Licença AGPLv3

O mc é software gratuito e de código aberto (FOSS) licenciado sob AGPLv3.

Aplicações que integram o mc podem acionar requisitos de conformidade AGPLv3. O licenciamento comercial do MinIO é a melhor opção para aplicativos que acionam obrigações AGPLv3 onde a disponibilização do aplicativo em código aberto não é uma opção.

## Alinhamento de Versão com o Servidor MinIO

O MinIO Client é lançado separadamente do Servidor MinIO.

Para melhor funcionalidade e compatibilidade, use uma versão do MinIO Client lançada próximo à versão do seu Servidor MinIO. Por exemplo, uma versão do MinIO Client lançada no mesmo dia ou posterior à sua versão do Servidor MinIO.

Você pode instalar uma versão do MinIO Client que seja mais recente do que a versão do Servidor MinIO. No entanto, se a versão do MinIO Client se afastar muito da versão do Servidor MinIO, você pode ver aumento de avisos ou erros como resultado das diferenças. Por exemplo, enquanto as APIs principais do S3 em torno da cópia (mc cp) podem permanecer inalteradas, alguns recursos ou flags podem estar disponíveis ou estáveis apenas se as versões do cliente e do servidor estiverem alinhadas.

## Início Rápido

### 1) Instalar o mc

Instale a ferramenta de linha de comando mc na máquina host. Clique na aba que corresponde ao sistema operacional ou ambiente da máquina host:

#### Linux

Os seguintes comandos adicionam uma extensão temporária ao seu PATH do sistema para executar a utilidade mc. Consulte as instruções do seu sistema operacional para fazer modificações permanentes no seu PATH do sistema.

Alternativamente, execute o mc navegando até a pasta pai e executando ./mc --help

##### 64-bit Intel

```bash

markdown
Copy code
# MinIO Client (mc): Uma Alternativa Moderna para Manipulação de Dados

O MinIO Client (mc) é uma ferramenta de linha de comando que fornece uma alternativa moderna aos comandos UNIX como ls, cat, cp, mirror e diff, com suporte para sistemas de arquivos e serviços de armazenamento em nuvem compatíveis com a Amazon S3.

O mc é construído para compatibilidade com a API S3 da AWS e é testado com o MinIO e o AWS S3 para funcionalidade e comportamento esperados.

O MinIO não fornece garantias para outros serviços compatíveis com o S3, pois a implementação da API S3 é desconhecida e, portanto, não suportada. Embora os comandos mc possam funcionar conforme documentado, qualquer uso desse tipo é por sua conta e risco.

O mc tem a seguinte sintaxe:

```bash
mc [GLOBALFLAGS] COMMAND --help
```

Copy code

Veja o Resumo Rápido dos Comandos para uma lista de comandos suportados.

## Licença AGPLv3

O mc é software gratuito e de código aberto (FOSS) licenciado sob AGPLv3.

Aplicações que integram o mc podem acionar requisitos de conformidade AGPLv3. O licenciamento comercial do MinIO é a melhor opção para aplicativos que acionam obrigações AGPLv3 onde a disponibilização do aplicativo em código aberto não é uma opção.

## Alinhamento de Versão com o Servidor MinIO

O MinIO Client é lançado separadamente do Servidor MinIO.

Para melhor funcionalidade e compatibilidade, use uma versão do MinIO Client lançada próximo à versão do seu Servidor MinIO. Por exemplo, uma versão do MinIO Client lançada no mesmo dia ou posterior à sua versão do Servidor MinIO.

Você pode instalar uma versão do MinIO Client que seja mais recente do que a versão do Servidor MinIO. No entanto, se a versão do MinIO Client se afastar muito da versão do Servidor MinIO, você pode ver aumento de avisos ou erros como resultado das diferenças. Por exemplo, enquanto as APIs principais do S3 em torno da cópia (mc cp) podem permanecer inalteradas, alguns recursos ou flags podem estar disponíveis ou estáveis apenas se as versões do cliente e do servidor estiverem alinhadas.

## Início Rápido

### 1) Instalar o mc

Instale a ferramenta de linha de comando mc na máquina host. Clique na aba que corresponde ao sistema operacional ou ambiente da máquina host:

#### Linux

Os seguintes comandos adicionam uma extensão temporária ao seu PATH do sistema para executar a utilidade mc. Consulte as instruções do seu sistema operacional para fazer modificações permanentes no seu PATH do sistema.

Alternativamente, execute o mc navegando até a pasta pai e executando ./mc --help

##### 64-bit Intel

```bash
curl https://dl.min.io/client/mc/release/linux-amd64/mc
--create-dirs
-o $HOME/minio-binaries/mc

chmod +x $HOME/minio-binaries/mc
export PATH=$PATH:$HOME/minio-binaries/

mc --help
```    

