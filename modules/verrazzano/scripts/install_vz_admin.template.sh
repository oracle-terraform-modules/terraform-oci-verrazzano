#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/clusters/vz_admin.completed ]; then
  echo "Installing Verrazzano in Admin cluster"
  kubectx ${admin_ctx}
  kubectl apply -f $HOME/vz/clusters/vz_${admin_ctx}.yaml
fi
