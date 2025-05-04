# How to setup alb add on

Download IAM policy

```
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json
```

Create IAM Policy

```
aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam_policy.json
```

Create IAM Role

```
eksctl create iamserviceaccount \
  --cluster=<your-cluster-name> \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name AmazonEKSLoadBalancerControllerRole \
  --attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
```

## Deploy ALB controller

Add helm repo

```
helm repo add eks https://aws.github.io/eks-charts
```

Update the repo

```
helm repo update eks
```

Install

```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \            
  -n kube-system \
  --set clusterName=<your-cluster-name> \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set region=<region> \
  --set vpcId=<your-vpc-id>
```

Verify that the deployments are running.

```
kubectl get deployment -n kube-system aws-load-balancer-controller
```
## HELM

In the context of **AWS EKS (Elastic Kubernetes Service)**, **Helm** is a **package manager for Kubernetes** that simplifies the process of deploying, configuring, and managing Kubernetes applications.

Here’s what Helm does in EKS:

---

### 🔧 **1. Simplifies Deployment of Applications**
Helm allows you to deploy complex Kubernetes applications with a single command using **Helm charts** (pre-configured packages of Kubernetes resources). This is much easier than manually creating all the YAML manifests.

**Example:** Deploying NGINX Ingress with Helm:
```bash
helm install my-nginx ingress-nginx/ingress-nginx
```

---

### 🧰 **2. Manages Application Versions**
Helm supports versioning of charts, making it easy to **upgrade, roll back**, or **track changes** to your applications running in EKS.

---

### 🔄 **3. Parameterizes Configurations**
With Helm, you can override default values using a `values.yaml` file or CLI flags, making your deployments flexible and reusable across environments (e.g., dev, staging, prod).

---

### 🔍 **4. Handles Dependencies**
Helm can manage application dependencies. For example, if your app needs a database, Helm can install that as part of the deployment.

---

### 📦 **5. Enables Reusability**
Helm charts can be reused across clusters or teams, promoting best practices and consistent deployments.

---

### In AWS EKS, Helm Works Like This:
1. You connect to your EKS cluster using `kubectl` and `aws eks update-kubeconfig`.
2. Helm interacts with the Kubernetes API to deploy and manage applications.
3. The chart's templates are rendered into Kubernetes manifests and applied to the cluster.

---
