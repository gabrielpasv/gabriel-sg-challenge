module "vpc_cluster1" {
  source = "terraform-aws-modules/vpc/aws"

  name           =  "scalegrid-vpc-cluster1"
  cidr           = "10.0.0.0/16"
  azs                = ["us-east-1a", "us-east-1b"]
  private_subnets    = ["10.0.0.0/22", "10.0.4.0/22"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false
  tags = {
    Terraform = "true"
    Environment = "dev"
    eks = "cluster1"
  }
}


module "vpc_cluster2" {
  source = "terraform-aws-modules/vpc/aws"

  providers = {
    aws = aws.us-west-2
  }

  name           =  "scalegrid-vpc-cluster2"
  cidr           = "10.1.0.0/16"
  azs                = ["us-west-2a", "us-west-2b"] 
  private_subnets    = ["10.1.0.0/22", "10.1.4.0/22"] 
  public_subnets     = ["10.1.101.0/24", "10.1.102.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = false
  tags = {
    Terraform = "true"
    Environment = "dev"
    eks = "cluster2"
  }
}
