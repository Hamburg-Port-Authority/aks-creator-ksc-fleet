apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: external-secrets
  namespace: argocd
spec:
  generators:
    - clusters:
        selector:
          matchLabels:
            env: development
        values:
          branch: development
    - clusters:
        selector:
          matchLabels:
            env: production
        values:
          branch: development
{% raw %}
  template:
    metadata:
      name: "{{name}}-external-secrets"
      annotations:
        argocd.argoproj.io/manifest-generate-paths: ".;.."
    spec:
      project: default
      sources:
        - repoURL: https://github.com/Hamburg-Port-Authority/kubernetes-service-catalog.git
          targetRevision: "{{values.branch}}"
          path: "./security/external-secrets"
          helm:
            releaseName: "external-secrets" # Release name override (defaults to application name)
            valueFiles:
              - "values.yaml"
      destination:
        name: "{{name}}"
        namespace: "external-secrets"
      syncPolicy:
        automated:
          prune: false
          selfHeal: true
        syncOptions:
          - CreateNamespace=true
        retry:
          limit: 5
{% endraw %}
