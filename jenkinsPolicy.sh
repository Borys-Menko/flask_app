#!/bin/bash
export VAULT_ADDR=http://127.0.0.1:30090
vault login root

vault policy write jenkins-policy - <<EOF
    path "secret/jenkins" {
    capabilities = ["create", "read"]
    }
EOF

JENKINS_TOKEN=$(vault token create -format=json -policy="jenkins-policy" | jq -r ".auth.client_token")

export VAULT_TOKEN="$JENKINS_TOKEN"

echo "$JENKINS_TOKEN"

vault kv put -output-policy -mount=secret secret/jenkins contact_email="john.smith@acme.com"

email=$(vault kv get -output-policy -mount=secret secret/jenkins-secrets/contact_email)

echo "This is contact email: $email"