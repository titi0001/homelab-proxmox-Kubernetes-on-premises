# Load Balancer em Ambiente Bare-metal com MetalLB

Este repositório fornece instruções e configurações básicas para implementar um balanceador de carga em um ambiente bare-metal usando o MetalLB. O MetalLB é uma ferramenta específica para Kubernetes que permite a alocação de endereços IP externos para serviços no cluster.

## Requisitos

- Cluster Kubernetes em servidores bare-metal
- MetalLB instalado no cluster
- Conexão de rede entre os servidores

## Configuração

1. **Instalação do MetalLB:**

   Siga as instruções específicas do MetalLB para instalar a ferramenta no seu cluster Kubernetes. Geralmente, isso envolverá a aplicação de manifestos YAML.

```bash
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.12/config/manifests/metallb-native.yaml
```


2. **Configuração do Pools de IP:**

   Configure pools de IP no MetalLB para especificar quais endereços IP ele pode alocar. Isso pode ser feito através de configuração no arquivo de manifesto do MetalLB.

3. **Aplicação de LoadBalancer no Kubernetes:**

   Ao criar um serviço no Kubernetes, utilize o tipo `LoadBalancer` para que o MetalLB aloque automaticamente um endereço IP externo para o serviço.

4. **Teste de Conectividade:**

   Certifique-se de que todos os servidores estejam acessíveis a partir do MetalLB. Teste a conectividade entre o MetalLB e os servidores de backend.

#### Para calcular sua faixa de ip 

```bash
ip a #pegue o ip do sua interface de rede principal

sudo apt install sipcal
sipcal [IP/subnet] # copia os ip´s do Usable range 

sudo nano metallb-config.yaml
# coloca4 o range de ip 
```
5. Editar o configmap e aplicar a configuração

  metallb-config.yaml
   
