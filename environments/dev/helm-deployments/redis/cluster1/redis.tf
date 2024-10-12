data "terraform_remote_state" "irsa" {
  backend = "s3"
  config = {
    bucket = "scalegrid-terraform-state-ue1"
    key    = "scalegrid/dev/eks/terraform.state"
    region = "us-east-1"
  }
}


resource "helm_release" "redis_cluster1" {
  provider = helm.us-east-1

  name             = "redis-ha"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "redis"
  namespace        = "redis"
  create_namespace = true

  values = [
    "${file("${path.module}/redis-cluster1-values.yaml")}"
  ]

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = data.terraform_remote_state.irsa.outputs.redis_irsa_role_arn_cluster1
  }
  
}
