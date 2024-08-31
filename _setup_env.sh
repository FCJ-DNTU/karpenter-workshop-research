#!/bin/bash

# Set ENV
export KARPENTER_NAMESPACE="fcj-dntu"
export KARPENTER_VERSION="v0.37.1"
export KARPENTER_VERSION_STR="${KARPENTER_VERSION/v}"
export K8S_VERSION="1.30"
export AWS_PARTITION="aws" # if you are not using standard partitions, you may need to configure to aws-cn / aws-us-gov
export CLUSTER_NAME="${USER}-karpenter-workshop"
export AWS_ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
export AWS_DEFAULT_REGION="***"
export AWS_DEFAULT_OUTPUT=json
export TEMPOUT="$(mktemp)"
export ARM_AMI_ID="$(aws ssm get-parameter --name /aws/service/eks/optimized-ami/${K8S_VERSION}/amazon-linux-2-arm64/recommended/image_id --query Parameter.Value --output text)"
export AMD_AMI_ID="$(aws ssm get-parameter --name /aws/service/eks/optimized-ami/${K8S_VERSION}/amazon-linux-2/recommended/image_id --query Parameter.Value --output text)"
export GPU_AMI_ID="$(aws ssm get-parameter --name /aws/service/eks/optimized-ami/${K8S_VERSION}/amazon-linux-2-gpu/recommended/image_id --query Parameter.Value --output text)"