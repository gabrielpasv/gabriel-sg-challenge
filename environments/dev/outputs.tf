output "eks_cluster1_oidc_provider_arn" {
  value       = module.eks_cluster1.oidc_provider_arn
}


output "eks_cluster2_oidc_provider_arn" {
  value       = module.eks_cluster2.oidc_provider_arn
}



output "externaldns_irsa_role_arn_cluster1" {
  value       = module.externaldns_irsa_cluster1.iam_role_arn
}


output "externaldns_irsa_role_arn_cluster2" {
  value       = module.externaldns_irsa_cluster2.iam_role_arn
}



output "nginx_ingress_irsa_role_arn_cluster1" {
  value       = module.nginx_ingress_irsa_cluster1.iam_role_arn
}



output "nginx_ingress_irsa_role_arn_cluster2" {
  value       = module.nginx_ingress_irsa_cluster2.iam_role_arn
}


output "redis_irsa_role_arn_cluster1" {
  value       = module.redis_irsa_cluster1.iam_role_arn
}



output "redis_irsa_role_arn_cluster2" {
  value       = module.redis_irsa_cluster2.iam_role_arn
}
