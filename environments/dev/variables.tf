# Cluster-specific variables
variable "cluster_name" {
  type    = string
  default = "scalegrid-dev-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.31"
}

variable "account_id" {
  type    = string
  default = "781748316818"
}


# Node group-specific variables
variable "eks_managed_node_group_name" {
  type    = string
  default = "scalegrid-dev-ng"
}

variable "node_group_min_size" {
  type    = number
  default = 2
}

variable "node_group_max_size" {
  type    = number
  default = 10
}

variable "node_group_desired_size" {
  type    = number
  default = 2
}

variable "cluster_primary_security_group_id" {
  type    = string
  default = ""
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Terraform   = "true"
  }
}

variable "redis_eks_node_group" {
  default = {
    redis = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]
      min_size       = 2
      max_size       = 10
      desired_size   = 2
      iam_role_additional_policies = {
        "AmazonEC2FullAccess" = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
      }
    }
  }
}
