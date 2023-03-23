{% raw %}
apiVersion: v1
data:
  tls.crt: {{ .Values.tls.crt }}
  tls.key: {{ .Values.tls.key }}
kind: Secret
metadata:
  creationTimestamp: null
  name: sealed-secrets-tls
  labels:
    sealedsecrets.bitnami.com/sealed-secrets-key: active
type: kubernetes.io/tls
{% endraw %}
