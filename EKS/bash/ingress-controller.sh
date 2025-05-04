#!/bin/bash

# Set variables
CLUSTER_NAME="demo-eks-cluster"
REGION="eu-west-1"
NAMESPACE="ingress-nginx"
SERVICE_ACCOUNT_NAME="ingress-nginx"

echo "✅ Checking cluster access..."
kubectl get svc || { echo "❌ Unable to access cluster. Ensure kubeconfig is set."; exit 1; }

echo "✅ Creating namespace: $NAMESPACE"
kubectl create namespace $NAMESPACE || echo "⚠️ Namespace already exists"

echo "✅ Adding Helm repo for ingress-nginx"
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

echo "✅ Creating service account with IAM role for ALB (if required)..."
eksctl utils associate-iam-oidc-provider \
  --region $REGION \
  --cluster $CLUSTER_NAME \
  --approve

# Optional: For ALB controller IAM role setup (not required for Nginx but here for completeness)
# eksctl create iamserviceaccount \
#   --region $REGION \
#   --name $SERVICE_ACCOUNT_NAME \
#   --namespace $NAMESPACE \
#   --cluster $CLUSTER_NAME \
#   --attach-policy-arn arn:aws:iam::aws:policy/AmazonEKSLoadBalancerControllerPolicy \
#   --approve

echo "✅ Installing ingress-nginx via Helm"
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace $NAMESPACE \
  --set controller.publishService.enabled=true

echo "✅ Waiting for ingress controller to be ready..."
kubectl -n $NAMESPACE rollout status deployment ingress-nginx-controller

echo "🎉 Ingress Controller deployed successfully!"
