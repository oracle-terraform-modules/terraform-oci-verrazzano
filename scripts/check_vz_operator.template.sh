#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/operator/vz_operator_${cluster}.completed ]; then
  kubectx ${cluster}
  kubectl -n verrazzano-install rollout status deployment/verrazzano-platform-operator  
  touch $HOME/vz/operator/vz_operator_${cluster}.completed
else
  echo "Verrazzano Operator completed in ${cluster}"
fi