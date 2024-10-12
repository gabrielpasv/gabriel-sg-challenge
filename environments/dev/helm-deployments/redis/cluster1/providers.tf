provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "arn:aws:eks:us-east-1:781748316818:cluster/scalegrid-dev-eks-cluster1"
  alias = "us-east-1"
}


provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "us-west-2-cluster" 
  alias = "us-west-2"
}



provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "arn:aws:eks:us-east-1:781748316818:cluster/scalegrid-dev-eks-cluster1" 
  }
  alias = "us-east-1"
}



provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "us-west-2-cluster" 
  }
  alias = "us-west-2"
}
