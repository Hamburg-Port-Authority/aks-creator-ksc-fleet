{% raw %}
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: disallow-empty-ingress-host
  annotations:
    policies.kyverno.io/title: Disallow empty Ingress host
    policies.kyverno.io/category: Best Practices
    policies.kyverno.io/minversion: 1.6.0
    policies.kyverno.io/severity: medium
    policies.kyverno.io/subject: Ingress
    policies.kyverno.io/description: >-
      An ingress resource needs to define an actual host name
      in order to be valid. This policy ensures that there is a
      hostname for each rule defined.
spec:
  validationFailureAction: Audit
  background: true
  rules:
    - name: disallow-empty-ingress-host
      match:
        any:
          - resources:
              kinds:
                - Ingress
      validate:
        message: "The Ingress host name must be defined, not empty."
        deny:
          conditions:
            all:
              - key: "{{ request.object.spec.rules[].host || `[]` | length(@) }}"
                operator: NotEquals
                value: "{{ request.object.spec.rules[].http || `[]` | length(@) }}"
{% endraw %}
