#登录k8s容器，参数为容器名，模糊匹配查询到的第一个容器
pod_name=`kubectl get pods -n cloud-test|grep $1`
pod_array=($pod_name)
echo ${pod_array[0]}
kubectl exec -it ${pod_array[0]} -n cloud-test /bin/bash
