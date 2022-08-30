release_name = "argocd"

chart = "argocd"
repository = "https://argoproj.github.io/argo-helm"
chart_version = "4.10.6"

values = []

kubernetes_namespace = "argo-cd"
create_namespace = true