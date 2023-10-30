#!/usr/bin/bash
# Copyright (c) 2023 Oracle Corporation and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

echo "Installing Verrazzano cli"
curl -LO https://github.com/verrazzano/verrazzano/releases/download/v${version}/verrazzano-${version}-linux-amd64.tar.gz

tar xvf verrazzano-${version}-linux-amd64.tar.gz
sudo cp verrazzano-${version}/bin/vz /usr/local/bin

rm -f verrazzano-${version}-linux-amd64.tar.gz
rm -rf verrazzano-${version}

curl -L https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.5.0/clusterctl-linux-amd64 -o clusterctl
chmod +x clusterctl
sudo mv clusterctl /usr/local/bin

curl -L https://istio.io/downloadIstio | sh -
sudo cp istio-1.19.3/bin/istioctl /usr/local/bin