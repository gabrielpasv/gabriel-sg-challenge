# IRSA ExternalDNS in Cluster 1
module "externaldns_irsa_cluster1" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "externaldns-irsa-cluster1"

  attach_external_dns_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks_cluster1.oidc_provider_arn
      namespace_service_accounts = ["external-dns:external-dns"]
    }
  }

  external_dns_hosted_zone_arns = [
    "arn:aws:route53:::hostedzone/Z1044879OVW9DJJRUKKP"
  ]

  tags = {
    Name = "ExternalDNS IRSA Cluster 1"
  }
}





# IRSA ExternalDNS in Cluster 2
module "externaldns_irsa_cluster2" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "externaldns-irsa-cluster2"

  attach_external_dns_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks_cluster2.oidc_provider_arn
      namespace_service_accounts = ["external-dns:external-dns"]
    }
  }

  external_dns_hosted_zone_arns = [
    "arn:aws:route53:::hostedzone/Z1044879OVW9DJJRUKKP"
  ]

  tags = {
    Name = "ExternalDNS IRSA Cluster 2"
  }
}



# IRSA NGINX Ingress in Cluster 1
module "nginx_ingress_irsa_cluster1" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "nginx-ingress-irsa-cluster1"

  attach_load_balancer_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks_cluster1.oidc_provider_arn
      namespace_service_accounts = ["ingress-nginx:nginx-ingress"]
    }
  }

  tags = {
    Name = "NGINX IRSA Cluster 1"
  }
}


# IRSA NGINX Ingress in Cluster 2
module "nginx_ingress_irsa_cluster2" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "nginx-ingress-irsa-cluster2"

  attach_load_balancer_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks_cluster2.oidc_provider_arn
      namespace_service_accounts = ["ingress-nginx:nginx-ingress"]
    }
  }

  tags = {
    Name = "NGINX IRSA Cluster 2"
  }
}


# IRSA REDIS Ingress in Cluster 1
module "redis_irsa_cluster1" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "redis-irsa-cluster1"

  oidc_providers = {
    main = {
      provider_arn               = module.eks_cluster1.oidc_provider_arn
      namespace_service_accounts = ["redis:redis"]
    }
  }

  tags = {
    Name = "REDIS IRSA Cluster 1"
  }
}


# IRSA REDIS Ingress in Cluster 2
module "redis_irsa_cluster2" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "redis-irsa-cluster2"

  oidc_providers = {
    main = {
      provider_arn               = module.eks_cluster2.oidc_provider_arn
      namespace_service_accounts = ["redis:redis"]
    }
  }

  tags = {
    Name = "REDIS IRSA Cluster 2"
  }
}
