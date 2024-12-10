# intro

## Node recovery

## Use sudo and also the kubeconfig for the cluster on the node, mostly node1 re-registering is sufficient

curl --insecure -sfL https://rancher.home/v3/import/m6qcw7c9znnbbj7qgd6rhwzvvhv7d7xjqlzg9c9nbjfx7d4f2w8hgl_c-m-l75gh8qp.yaml | sudo kubectl --kubeconfig /etc/rancher/rke2/rke2.yaml apply -f -

## Admin

KUBECONFIG=~/.kube/config
kubectl --kubeconfig $KUBECONFIG -n cattle-system exec $(kubectl --kubeconfig $KUBECONFIG -n cattle-system get pods -l app=rancher --no-headers | head -1 | awk '{ print $1 }') -c rancher -- reset-password
