module argocd_release {
  source = "./modules/helm_release"

  release_name = var.argocd_release_name

  chart = var.argocd_chart
  repository = var.argocd_repository
  chart_version = var.argocd_chart_version

  values = var.argocd_values

  kubernetes_namespace = var.argocd_kubernetes_namespace
  create_namespace = var.argocd_create_namespace
}

module "argocd_apps_release" {
  source = "./modules/helm_release"

  release_name = var.argocd_apps_release_name

  chart = var.argocd_apps_chart
  repository = var.argocd_apps_repository
  chart_version = var.argocd_apps_chart_version

  values = var.argocd_apps_values

  kubernetes_namespace = var.argocd_apps_kubernetes_namespace
  create_namespace = var.argocd_apps_create_namespace

  depends_on = [
    module.argocd_release
  ]
}