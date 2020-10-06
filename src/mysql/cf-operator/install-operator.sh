
kubectl create namespace cf-operator

helm install cf-operator \
     --namespace cf-operator \
     --set "global.operator.watchNamespace=kubecf" \
     --set "image.org=quarkz" \
     --set "image.tag=v4.5.6-dirty-0.gffc6f942" \
     --set "quarks-job.image.org=quarkz" \
     --set "quarks-job.image.tag=v0.0.1169" \
     --set "operator.boshDNSDockerImage=coredns/coredns:latest" \
     cf-operator-4.5.6+dirty-0.gffc6f942.tgz


