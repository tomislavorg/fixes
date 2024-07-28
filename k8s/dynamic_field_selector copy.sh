#!/bin/bash

# Function to print usage
print_usage() {
  echo "Usage: $0 [--context CONTEXT_NAME] [--kubeconfig KUBECONFIG_PATH]"
  echo "If no arguments are provided, the current context will be used."
}

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --context) CONTEXT="$2"; shift ;;
    --kubeconfig) KUBECONFIG="$2"; shift ;;
    -h|--help) print_usage; exit 0 ;;
    *) echo "Unknown parameter passed: $1"; print_usage; exit 1 ;;
  esac
  shift
done

# Prepare kubectl command with context or kubeconfig if provided
KUBECTL_CMD="kubectl"
if [ ! -z "$CONTEXT" ]; then
  KUBECTL_CMD="$KUBECTL_CMD --context $CONTEXT"
elif [ ! -z "$KUBECONFIG" ]; then
  KUBECTL_CMD="$KUBECTL_CMD --kubeconfig $KUBECONFIG"
fi

# Function to print a line
print_line() {
  printf '%.0s-' {1..80}
  echo
}

# Function to get LoadBalancer services
get_loadbalancer_services() {
  # Print header
  print_line
  max_name_len=0  # Initialize for longest name tracking
  while read -r ns name type ip; do
    # ... existing logic for checking type and handling IP ...
    name_len=${#name}
    if [[ $name_len -gt $max_name_len ]]; then
      max_name_len=$name_len
    fi
    # ... remaining logic for printing the service ...
  done

  printf "| %-$(($max_name_len + 2))s | %-20s | %-15s | %-15s |\n" "NAMESPACE" "NAME" "TYPE" "IP"
  print_line

  $KUBECTL_CMD get services --all-namespaces -o custom-columns=NAMESPACE:.metadata.namespace,NAME:.metadata.name,TYPE:.spec.type,IP:.status.loadBalancer.ingress[0].ip | while read -r ns name type ip; do
    if [ "$type" == "LoadBalancer" ]; then
      if [ -z "$ip" ] || [ "$ip" == "<none>" ]; then
        ip=$($KUBECTL_CMD get service "$name" -n "$ns" -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
        if [ -z "$ip" ]; then
          ip="Pending"
        fi
      fi
      printf "| %-$(($max_name_len + 2))s | %-20s | %-15s | %-15s |\n" "$ns" "$name" "$type" "$ip"
    fi
  done

  # Print footer
  print_line
}

# Main execution
echo "Fetching LoadBalancer services..."
get_loadbalancer_services
