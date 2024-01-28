### Aqui estão algumas características e casos de uso comuns para DaemonSets:

## 1. Execução em Todos os Nós:

Um DaemonSet garante que pelo menos uma instância do pod seja executada em cada nó do cluster. Isso é útil para cenários nos quais você precisa executar um serviço ou agente em cada máquina, como logging, monitoramento, ou networking.

## 2. Cópia Única por Nó:

Cada nó tem exatamente uma cópia do pod associado ao DaemonSet. Se novos nós são adicionados ao cluster, novas instâncias do pod são automaticamente criadas nesses nós.

## 3. Escalabilidade Horizontal:

O DaemonSet é escalável horizontalmente. Se você aumentar o número de nós no cluster, o DaemonSet criará automaticamente novas instâncias do pod nos novos nós.


## 4. Atualizações e Rollbacks:

DaemonSets suportam atualizações e rollbacks, permitindo que você altere a versão ou a configuração do pod em execução em todos os nós do cluster de maneira controlada.


## 5. Exclusão de Nós:

Se um nó for removido do cluster, o DaemonSet automaticamente termina as instâncias do pod associado a esse nó.


Exemplo de YAML para um DaemonSet simples:

```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: meu-daemonset
spec:
  selector:
    matchLabels:
      app: meu-app
  template:
    metadata:
      labels:
        app: meu-app
    spec:
      containers:
      - name: meu-container
        image: minha-imagem:versao
```

Neste exemplo, um DaemonSet chamado "meu-daemonset" garante que um pod com o rótulo "app: meu-app" seja executado em cada nó do cluster. Este DaemonSet usa um template de pod para criar os pods correspondentes.