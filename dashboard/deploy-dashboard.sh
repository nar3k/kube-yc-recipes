kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml



 sleep 1
 kubectl  apply -f ./admin-user.yaml

 sleep 1

 kubectl  apply -f ./bearer-token.yaml

 sleep 1
 kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')


 kubectl proxy

# перейдите по ссылке
# http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login
