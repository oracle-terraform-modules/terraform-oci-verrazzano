#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

kubectx admin
API_SERVER="$(kubectl config view --minify -o json | jq -r '.clusters[0].cluster.server')"

sed -i -e "s?API_SERVER?$(kubectl config view --minify -o json | jq -r '.clusters[0].cluster.server')?g" $HOME/vz/cm/api_cm.yaml

kubectl apply -f $HOME/vz/cm/api_cm.yaml