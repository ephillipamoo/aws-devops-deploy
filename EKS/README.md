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

