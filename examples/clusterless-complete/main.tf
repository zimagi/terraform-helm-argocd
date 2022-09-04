provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "platform_chart" {
    source = "../../"
}