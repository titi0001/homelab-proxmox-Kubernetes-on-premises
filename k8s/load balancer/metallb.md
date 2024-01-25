# MetalLB - Balanceador de Carga para Clusters Kubernetes em Hardware Bare Metal

## Visão Geral

O MetalLB é uma implementação de balanceador de carga projetada para expor serviços em um cluster Kubernetes executando em hardware bare metal. Ele fornece uma maneira de alocar endereços IP externos para serviços, geralmente utilizado em ambientes onde um balanceador de carga dedicado não está disponível.

## Recursos

- **Modo Layer 2:** O MetalLB suporta um modo Layer 2, no qual ele opera na camada de enlace de dados, permitindo a alocação de endereços IP de uma faixa específica para seus serviços.

- **Compatibilidade:** Funciona perfeitamente com o Kubernetes e se integra ao tipo de serviço padrão `LoadBalancer`.

- **Pools de Endereços:** O MetalLB permite que você defina pools de endereços dos quais os endereços IP externos são atribuídos aos serviços.

## Modo Layer 2

No MetalLB, o modo Layer 2 refere-se à capacidade de alocar endereços IP na camada de enlace de dados. Isso é particularmente útil em ambientes onde balanceadores de carga em nuvem tradicionais não estão disponíveis, e os endereços IP externos precisam ser gerenciados na rede local.

O modo Layer 2 do MetalLB opera respondendo a solicitações ARP (Protocolo de Resolução de Endereços) para os endereços IP alocados, garantindo o roteamento adequado do tráfego externo para os serviços em execução no cluster Kubernetes.

Para obter mais informações sobre o MetalLB e suas capacidades, consulte a [documentação oficial do MetalLB](https://kubernetes.github.io/ingress-nginx/deploy/baremetal/)