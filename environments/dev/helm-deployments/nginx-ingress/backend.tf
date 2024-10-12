terraform {
  backend "s3" {
    acl                         = "bucket-owner-full-control"
    bucket                      = "scalegrid-terraform-state-ue1"
    dynamodb_table              = "terraform-state-lock"
    encrypt                     = true
    region                      = "us-east-1"
    key                         = "scalegrid/dev/eks/nginx-ingress/terraform.state"
  }
}
