# Install EKS

Please follow the prerequisites doc before this.

## Install using Fargate

## Make sure and very that you are using the correct aws keys for deployment as each user SHOULD be and have specific rights for API deployment

## View Access Key: 
        aws configure get aws_access_key_id 

## View Secret Key: 
        aws configure get aws_secret_access_key

```
eksctl create cluster --name demo-cluster --region us-east-1 --fargate
```

## Delete the cluster

```
eksctl delete cluster --name demo-cluster --region us-east-1
```


## EC2 vs Fargate with ECS/EKS

When deciding between Amazon EC2 and AWS Fargate, the choice hinges on specific requirements and control levels. EC2 is preferable if:

You need control over the server environment, including OS, patches, and instance types tailored to workload demands (essential for legacy applications needing particular configurations)
You need granular control over scaling at the instance level for performance optimization
You have and accommodates custom hardware needs like specific CPU/memory setups or GPU usage for intensive computations
Your applications have precise network and security compliance requirements, demanding direct access to the host machine for enhanced monitoring or compliance controls
Your workloads are stable and predictable, allowing cost efficiency to be achieved through reserved instances
 

Conversely, Fargate is more suited when:

Your existing workloads are already running on modern serverless technologies
You don’t want or need to worry about scaling and managing instances (selecting server types, deciding when to scale, managing security patches, etc.)
Workloads are event-driven and sporadic (Fargate scales automatically and you pay only for computing time, not underlying EC2 instances)
Your applications can run in a stateless matter (Fargate does not support persistent local storage after the the container is stopped)
You need quick deployment cycles, such as for testing and deploying applications
You are running microservices architecture (it allows each service to be packaged into its container, scaled independently and managed centrally).

