module "eks_cluster1" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  providers = {
    aws = aws.us-east-1
  }

  cluster_name    = "${var.cluster_name}-cluster1"
  cluster_version = var.cluster_version
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
    aws-ebs-csi-driver     = {}
  }
  vpc_id                                   = data.terraform_remote_state.network.outputs.vpc_cluster1_vpc_id
  subnet_ids                               = data.terraform_remote_state.network.outputs.vpc_cluster1_private_subnet_ids
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = var.redis_eks_node_group

  cluster_endpoint_public_access = true

  tags = var.tags
}




module "eks_cluster2" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  providers = {
    aws = aws.us-west-2
  }

  cluster_name    = "${var.cluster_name}-cluster2"
  cluster_version = var.cluster_version
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
    aws-ebs-csi-driver     = {}
  }
  vpc_id                                   = data.terraform_remote_state.network.outputs.vpc_cluster2_vpc_id
  subnet_ids                               = data.terraform_remote_state.network.outputs.vpc_cluster2_private_subnet_ids
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_groups = var.redis_eks_node_group

  cluster_endpoint_public_access = true

  tags = var.tags
}


