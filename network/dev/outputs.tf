output "vpc_cluster1_vpc_id" {
  value       = module.vpc_cluster1.vpc_id
}

output "vpc_cluster1_private_subnet_ids" {
  value       = module.vpc_cluster1.private_subnets
}

output "vpc_cluster1_public_subnet_ids" {
  value       = module.vpc_cluster1.public_subnets
}


output "vpc_cluster2_vpc_id" {
  value       = module.vpc_cluster2.vpc_id
}

output "vpc_cluster2_private_subnet_ids" {
  value       = module.vpc_cluster2.private_subnets
}

output "vpc_cluster2_public_subnet_ids" {
  value       = module.vpc_cluster2.public_subnets
}
