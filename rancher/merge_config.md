# Setup config

## Backup current config

cp ~/.kube/config ~/.kube/config.backup

## Merge all configs

KUBECONFIG=~/.kube/config:~/.kube/atlas_config:~/.kube/helios_config:~/.kube/controlpi_config:~/.kube/rancher_config kubectl config view --merge --flatten > ~/.kube/merged_config

## Replace current config 

mv ~/.kube/merged_config ~/.kube/config

copy token and url from kubeconfig of the clusters to the mergeed config

## Check all contexts

kubectl config get-contexts