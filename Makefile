REGISTRY         ?= docker.io
ORG              ?= automationbroker
TAG              ?= latest
IMAGE            ?= ${REGISTRY}/${ORG}/automation-broker-apb:${TAG}

build: ## Build apb image
	docker build -f Dockerfile -t ${IMAGE} .

help: ## Show this help screen
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo ''
	@echo 'Available targets are:'
	@echo ''
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ''

.PHONY: build
