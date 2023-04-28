#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

for cluster in ${clusters}; do
  if [ ! -f $HOME/vz/clusters/vz_$cluster.completed ]; then
    echo "Waiting for Verrazzano installation in $cluster"
    kubectx $cluster
    kubectl wait --timeout=20m --for=condition=InstallComplete verrazzano/$cluster
    echo "Verrazzano installation completed in $cluster"
    touch $HOME/vz/clusters/vz_$cluster.completed
  else
    echo "Verrazzano already installed in $cluster"
  fi
done