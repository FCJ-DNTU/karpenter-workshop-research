# Karpenter Workshop Research

We reseach Karpenter Workshop to understand why it's so important in autoscaling context (K8S)

## About Karpenter

**Karpenter** is an open-source project that provides an efficient and scalable way to manage Kubernetes cluster autoscaling. Karpenter automatically launches just the right compute resources to handle your cluster's applications. It is designed to let you take full advantage of the cloud with fast and simple compute provisioning for Kubernetes clusters. Karpenter is designed to be cloud-agnostic, allowing it to work on any Kubernetes cluster, regardless of the cloud provider. Karpenter simplifies the autoscaling process by abstracting away the underlying complexity and provides a straightforward way for users to define and manage their autoscaling policies using NodePools. Overall, Karpenter is an effective solution for managing the dynamic resource requirements of modern applications running on Kubernetes and simplifies Kubernetes infrastructure with the right nodes at the right time.

## How to use this repository?

First, you must have an AWS Account and a User who has fit permissions. Then you have to launch an EC2 instance, at least `...` (Ubuntu). And you need to install git to get this repository.

```bash
git clone https://github.com/FCJ-DNTU/karpenter-workshop-research.git
cd karpenter-workshop-research
```

We write some script to group and categorize the requirements installation. So these scripts must be executed sequentially.

Before you run `setup_deps.sh`, you have to setup something

```bash
vim setup_deps.sh
```

You'll replace these \*\*\* with your proper values

```bash
export AWS_ACCESS_KEY_ID=***
export AWS_SECRET_ACCESS_KEY=***
export AWS_DEFAULT_OUTPUT=***
export AWS_DEFAULT_REGION=***
```

Then save changes and close

```bash
:wq
```

Now, we can run `setup_deps.sh` to install all of the requirements (CLI, Tools, ...)

```bash
bash setup_deps.sh
```
