variable "argocd_release_name" {
  default = "argocd"
}

variable "argocd_chart" {
  default = "argo-cd"
}

variable "argocd_repository" {
  default = "https://argoproj.github.io/argo-helm"
}

variable "argocd_chart_version" {
  default = "5.4.0"
}

variable "argocd_values" {
  default = []
}

variable "argocd_kubernetes_namespace" {
  default = "argocd"
}

variable "argocd_create_namespace" {
  default = true
}

variable "argocd_apps_release_name" {
  default = "argocd-apps"
}

variable "argocd_apps_chart" {
  default = "argocd-apps"
}

variable "argocd_apps_repository" {
  default = "https://charts.zimagi.com"
}

variable "argocd_apps_chart_version" {
  default = "0.1.3"
}

variable "argocd_apps_values" {
  default = []
}

variable "argocd_apps_kubernetes_namespace" {
  default = "argocd"
}

variable "argocd_apps_create_namespace" {
  default = true
}