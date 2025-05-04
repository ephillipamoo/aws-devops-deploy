# EKS POD Identity

The Amazon EKS Pod Identity Agent add-on is a component that enables Kubernetes pods running on Amazon EKS (Elastic Kubernetes Service) clusters to securely obtain AWS Identity and Access Management (IAM) credentials. This allows applications within the pods to access AWS services like S3, DynamoDB, and Secrets Manager without embedding long-lived credentials or using service account-based access methods.​

# How It Works
The EKS Pod Identity Agent operates as a DaemonSet on each worker node in your EKS cluster. When a pod requires AWS credentials, it makes a request to the agent, which then:​
AWS Documentation

Uses the EKS Auth API's AssumeRoleForPodIdentity operation to exchange a projected token for temporary IAM credentials.
Returns these credentials to the pod, enabling it to authenticate AWS SDK calls with the appropriate permissions.​


# install the EKS Pod Identity Agent as an EKS add-on, which simplifies deployment and management

aws eks create-addon \
  --cluster-name <CLUSTER_NAME> \
  --addon-name eks-pod-identity-agent \
  --addon-version v1.0.0-eksbuild.1

# Post Installation 

# After installation, verify the agent is running with:​

- kubectl get pods -n kube-system | grep 'eks-pod-identity-agent'

# Notes

Ensure that your worker nodes have the necessary IAM permissions, specifically the AssumeRoleForPodIdentity action, to allow the agent to function properly .​

- AWS Documentation: https://docs.aws.amazon.com/eks/latest/userguide/pod-id-agent-setup.html?utm_source=chatgpt.com


