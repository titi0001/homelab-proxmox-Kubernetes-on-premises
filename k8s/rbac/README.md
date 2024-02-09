# Controle de Acesso Baseado em Função (RBAC) no Kubernetes

O Controle de Acesso Baseado em Função (RBAC) no Kubernetes é uma prática recomendada para controlar e gerenciar o acesso aos recursos do cluster. Este documento fornece uma visão geral e orientações básicas sobre o uso do RBAC no Kubernetes.

## 1. O que é RBAC?

O RBAC é um mecanismo de controle de acesso que permite definir permissões granulares para usuários e serviços no Kubernetes. Ele ajuda a implementar o princípio do menor privilégio, garantindo que as entidades tenham apenas as permissões necessárias para realizar tarefas específicas.

## 2. Componentes do RBAC no Kubernetes

- **Role (Regra):** Define permissões em nível de namespace para recursos específicos.
- **ClusterRole:** Define permissões em nível de cluster para recursos globais.
- **RoleBinding:** Associa um Role a um usuário ou grupo em um namespace específico.
- **ClusterRoleBinding:** Associa um ClusterRole a um usuário ou grupo em todo o cluster.

## 3. Princípio de Menor Privilégio

O RBAC no Kubernetes segue o princípio de menor privilégio, garantindo que as permissões atribuídas sejam mínimas para realizar tarefas específicas. Isso contribui para uma postura mais segura e reduz o risco de exploração de falhas de segurança.

## 4. Exemplo Prático

Suponha que você queira conceder permissões de leitura e listagem de pods em um namespace específico. Você pode criar um Role com essas permissões e, em seguida, associar esse Role a um usuário usando um RoleBinding.

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: exemplo-namespace
  name: leitura-pods
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: leitura-pods-binding
  namespace: exemplo-namespace
subjects:
- kind: User
  name: usuario-exemplo
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: leitura-pods
  apiGroup: rbac.authorization.k8s.io
```

## 5. Integração com Autenticação

O RBAC funciona em conjunto com os sistemas de autenticação do Kubernetes, como tokens de serviço, certificados, ou outros métodos suportados.

## 6. Personalização Avançada

Além das regras básicas, o Kubernetes oferece recursos avançados, como a criação de regras personalizadas, roles agrupadas (Role Aggregation), e a definição de regras globais.

### Esse documento é um guia inicial sobre o RBAC no Kubernetes. Para obter informações mais detalhadas e casos de uso específicos, consulte a documentação oficial do Kubernetes sobre RBAC.