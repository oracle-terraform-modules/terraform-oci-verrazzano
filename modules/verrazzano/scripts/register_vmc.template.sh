#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/clusters/${cluster}.registered ];  then
  echo "Generating registration manifest for ${cluster}"
  kubectx ${admin_ctx}

  kubectl get secret verrazzano-cluster-${cluster}-manifest \
    -n verrazzano-mc \
    -o jsonpath={.data.yaml} | base64 --decode > $HOME/vz/clusters/register_${cluster}.yaml

  kubectx ${cluster}
  kubectl apply -f $HOME/vz/clusters/register_${cluster}.yaml
  echo "${cluster} registered with ${admin_ctx}."
  touch $HOME/vz/clusters/${cluster}.registered
else
  echo "${cluster} already registered"
fi