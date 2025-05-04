## Create Fargate profile

```
eksctl create fargateprofile \
    --cluster demo-cluster \
    --region us-east-1 \
    --name alb-sample-app \
    --namespace game-2048
```

## Deploy the deployment, service and Ingress

```
kubectl apply -f <url-link> or <path to file>
```

## Ingress Controller

An **Ingress Controller** in **AWS EKS (Elastic Kubernetes Service)** is a specialized Kubernetes component that manages **external access to services** running in your Kubernetes cluster—typically HTTP and HTTPS traffic.

### What it does:
1. **Routes Traffic:**
   It listens for Ingress resources (rules defined in Kubernetes) and routes external traffic to the appropriate services within the EKS cluster.

2. **Load Balancing:**
   It acts as a **reverse proxy**, distributing traffic among backend pods to ensure availability and performance.

3. **TLS Termination:**
   It can handle **SSL/TLS** encryption and decryption at the edge, offloading the burden from backend applications.

4. **Path and Host-Based Routing:**
   You can define rules to route requests to different services based on the **URL path** or **host** (e.g., `api.example.com` vs. `web.example.com`).

5. **Authentication and Authorization:**
   Some ingress controllers support basic auth, JWT verification, and integration with external identity providers.

6. **Rewrite and Redirect:**
   It can modify URLs, enforce HTTPS, or redirect old URLs to new ones.

### In AWS EKS:
The most commonly used ingress controllers are:
- **AWS Load Balancer Controller**: Integrates with AWS ALB (Application Load Balancer).
- **NGINX Ingress Controller**: A flexible and widely-used open-source option.
- **Traefik, HAProxy, etc.**: Other alternatives depending on use case.

### Example Workflow:
1. Deploy an NGINX ingress controller in your EKS cluster.
2. Define an Ingress resource that maps `/api` to a service named `api-service`.
3. The controller provisions an AWS Load Balancer (if necessary) and ensures that external traffic to `/api` reaches the right pods.

Refference: (https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html?utm_source=chatgpt.com)