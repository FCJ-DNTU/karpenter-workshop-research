#!/bin/bash

. utils.sh

# Install some requirements
sudo apt install curl unzip

# Install AWS CLI
infoln "AWS CLI is being installed..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
successln "AWS CLI is installed! $(aws --version)"

# Install Kubernetes CLI
infoln "Kubernetes CLI is being installed..."
curl -LO "https://dl.k8s.io/release/v1.31.0/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl "/usr/local/bin/kubectl"
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
successln "Kubernetes CLI is installed!"
kubectl version --client --output=yaml

# Install AWS EKS CLI
infoln "AWS EKS CLI is being installed..."
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.176.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin/
successln "AWS EKS CLI is installed! $(eksctl version)"

# Install Helm (Package manager for Kubernetes)
infoln "Helm is being installed..."
curl -fsSL "https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3" -o get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
successln "Helm is installed! $(helm version)"

successln "Workshop dependencies are installed successfully"