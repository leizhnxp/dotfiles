#!/usr/bin/env bash

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster

# 1. make sure k8s ready
# 2. make sure the ingress installed on k8s
# 3. make sure cli tools: kubectl and helm in operation workstation
# 4. install the Rancher helm chart

# 4.1 https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#1-add-the-helm-chart-repository
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

# 4.2 https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#2-create-a-namespace-for-rancher
kubectl create namespace cattle-system

# 4.3 https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#3-choose-your-ssl-configuration
# Here, where Rancher-generated Certificates are chosen, it's the default and there's no need to set any other options

# 4.4 https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#4-install-cert-manager
# If you have installed the CRDs manually instead of with the `--set installCRDs=true` option added to your Helm install command, you should upgrade your CRD resources before upgrading the Helm chart:
# kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/<VERSION>/cert-manager.crds.yaml

# Add the Jetstack Helm repository
helm repo add jetstack https://charts.jetstack.io

# Update your local Helm chart repository cache
helm repo update

# Install the cert-manager Helm chart
helm install cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --create-namespace \
    --set installCRDs=true


# 4.5 https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#5-install-rancher-with-helm-and-your-chosen-certificate-option
helm install rancher rancher-stable/rancher \
 --namespace cattle-system \
 --set hostname=rancher-on-ack.arrailgroup.com \
 --set bootstrapPassword=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12) \
 --set ingress.ingressClassName=nginx

