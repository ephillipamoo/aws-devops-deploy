## AWS EKS ROLES V CLIENT

---

### ✅ AWS EKS: Responsibility Breakdown

| **Component/Task**                        | **Managed by AWS** 🟢                       | **Managed by Client** 🔵                              |
| ----------------------------------------- | ------------------------------------------- | ----------------------------------------------------- |
| **Kubernetes Control Plane**              | Yes – Fully managed                         | No                                                    |
| — API Server                              | Yes                                         | No                                                    |
| — etcd Database                           | Yes – Backed up and encrypted               | No                                                    |
| — Controller Manager, Scheduler           | Yes                                         | No                                                    |
| **Control Plane Security**                | Yes – Patching, certificates, encryption    | No                                                    |
| **Kubernetes API Endpoint**               | Yes – Public/Private configuration          | Optional – configure endpoint access                  |
| **Cluster Networking (VPC, Subnets)**     | No – Client creates/configures              | Yes                                                   |
| **Node Provisioning (EC2, Auto Scaling)** | ❌ (unless using Fargate or managed nodes)   | Yes – unless using AWS Fargate or Managed Node Groups |
| **Managed Node Groups (optional)**        | Yes – If used                               | Yes – You initiate and configure                      |
| **Fargate (optional)**                    | Yes – Fully managed compute option          | Yes – You define profiles/pods                        |
| **Kubernetes Add-ons (e.g., CoreDNS)**    | Optional – Some AWS-managed via EKS console | Yes – You deploy/upgrade or let AWS manage            |
| **IAM & Access Control**                  | No                                          | Yes – IAM roles, RBAC, IRSA                           |
| **Application Deployment**                | No                                          | Yes – You deploy and manage apps                      |
| **Logging & Monitoring**                  | No – AWS provides tools (e.g., CloudWatch)  | Yes – Set up and configure logging/monitoring         |
| **Node OS & Security Patches**            | No – Client is responsible                  | Yes                                                   |
| **Upgrading Worker Nodes**                | No                                          | Yes                                                   |
| **Pod Networking (CNI plugin)**           | Core plugin managed by AWS (VPC CNI)        | Yes – You can configure it                            |
| **Secrets Management**                    | Yes – Integrated with KMS                   | Yes – You configure usage                             |

---

### Summary:

* **AWS handles the Kubernetes control plane** (high availability, upgrades, scaling, patching).
* **You manage the infrastructure and workloads**, like worker nodes, VPC, IAM, and application deployments.
* **Optional AWS-managed services** (like Fargate or Managed Node Groups) reduce your operational burden.



## Troubleshooting EKS 

1. Cluster Health and Node Status:
-------------------------------------
AWS Management Console:
Check the EKS cluster status in the AWS console for overall health, errors, and events. 
kubectl get nodes:
List all nodes in the cluster and their status (Ready, NotReady, etc.). 
kubectl describe node <node_name>:
Get detailed information about a specific node, including its events and conditions. 
kubectl get events:
Retrieve a list of recent events related to the cluster or specific objects.
 
2. Networking Issues:
-----------------------
VPC Flow Logs:
Analyze VPC flow logs to identify any network-related problems, such as blocked traffic or unusual patterns.
Security Group Rules:
Verify that security groups allow the necessary traffic for the cluster to function properly, including inbound and outbound rules for the load balancer and node groups.
Network Policies:
If using network policies, ensure they are correctly configured and not blocking necessary traffic between pods. 

3. IAM and Permissions:
--------------------------
IAM Roles:
Check the IAM roles associated with the EKS cluster and its nodes, ensuring they have the necessary permissions to access other AWS resources. 
Security Group Rules:
Verify that security groups associated with the cluster and nodes allow the necessary traffic for communication with other AWS services. 

4. Resource Limits and Requests:
----------------------------------
Resource Limits:
Ensure that pod resource requests and limits are appropriately configured to avoid resource starvation or denial of service.
Pod Scheduling:
Review pod scheduling and affinity settings (taints, tolerations, node selectors) to ensure pods are being placed on the correct nodes. 

5. Other Troubleshooting Techniques:
---------------------------------------
AWS CLI: Use the AWS CLI to retrieve detailed information about the cluster, node groups, and other resources. 
CloudWatch: Monitor cluster performance metrics and logs in CloudWatch to identify trends and potential issues. 
kubectl logs <pod_name>: Examine the logs of pods to diagnose application-level problems. 
Check Add-ons: If using EKS add-ons like CloudWatch agent, verify their status and logs. 
DNS Issues: If encountering DNS issues, verify that the CoreDNS pods are running and that the DNS service is correctly configured. 