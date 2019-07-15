# Установка helm 2.+


1) Переключитесь в ваш текущий кластер с помощью kubectl
```
yc k8s cluster get-credentials k8s-dev --external
```
2) Скачайте и поставьте helm c [официального сайта](helm.sh)

3) Создайте сервисный аккаунт
```
cat > create-sa.yaml <<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: tiller
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: tiller
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: tiller
    namespace: kube-system
EOF

kubectl apply -f create-sa.yaml
```
4) Установите helm с этим SA
helm init --upgrade --service-account tiller
