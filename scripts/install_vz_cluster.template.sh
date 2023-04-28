#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/clusters/vz_${cluster}.completed ]; then
  echo "Installing Verrazzano in ${cluster} cluster"
  kubectx ${cluster}
  kubectl apply -f $HOME/vz/clusters/vz_mc_${cluster}.yaml
else
  echo "Verrazzano already installed in ${cluster}"
fi