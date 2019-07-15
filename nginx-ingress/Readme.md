# Установка nginx-ingress

0) [Установите helm](../helm/)

1) Для работы в dev среде достаточно сделать

```
helm install stable/nginx-ingress --name dev-ingress
```

2) Для работы в production среде лучше ознакомится с [официальным репозиторием helm-чарта](https://github.com/helm/charts/tree/master/stable/nginx-ingress) где описываются переменные для установки. Ниже описана конфигурация ingress контроллера, в которой он развернут в трех копиях, с автоскейлигом до 11 ( файл prod.yaml в репозитории)

Пример файла:
```
controller:

  replicaCount: 3

  minAvailable: 1

  resources:
    limits:
      cpu: 500m
      memory: 256Mi
    requests:
      cpu: 200m
      memory: 128Mi

  autoscaling:
    enabled: true
    minReplicas: 3
    maxReplicas: 11
    targetCPUUtilizationPercentage: 50
    targetMemoryUtilizationPercentage: 50

  service:
    type: LoadBalancer

```

3) Потом установите контроллер с переменными из этого файла

```
helm install --name prod-ingress stable/nginx-ingress --values prod.yaml

```

4) В результате должен создаться контроллер, который будет установлен за Yandex Load Balancer .  IP адрес по которому доступен ingress будет доступен в поле external ip address сервиса , который создался вместе с контроллером - посмотреть можно тут 

```
kubectl get svc
```
