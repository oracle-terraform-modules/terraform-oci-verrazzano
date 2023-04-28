#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

if [ ! -f $HOME/vz/operator/vz_operator_${cluster}.completed ]; then
  kubectx ${cluster}
  echo "Installing Verrazzano Operator in ${cluster}"
  kubectl apply -f https://github.com/verrazzano/verrazzano/releases/download/v${version}/verrazzano-platform-operator.yaml
else
  echo "Verrazzano Operator already installed in ${cluster}"
fi

