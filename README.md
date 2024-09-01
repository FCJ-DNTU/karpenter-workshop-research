# Karpenter Workshop Research

We reseach Karpenter Workshop to understand why it's so important in autoscaling context (K8S)

## About Karpenter

**Karpenter** is an open-source project that provides an efficient and scalable way to manage Kubernetes cluster autoscaling. Karpenter automatically launches just the right compute resources to handle your cluster's applications. It is designed to let you take full advantage of the cloud with fast and simple compute provisioning for Kubernetes clusters. Karpenter is designed to be cloud-agnostic, allowing it to work on any Kubernetes cluster, regardless of the cloud provider. Karpenter simplifies the autoscaling process by abstracting away the underlying complexity and provides a straightforward way for users to define and manage their autoscaling policies using NodePools. Overall, Karpenter is an effective solution for managing the dynamic resource requirements of modern applications running on Kubernetes and simplifies Kubernetes infrastructure with the right nodes at the right time.

## What will we do in this workshop?

Before we can learn how to use Karpenter, we need to setup Workshop Environment (EKS, Roles, VPC Resources and other resources...). Then we can learn to use Karpenter through these steps:

- Use Basic NodePool
- Use Multi NodePools
- How to optimize cloud's cost with Karpenter
- Make constraints for Node scheduling
- Control pod density
- Learn about EC2 Node class
- Learn how to observe
- Migrate from Cluster Autoscaler

You will know how to setup environment to do this workshop in the section below.

## How to setup workshop environment?

First, you must have an AWS Account and a User who has fit permissions, because you will need that user's access keys. You should create a network infrastucture for EC2 where you need to use to perform this workshop. The configuration of EC2 will be:

- OS: **Ubuntu Server 24.04 LTS (HVM), SSD Volume Type (Free tier eligible)**.
- Architecture: **x64**.
- Instance type: **t2.micro**.
- Key pair: create new if you don't have any.
- Network: you should be place this EC2 in proper VPC (this network in this VPC can reach the internet and you can use your computer to establish SSH connection with this EC2).

### Install git (if EC2 doen't have one) and clone this repository

Usually, Ubuntu has git by default, if it doesn't, you should install the new one

```bash
sudo apt -y update
sudo apt install git-all
```

Then you clone this repository to get necessary scripts

```bash
git clone https://github.com/FCJ-DNTU/karpenter-workshop-research.git
cd karpenter-workshop-research
```

### Assign access and secret access key

First, you have to edit AWS CLI credential as environment variables in `_setup_env.sh` script

```bash
vim _setup_env.sh
```

Enter your Access key and Secret access key

```bash
export AWS_ACCESS_KEY_ID="***"
export AWS_SECRET_ACCESS_KEY="***"
```

Then save changes and close

```bash
:wq
```

### Install workshop requirements

Now, we can run `setup_deps.sh` to install all of the requirements (CLI, Tools, ...)

```bash
bash setup_deps.sh
```

After the workshop's requirements are installed, you need to setup your aws credential in `_setup_env.sh` and some information to perform this workshop. Run `_setup_env.sh` script and reload bash profile.

```bash
bash _setup_env.sh
source ~/.bashrc
```

### Complete setup workshop environment

Now, you and your workshop environment are ready to go to next step, run `setup_wscf.sh` to run a CloudFormation Stack to setup Role and some resources.

```bash
bash setup_wscf.sh
source ~/.bashrc
```

Then, you need to setup a cluster for workshop

```bash
bash setup_cluster.sh
```

Finally, setup some role, role association, IAM Service Account and install Karpenter.

```bash
bash setup_karpenter.sh
# Reload all environemtal variables in profile
source ~/.bashrc
```

If you reach to this step without any issue, congratulation, you setup workshop environment successfully.
