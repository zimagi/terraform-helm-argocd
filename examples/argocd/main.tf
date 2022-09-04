provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "argocd_release" {
  source = "../../modules/helm_release"

  release_name = var.release_name

  chart = var.chart
  repository = var.repository
  chart_version = var.chart_version

  values = var.values

  kubernetes_namespace = var.kubernetes_namespace
  create_namespace = var.create_namespace
}