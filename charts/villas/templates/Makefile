NAMESPACE=villas-demo

KUBECTL=kubectl -n $(NAMESPACE)

APPLY_CHANGES=--dry-run -o yaml | $(KUBECTL) apply -f -
IGNORE_EXISTING= || true

USERNAME=admin

deploy: config-maps secrets
	$(KUBECTL) apply -f .

namespace:
	$(KUBECTL) create namespace $(NAMESPACE) $(APPLY_CHANGES)

secrets:
	$(KUBECTL) create secret generic rabbitmq-credentials --from-literal=username=$(USERNAME) --from-literal=password=$(shell pwgen -c1 16) $(IGNORE_EXISTING)
	$(KUBECTL) create secret generic postgres-credentials --from-literal=username=$(USERNAME) --from-literal=password=$(shell pwgen -c1 16) $(IGNORE_EXISTING)

get-secrets:
	@$(KUBECTL) get secret rabbitmq-credentials -o json | jq -r .data.password | base64 -d | xargs printf "RabbitMQ:   $(USERNAME) / %s\n"
	@$(KUBECTL) get secret postgres-credentials -o json | jq -r .data.password | base64 -d | xargs printf "PostgreSQL: $(USERNAME) / %s\n"

.PHONY: deploy config-maps secrets
