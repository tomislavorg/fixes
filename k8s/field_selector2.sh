kubectl get services --all-namespaces -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name,TYPE:.spec.type,IP:.status.loadBalancer.ingress[0].ip | while read -r ns name type ip; do
    if [ "$type" == "LoadBalancer" ]; then
        if [ -z "$ip" ] || [ "$ip" == "<none>" ]; then
            ip=$(kubectl get service "$name" -n "$ns" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
            if [ -z "$ip" ]; then
                ip="Pending"
            fi
        fi
        echo "Namespace: $ns, Name: $name, Type: $type, IP: $ip"
    fi
done