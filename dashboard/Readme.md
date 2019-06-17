# Установка и запуск kubernetes dashboard

## Установка

Выполните скрипт deploy-dashboard.sh ( скрипт простой, можете посмотреть на команды что он выполняет зайдя в него)

```
cd dashboard
./deploy-dashboard.sh
```

## Запуск и работа

Запускать dashboard лучше через kubeproxy ввиду соображений безопаности



1) В одном окне выполните

```
kubectl proxy
```
2) перейдите по странице

```
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login
```

3) Выберите авторизацию по token

Значение токена можно найти введя команду
```
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
```
