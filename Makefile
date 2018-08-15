REGISTRY         ?= docker.io
ORG              ?= fabianvf
TAG              ?= latest
APB_IMAGE        ?= ${REGISTRY}/${ORG}/automation-broker-apb:${TAG}
OPERATOR_IMAGE   ?= ${REGISTRY}/${ORG}/automation-broker-operator:${TAG}


build-apb: ## Build apb image
	docker build -f Dockerfile -t ${APB_IMAGE} .

build-operator: ## Build operator image
	docker build -f operator/Dockerfile -t ${OPERATOR_IMAGE} .

build: build-apb build-operator ## Build APB and Operator

push-operator: build-operator
	docker push ${OPERATOR_IMAGE}

help: ## Show this help screen
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''

.PHONY: build
