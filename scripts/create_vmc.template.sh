#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/clusters/vmc_${cluster}.completed ]; then
  echo "Creating VMC in admin for ${cluster}"
  kubectx admin
  sed -i -e "s?CLUSTER?${cluster}?g" $HOME/vz/clusters/vmc_${cluster}.yaml
  kubectl apply -f $HOME/vz/clusters/vmc_${cluster}.yaml
  kubectl wait --for=condition=Ready vmc ${cluster} -n verrazzano-mc
  touch $HOME/vz/clusters/vmc_${cluster}.completed
else
  echo "VMC ${cluster} already created"
fi