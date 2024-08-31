#!/bin/bash

. utils.sh
. _setup_env.sh

orangeln "Setup Karpenter..."
println "This process is crucial for doing this workshop. If there is any failed step, you won't complete your workshop!!"

infoln "1. Setup ENV"
# Set ENV
export CLUSTER_ENDPOINT="$(aws eks describe-cluster --name "${CLUSTER_NAME}" --query "cluster.endpoint" --output text)"
export KARPENTER_IAM_ROLE_ARN="arn:${AWS_PARTITION}:iam::${AWS_ACCOUNT_ID}:role/${CLUSTER_NAME}-karpenter"
successln "Done!"

# Add Karpenter node role to aws-auth configmap
infoln "2. Add the Karpenter node role to the aws-auth configmap"
eksctl create iamidentitymapping \
  --username system:node:{{EC2PrivateDNSName}} \
  --cluster "${CLUSTER_NAME}" \
  --arn "arn:aws:iam::${AWS_ACCOUNT_ID}:role/KarpenterNodeRole-${CLUSTER_NAME}" \
  --group system:bootstrappers \
  --group system:nodes
successln "Done!"

# Create KarpenterController IAM Role
infoln "3. Create KarpenterController IAM Role"
eksctl utils associate-iam-oidc-provider --cluster ${CLUSTER_NAME} --approve

eksctl create iamserviceaccount \
  --cluster "${CLUSTER_NAME}" --name karpenter --namespace karpenter \
  --role-name "${CLUSTER_NAME}-karpenter" \
  --attach-policy-arn "arn:aws:iam::${AWS_ACCOUNT_ID}:policy/KarpenterControllerPolicy-${CLUSTER_NAME}" \
  --role-only \
  --approve

orangeln "Check IAM service account was created - $(eksctl get iamserviceaccount --cluster $CLUSTER_NAME --namespace karpenter)"
successln "Done!"

# Create the EC2 Spot Service Linked Role
infoln "4. Create the EC2 Spot Service Linked Role"
aws iam create-service-linked-role --aws-service-name spot.amazonaws.com || true
successln "Done!"

# Use Helm to install Karpenter
infoln "5. Install Karpenter using Helm"
helm registry logout public.ecr.aws
helm upgrade --install karpenter oci://public.ecr.aws/karpenter/karpenter --version ${KARPENTER_VERSION_STR} --namespace karpenter --create-namespace \
  --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"=${KARPENTER_IAM_ROLE_ARN} \
  --set settings.clusterName=${CLUSTER_NAME} \
  --set settings.clusterEndpoint=${CLUSTER_ENDPOINT} \
  --set settings.interruptionQueue=${CLUSTER_NAME} \
  --set settings.featureGates.drift=true \
  --set settings.featureGates.SpotToSpotConsolidation=true \
  --wait
successln "Done!"