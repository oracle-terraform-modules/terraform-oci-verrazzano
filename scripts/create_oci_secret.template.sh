#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/oci/secret_${cluster}.completed ]; then
  kubectx ${cluster}
  # kubectl create secret generic -n verrazzano-install oci --from-file=\"$HOME/vz/oci/oci.yaml\"
  kubectl create secret generic -n verrazzano-install oci --from-file=$HOME/vz/oci/oci.yaml
  touch $HOME/vz/oci/secret_${cluster}.completed
else
  echo "Secret already created in ${cluster}"
fi