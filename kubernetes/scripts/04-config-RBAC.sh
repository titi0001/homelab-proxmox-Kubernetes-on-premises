#!/bin/bash

# Script para configurar RBAC no Kubernetes

# Definir variáveis
NAMESPACE="seu-namespace"
NOME_DO_PAPEL="nome-do-papel"
NOME_DO_VINCULO="nome-do-vinculo"
NOME_DO_USUARIO="nome-do-usuario"

# Criar arquivo YAML para o papel
cat <<EOF > role.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: $NAMESPACE
  name: $NOME_DO_PAPEL
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "create", "delete"]
EOF

# Criar arquivo YAML para o vinculo de papel
cat <<EOF > role-binding.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  namespace: $NAMESPACE
  name: $NOME_DO_VINCULO
subjects:
- kind: User
  name: $NOME_DO_USUARIO
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: $NOME_DO_PAPEL
  apiGroup: rbac.authorization.k8s.io
EOF

# Aplicar as configurações no cluster Kubernetes
kubectl apply -f role.yaml
kubectl apply -f role-binding.yaml

# Limpar arquivos temporários
rm role.yaml role-binding.yaml

echo "RBAC configurado com sucesso para o namespace $NAMESPACE!"
