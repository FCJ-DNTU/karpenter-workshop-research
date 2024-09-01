#!/bin/bash

# Setup AWS CLI profile with
export AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
export AWS_DEFAULT_REGION="us-west-2"
export AWS_DEFAULT_OUTPUT=json
export AZ1="$AWS_DEFAULT_REGION"a
export AZ2="$AWS_DEFAULT_REGION"b

# Configure workspace
export KARPENTER_NAMESPACE="fcj-dntu"
export KARPENTER_VERSION="v0.37.1"
export KARPENTER_VERSION_STR="${KARPENTER_VERSION/v}"
export K8S_VERSION="1.30"
export AWS_PARTITION="aws" # if you are not using standard partitions, you may need to configure to aws-cn / aws-us-gov
export CLUSTER_NAME="${USER}-karpenter-workshop"
export TEMPOUT="$(mktemp)"
export ARM_AMI_ID="$(aws ssm get-parameter --name /aws/service/eks/optimized-ami/${K8S_VERSION}/amazon-linux-2-arm64/recommended/image_id --query Parameter.Value --output text)"
export AMD_AMI_ID="$(aws ssm get-parameter --name /aws/service/eks/optimized-ami/${K8S_VERSION}/amazon-linux-2/recommended/image_id --query Parameter.Value --output text)"
export GPU_AMI_ID="$(aws ssm get-parameter --name /aws/service/eks/optimized-ami/${K8S_VERSION}/amazon-linux-2-gpu/recommended/image_id --query Parameter.Value --output text)"

# Save to profile
echo "export KARPENTER_NAMESPACE=$KARPENTER_NAMESPACE" >> "$HOME"/.bashrc
echo "export KARPENTER_VERSION=$KARPENTER_VERSION" >> "$HOME"/.bashrc
echo "export KARPENTER_VERSION_STR=$KARPENTER_VERSION_STR" >> "$HOME"/.bashrc
echo "export K8S_VERSION=$K8S_VERSION" >> "$HOME"/.bashrc
echo "export AWS_PARTITION=$AWS_PARTITION" >> "$HOME"/.bashrc
echo "export CLUSTER_NAME=$CLUSTER_NAME" >> "$HOME"/.bashrc
echo "export TEMPOUT=$TEMPOUT" >> "$HOME"/.bashrc
echo "export ARM_AMI_ID=$ARM_AMI_ID" >> "$HOME"/.bashrc
echo "export AMD_AMI_ID=$AMD_AMI_ID" >> "$HOME"/.bashrc
echo "export GPU_AMI_ID=$GPU_AMI_ID" >> "$HOME"/.bashrc
echo "export AWS_ACCOUNT_ID=$AWS_ACCOUNT_ID" >> "$HOME"/.bashrc
echo "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" >> "$HOME"/.bashrc
echo "export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" >> "$HOME"/.bashrc
echo "export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" >> "$HOME"/.bashrc
echo "export AWS_DEFAULT_OUTPUT=$AWS_DEFAULT_OUTPUT" >> "$HOME"/.bashrc
echo "export AZ1=$AZ1" >> "$HOME"/.bashrc
echo "export AZ2=$AZ2" >> "$HOME"/.bashrc