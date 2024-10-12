# Redis HA with Sentinel Across Two AWS EKS Clusters

This project implements **Redis High Availability (HA)** with **Sentinel** across two **EKS clusters** in different AWS regions, using **Route 53 Weighted Routing** for DNS failover and traffic distribution.

## Architecture Overview

- **EKS Clusters**: Two clusters located in `us-east-1` and `us-west-2` for HA.
- **Redis HA with Sentinel**: Each cluster hosts a Redis master and replicas, monitored by Sentinel for automatic failover.
- **Route 53 Weighted Routing**: Distributes traffic evenly (50/50) between clusters, with automatic failover if one becomes unavailable.
- **Subdomains**: Access Redis services via subdomains (`redis.cluster1.gpvicente.com`, `redis.cluster2.gpvicente.com`). 
- **Main domain**: `redis.gpvicente.com`

## Terraform Setup

1. **Provision VPC and EKS Clusters**:
   - Set up VPCs with private subnets in `us-east-1` and `us-west-2`.
   - Deploy EKS clusters

2. **Deploy Redis with Sentinel**:
   - Use the Bitnami Helm chart to deploy Redis HA with Sentinel in both clusters.

3. **Configure Route 53**:
   - Create weighted DNS records for traffic distribution and set up health checks to monitor Redis.

## Usage

1. Clone the repository.
2. Deploy the netowkr infra with Terraform:
   ```bash
   cd network/dev
   terraform init
   terraform plan
   terraform apply

3. Deploy the eks infra with Terraform:
   ```bash
   cd environment/dev
   terraform init
   terraform plan
   terraform apply

4. Deploy the nginx ingress and external dns ( do the same for each)
   ```bash
   cd environment/dev/helm-deployments/*
   terraform init
   terraform plan
   terraform apply

5. To deploy redis - cluster1:
   ```bash
   cd environment/dev/helm-deployment/readis/cluster1
   terraform init
   terraform plan
   terraform apply

6. To deploy redis - cluster2:
   ```bash
   cd environment/dev/helm-deployment/readis/cluster2
   terraform init
   terraform plan
   terraform apply