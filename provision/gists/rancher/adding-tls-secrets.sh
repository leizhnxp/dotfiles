#!/usr/bin/env bash

# Usage: ./adding-tls-secrets.sh <path-to-cert> <path-to-key>
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path-to-cert> <path-to-key>"
    exit 1
fi

# ref https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/resources/add-tls-secrets

kubectl -n cattle-system create secret tls tls-rancher-ingress \
    --cert=$1 \
      --key=$2
