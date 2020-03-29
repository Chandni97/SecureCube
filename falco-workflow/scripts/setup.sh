#!/bin/bash

stat falco-config || exit
kubectl get nodes -o wide || exit
kubectl apply -f falco-account.yaml 
kubectl apply -f falco-service.yaml 
kubectl create configmap falco-config --from-file=falco-config
sleep 2
kubectl apply -f falco-daemonset-configmap.yaml
sleep 2
kubectl get pod
sleep 2
kubectl get pod
