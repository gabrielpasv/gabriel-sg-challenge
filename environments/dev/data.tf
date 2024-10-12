data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "scalegrid-terraform-state-ue1"
    key    = "scalegrid/dev/network/terraform.state"
    region = "us-east-1"
  }
}
