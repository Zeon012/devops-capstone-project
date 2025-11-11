.PHONY: help install test lint run clean docker-build docker-run deploy-k8s tekton-install

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install dependencies
	python -m pip install --upgrade pip
	pip install -r requirements-dev.txt
	pip install -e .

test: ## Run tests with coverage
	pytest tests/ -v --cov=accounts --cov-report=term --cov-report=html --cov-fail-under=95

lint: ## Run flake8 linter
	flake8 . --max-line-length=120 --exclude=.venv,__pycache__,.pytest_cache

run: ## Run the Flask app locally
	python run.py

clean: ## Clean up generated files
	rm -rf __pycache__ .pytest_cache htmlcov .coverage
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

docker-build: ## Build Docker image
	docker build -t accounts:latest .

docker-run: ## Run Docker container locally
	docker run -p 5000:5000 accounts:latest

docker-push: ## Push Docker image to registry (set REGISTRY env var)
	@if [ -z "$(REGISTRY)" ]; then echo "Error: REGISTRY not set. Use: make docker-push REGISTRY=<your-registry>"; exit 1; fi
	docker tag accounts:latest $(REGISTRY)/accounts:latest
	docker push $(REGISTRY)/accounts:latest

deploy-k8s: ## Deploy to Kubernetes
	kubectl apply -f k8s/postgres.yaml
	kubectl apply -f k8s/deployment.yaml

tekton-install: ## Install Tekton tasks and pipeline
	kubectl apply -f tekton/tasks/
	kubectl apply -f tekton/pipeline.yaml
	kubectl apply -f tekton/triggers.yaml

tekton-run: ## Manually trigger a pipeline run
	tkn pipeline start accounts-cd-pipeline \
		--param repo-url=https://github.com/Zeon012/devops-capstone-project \
		--param branch=master \
		--workspace name=source,volumeClaimTemplateFile=tekton/workspace-pvc.yaml \
		--showlog

all: install lint test ## Run install, lint, and test
