# Karpenter Workshop Research

We reseach Karpenter Workshop to understand why it's so important in autoscaling context (K8S)

## About Karpenter

**Karpenter** is an open-source project that provides an efficient and scalable way to manage Kubernetes cluster autoscaling. Karpenter automatically launches just the right compute resources to handle your cluster's applications. It is designed to let you take full advantage of the cloud with fast and simple compute provisioning for Kubernetes clusters. Karpenter is designed to be cloud-agnostic, allowing it to work on any Kubernetes cluster, regardless of the cloud provider. Karpenter simplifies the autoscaling process by abstracting away the underlying complexity and provides a straightforward way for users to define and manage their autoscaling policies using NodePools. Overall, Karpenter is an effective solution for managing the dynamic resource requirements of modern applications running on Kubernetes and simplifies Kubernetes infrastructure with the right nodes at the right time.

## How to use this repository?

First, you must have an AWS Account and a User who has fit permissions. Then you have to launch an EC2 instance, `t2.micro` (Ubuntu). And you need to install git to get this repository.

```bash
git clone https://github.com/FCJ-DNTU/karpenter-workshop-research.git
cd karpenter-workshop-research
```

You need to setup your aws credential in `_setup_env.sh`

```bash
vim _setup_env.sh
```

```bash
# Find these lines
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
export AWS_DEFAULT_REGION="***"
export AWS_DEFAULT_OUTPUT=json
```

Then save changes and close

```bash
:wq
```

Now, we can run `setup_deps.sh` to install all of the requirements (CLI, Tools, ...)

```bash
bash setup_deps.sh
```

> Note: you don't need to run `_setup_env.sh`, if you want to change some information, enter this script.

Setup something before create EKS Cluster with

```bash
bash setup_wscf.sh
```

Then, you need to setup a cluster for our workshop

```bash
bash setup_cluster.sh
```

Finally, setup something to install Karpenter

```bash
bash setup_karpenter.sh
```
