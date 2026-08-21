SHELL := /bin/bash

# Always run `hf` via pipx to avoid relying on local `hf` installations.
hf := pipx run --spec "huggingface_hub[cli]" hf

SNAP_NAME ?= gemma4 # TODO: Replace with snap name
ENGINE ?= cpu

.PHONY: all
all: help

#
# Main targets
#

.PHONY: help
help: ## Show this help message
	@echo "Usage: make <target>"
	@echo
	@echo "Targets:"
	@# List all targets with descriptions (lines starting with '##'):
	@grep -E '^[a-zA-Z0-9_-]+:.*## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*## "}; {printf "  %-11s %s\n", $$1, $$2}'

.PHONY: init
init: init-submodules install-deps download-models ## Initialize the build environment (dependencies, model weights, submodules, etc.)

.PHONY: build
build: ## Build the snap
	./dev/build.sh

.PHONY: install
install: ## Install the snap
	./dev/install.sh

.PHONY: upload
upload: ## Upload the snap
	./dev/upload.sh

.PHONY: smoke-test
smoke-test: ## Run smoke tests (override with SNAP_NAME=... ENGINE=...)
	sudo ./dev/smoke-test.sh $(SNAP_NAME) $(ENGINE)

#
# Supporting targets
#

.PHONY: install-deps
install-deps:
	@echo "Installing dependencies..."
	@# Ensure pipx is available for running the hf CLI.
	@command -v pipx >/dev/null 2>&1 || { \
		sudo apt-get update; \
		sudo apt-get install -y pipx; \
	}

.PHONY: init-submodules
init-submodules:
	@echo "Initializing submodules..."
	@if git submodule status | grep -q '^-'; then \
		git submodule update --init; \
	fi

# TODO: Update to match the expected model(s):
.PHONY: download-models
download-models: download-model-e4b-q4-k-m-gguf

.PHONY: download-model-e4b-q4-k-m-gguf
download-model-e4b-q4-k-m-gguf:
	$(hf) download unsloth/gemma-4-E4B-it-GGUF gemma-4-E4B-it-Q4_K_M.gguf \
		--local-dir components/model-e4b-q4-k-m-gguf/
