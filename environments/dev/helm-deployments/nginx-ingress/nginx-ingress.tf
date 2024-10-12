data "terraform_remote_state" "irsa" {
  backend = "s3"
  config = {
    bucket = "scalegrid-terraform-state-ue1"
    key    = "scalegrid/dev/eks/terraform.state"
    region = "us-east-1"
  }
}


resource "helm_release" "nginx_ingress_cluster1" {
  provider = helm.us-east-1

  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true

  values = [
    "${file("${path.module}/nginx-ingress-values.yaml")}"
  ]

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.annotations.eks\\.amazonaws\\.com/role-arn"
    value = data.terraform_remote_state.irsa.outputs.nginx_ingress_irsa_role_arn_cluster1
  }

  set {
    name  = "controller.serviceAccount.name"
    value = "nginx-ingress"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
}


resource "helm_release" "nginx_ingress_cluster2" {
  provider = helm.us-west-2

  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true

  values = [
    "${file("${path.module}/nginx-ingress-values.yaml")}"
  ]

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.annotations.eks\\.amazonaws\\.com/role-arn"
    value = data.terraform_remote_state.irsa.outputs.nginx_ingress_irsa_role_arn_cluster2
  }

  set {
    name  = "controller.serviceAccount.name"
    value = "nginx-ingress"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
}
