## KubeCtl Commands

Here's a list of commonly used `kubectl` commands for managing Kubernetes clusters:

---

### 🔍 **Cluster & Context Info**
- `kubectl config get-contexts` – List all contexts
- `kubectl config use-context <context-name>` – Switch context
- `kubectl cluster-info` – Show cluster details
- `kubectl get nodes` – List all nodes in the cluster

---

### 📦 **Working with Pods**
- `kubectl get pods` – List all pods
- `kubectl get pods -n <namespace>` – List pods in a namespace
- `kubectl describe pod <pod-name>` – Detailed pod info
- `kubectl logs <pod-name>` – View logs from a pod
- `kubectl logs <pod-name> -c <container-name>` – View logs for a specific container in a pod
- `kubectl exec -it <pod-name> -- /bin/bash` – Access a pod’s shell

---

### 🚀 **Deployments & Workloads**
- `kubectl get deployments` – List deployments
- `kubectl describe deployment <deployment-name>` – Details about a deployment
- `kubectl scale deployment <name> --replicas=<count>` – Scale deployment
- `kubectl rollout restart deployment <deployment-name>` – Restart a deployment
- `kubectl apply -f <file>.yaml` – Create/update resources from a YAML file
- `kubectl delete -f <file>.yaml` – Delete resources from a YAML file

---

### 📄 **Services & Networking**
- `kubectl get services` – List services
- `kubectl describe service <service-name>` – Detailed info on a service
- `kubectl port-forward svc/<service-name> <local-port>:<target-port>` – Forward local port to a service

---

### 🔧 **Configuration & Secrets**
- `kubectl get configmaps` – List ConfigMaps
- `kubectl get secrets` – List secrets
- `kubectl create configmap <name> --from-literal=key=value` – Create ConfigMap
- `kubectl create secret generic <name> --from-literal=key=value` – Create secret

---

### 📂 **Namespaces**
- `kubectl get namespaces` – List namespaces
- `kubectl create namespace <name>` – Create a new namespace
- `kubectl delete namespace <name>` – Delete a namespace
- kubectl config set-context --current --namespace=kube-system - Sets the current namespace 

---

### 💥 **Delete Resources**
- `kubectl delete pod <pod-name>` – Delete a pod
- `kubectl delete deployment <deployment-name>` – Delete a deployment
- `kubectl delete svc <service-name>` – Delete a service


---

