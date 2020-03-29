#!/bin/bash -x

# Probably you ran this first
# kubectl delete configmap falco-config; kubectl create configmap falco-config --from-file=falco-config


pods=$(kubectl get pod -l app=falco-example | cut -d " " -f 1 | grep -v NAME)


for pod in $pods
do
    kubectl exec -it $pod -- bash -c "kill -s HUP 1"
done
sleep 1

kubectl logs -l app=falco-example

