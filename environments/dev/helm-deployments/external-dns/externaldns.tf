data "terraform_remote_state" "irsa" {
  backend = "s3"
  config = {
    bucket = "scalegrid-terraform-state-ue1"
    key    = "scalegrid/dev/eks/terraform.state"
    region = "us-east-1"
  }
}

resource "helm_release" "external_dns_cluster1" {
  provider = helm.us-east-1

  name             = "external-dns"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "external-dns"
  namespace        = "external-dns"
  create_namespace = true

  values = [
    "${file("${path.module}/external-dns-values.yaml")}"
  ]

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "aws.zoneType"
    value = "public"
  }

  set {
    name  = "aws.region"
    value = "us-east-1"
  }

  set {
    name  = "txtOwnerId"
    value = "dev-externaldns-cluster1"
  }

  set {
    name  = "domainFilters[0]"
    value = "gpvicente.com"
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = data.terraform_remote_state.irsa.outputs.externaldns_irsa_role_arn_cluster1
  }
}



resource "helm_release" "external_dns_cluster2" {
  provider = helm.us-west-2 

  name       = "external-dns"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"
  namespace  = "external-dns"
  create_namespace = true

  values = [
    "${file("${path.module}/external-dns-values.yaml")}"
  ]

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "aws.zoneType"
    value = "public"
  }

  set {
    name  = "aws.region"
    value = "us-west-2"
  }

  set {
    name  = "txtOwnerId"
    value = "dev-externaldns-cluster1"
  }

  set {
    name  = "domainFilters[0]"
    value = "gpvicente.com"
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = data.terraform_remote_state.irsa.outputs.externaldns_irsa_role_arn_cluster2
  }
}
