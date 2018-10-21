#!/bin/bash

case "$1" in
  deploy)
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
    ;;
  proxy)
    kubectl proxy
    ;;
  open)
    open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
    ;;
  account)
    kubectl apply -f service-account.yml
    kubectl apply -f role-binding.yml
    echo "***** Tokens *****"
    kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
    ;;
  *)
    echo "Usage: dashboard.sh <deploy|proxy|open>"
    exit 1
esac

