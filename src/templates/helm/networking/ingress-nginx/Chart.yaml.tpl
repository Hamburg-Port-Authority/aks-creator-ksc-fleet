apiVersion: v2
name: ingress-nginx
version: 1.0.0
description: This Chart deploys ingress-nginx.
dependencies:
  - name: ingress-nginx
    version: 4.5.*
    repository: https://kubernetes.github.io/ingress-nginx
