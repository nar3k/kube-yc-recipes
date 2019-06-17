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


## Инструкции

[Установка и запуск dashboard](docs/dashboard)
