# Рецепты для работы с k8s яндекс облаке

## Начало работы

1) Установите yc cli и kubectl ( версия не ниже 1.13 ).
Проверьте что кластер создан

```
yc managed-kubernetes cluster list
```

2) Получите ваш конфиг кластера
```
yc managed-kubernetes cluster get-credentials k8s-dev --external
```

3) Выкачайте этот репозиторий

```
git clone https://github.com/nar3k/kube-yc-recipes.git
cd kube-yc-recipes
```


## Инструкции

[Установка и запуск dashboard](dashboard/)
[Установка Helm 2+](helm/)
[Установка nginx-ingress](nginx-ingress/)
