# intro

## Field selector

kubectl get services --all-namespaces -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name,TYPE:.spec.type | while read ns name type; do
    if [ "$type" == "LoadBalancer" ]; then
        echo "Namespace: $ns, Name: $name, Type: $type"
    fi
done


