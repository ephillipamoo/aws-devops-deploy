#!/bin/bash

set -e

CLUSTER_NAME="eks-fargate-cluster"
REGION="eu-west-1"
NAMESPACE="fargate-apps"

echo "Checking for required tools..."

command -v aws >/dev/null 2>&1 || { echo >&2 "AWS CLI not installed. Aborting."; exit 1; }
command -v eksctl >/dev/null 2>&1 || { echo >&2 "eksctl not installed. Aborting."; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo >&2 "kubectl not installed. Aborting."; exit 1; }

echo "Creating EKS cluster with Fargate profile..."

eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $REGION \
  --fargate

echo "Updating kubeconfig..."

aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

echo "Creating namespace for Fargate workloads: $NAMESPACE"

kubectl create namespace $NAMESPACE

echo "Creating Fargate profile for namespace $NAMESPACE..."

eksctl create fargateprofile \
  --cluster $CLUSTER_NAME \
  --region $REGION \
  --name fargate-profile \
  --namespace $NAMESPACE

echo "EKS on Fargate setup complete."
