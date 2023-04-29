#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/certs/vz_cert_${cluster}.completed ]; then
  echo "Creating cert secret in ${cluster}"
  kubectx ${cluster}  

  CA_CERT=$(kubectl \
    get secret verrazzano-tls \
    -n verrazzano-system \
    -o jsonpath="{.data.ca\.crt}" | base64 --decode)
	
  kubectl create secret generic "ca-secret-${cluster}" \
  -n verrazzano-mc \
  --from-literal=cacrt="$CA_CERT" \
  --dry-run=client -o yaml > $HOME/vz/certs/${cluster}-secret.yaml

  kubectx admin
  kubectl apply -f $HOME/vz/certs/${cluster}-secret.yaml  
else
  echo "Cert secret already created in ${cluster}"
fi

