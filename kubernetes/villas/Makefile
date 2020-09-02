NAMESPACE=villas-demo

KUBECTL=kubectl -n $(NAMESPACE)

APPLY_CHANGES=--dry-run -o yaml | $(KUBECTL) apply -f -
IGNORE_EXISTING= || true

USERNAME=admin

deploy: config-maps secrets
	$(KUBECTL) apply -f .

namespace:
	$(KUBECTL) create namespace $(NAMESPACE) $(APPLY_CHANGES)

config-maps:
	$(KUBECTL) create configmap nginx-config --from-file=etc/nginx/ $(APPLY_CHANGES)
	$(KUBECTL) create configmap node-config --from-file=etc/villas/node/ $(APPLY_CHANGES)
	$(KUBECTL) create configmap controller-config --from-file=etc/villas/controller/ $(APPLY_CHANGES)

secrets:
	$(KUBECTL) create secret generic mongodb-credentials  --from-literal=username=$(USERNAME) --from-literal=password=$(shell pwgen -c1 16) $(IGNORE_EXISTING)
	$(KUBECTL) create secret generic rabbitmq-credentials --from-literal=username=$(USERNAME) --from-literal=password=$(shell pwgen -c1 16) $(IGNORE_EXISTING)
	$(KUBECTL) create secret generic postgres-credentials --from-literal=username=$(USERNAME) --from-literal=password=$(shell pwgen -c1 16) $(IGNORE_EXISTING)

get-secrets:
	@$(KUBECTL) get secret mongodb-credentials  -o json | jq -r .data.password | base64 -d | xargs printf "MongoDB:    $(USERNAME) / %s\n"
	@$(KUBECTL) get secret rabbitmq-credentials -o json | jq -r .data.password | base64 -d | xargs printf "RabbitMQ:   $(USERNAME) / %s\n"
	@$(KUBECTL) get secret postgres-credentials -o json | jq -r .data.password | base64 -d | xargs printf "PostgreSQL: $(USERNAME) / %s\n"

.PHONY: deploy config-maps secrets
