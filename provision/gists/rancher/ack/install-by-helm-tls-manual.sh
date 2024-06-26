#!/usr/bin/env bash

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster

if [ $# -eq 0 ]; then
  echo "Error: No hostname provided"
  exit 1
fi

set -e

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#prerequisites
# installed k8s cluster, also aliyun ACK
# installed ingress controller , controller , controller
# installed cli tools, kubectl, helm


# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#install-the-rancher-helm-chart

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#1-add-the-helm-chart-repository
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#2-create-a-namespace-for-rancher
kubectl get namespace cattle-system &> /dev/null || kubectl create namespace cattle-system

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#2-create-a-namespace-for-rancher
# use TLS termination on an external load balancer. https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/installation-references/helm-chart-options#external-tls-termination

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#4-install-cert-manager
# skip install cert-manager, because it is already installed

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#5-install-rancher-with-helm-and-your-chosen-certificate-option
# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster/rancher-on-amazon-eks#8-install-the-rancher-helm-chart

md5_hash=$(date | md5sum) 

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=$1 \
  --set bootstrapPassword=${md5_hash:0:32} \
  --set ingress.ingressClassName=ack-nginx \
  --set ingress.tls.source=secret

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#6-verify-that-the-rancher-server-is-successfully-deployed
kubectl -n cattle-system rollout status deploy/rancher

