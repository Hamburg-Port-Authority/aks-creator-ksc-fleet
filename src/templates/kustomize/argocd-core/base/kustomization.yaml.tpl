apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: argocd
resources:
  - https://raw.githubusercontent.com/argoproj/argo-cd/master/manifests/install.yaml
  - argocd-project-bootstrap.yaml
