#!/bin/bash

set -e

# Variables
CLUSTER_NAME="demo-eks-cluster"
REGION="eu-west-1"
FARGATE_PROFILE_NAME="fp-default"
NAMESPACE="fargate-ns"

# 1. Create EKS Cluster with Fargate profile
eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $REGION \
  --fargate

# 2. Create a Fargate profile (if not created above)
eksctl create fargateprofile \
  --cluster $CLUSTER_NAME \
  --region $REGION \
  --name $FARGATE_PROFILE_NAME \
  --namespace $NAMESPACE

# 3. Update kubeconfig
aws eks --region $REGION update-kubeconfig --name $CLUSTER_NAME

# 4. Create namespace for Fargate workloads
kubectl create namespace $NAMESPACE

# 5. Label namespace for Fargate (if necessary)
kubectl label namespace $NAMESPACE \
  eks.amazonaws.com/fargate-profile=$FARGATE_PROFILE_NAME

# 6. Install Helm (should already be done earlier)
helm version

# 7. Add a Helm repo (e.g., for CloudWatch agent or custom pod agent)
helm repo add aws-cloudwatch https://aws.github.io/eks-charts
helm repo update

# 8. Install CloudWatch Container Insights Agent
helm upgrade --install cloudwatch-agent aws-cloudwatch/aws-cloudwatch-metrics \
  --namespace $NAMESPACE \
  --set awsRegion=$REGION \
  --set clusterName=$CLUSTER_NAME

# Optional: Deploy a sample app to test
kubectl apply -n $NAMESPACE -f https://k8s.io/examples/application/deployment.yaml
