# Tekton CD Pipeline

This directory contains Tekton pipeline manifests for continuous deployment of the accounts microservice.

## Pipeline Overview

The `accounts-cd-pipeline` automates the following steps:

1. **Clone** - Clone the git repository
2. **Lint** - Run flake8 to check code quality
3. **Test** - Run pytest with coverage (requires 95%+)
4. **Build** - Build Docker image with buildah
5. **Deploy** - Deploy to Kubernetes cluster

## Prerequisites

- Tekton Pipelines installed on your Kubernetes/OpenShift cluster
- Tekton Triggers installed (for GitHub webhook automation)
- `kubectl` or `oc` CLI configured
- Docker registry credentials configured

## Installation

### 1. Install Tekton on your cluster

```bash
# Install Tekton Pipelines
kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Install Tekton Triggers
kubectl apply -f https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml

# Verify installation
kubectl get pods -n tekton-pipelines
```

### 2. Install cluster tasks

```bash
# Install git-clone task
tkn hub install task git-clone

# Install buildah task
tkn hub install task buildah

# Install kubernetes-actions task
tkn hub install task kubernetes-actions
```

### 3. Create Docker registry secret

```bash
kubectl create secret docker-registry docker-credentials \
  --docker-server=<your-registry> \
  --docker-username=<your-username> \
  --docker-password=<your-password> \
  --docker-email=<your-email>
```

### 4. Install custom tasks and pipeline

```bash
# From project root
kubectl apply -f tekton/tasks/
kubectl apply -f tekton/pipeline.yaml
```

### 5. (Optional) Configure GitHub webhook trigger

```bash
# Create webhook secret
kubectl create secret generic github-webhook-secret \
  --from-literal=webhook-secret=<your-secret>

# Create service account for triggers
kubectl create serviceaccount tekton-triggers-sa
kubectl create rolebinding tekton-triggers-rb \
  --clusterrole=tekton-triggers-eventlistener-roles \
  --serviceaccount=default:tekton-triggers-sa

# Install triggers
kubectl apply -f tekton/triggers.yaml

# Expose the event listener
kubectl expose service el-accounts-event-listener --type=LoadBalancer --port=8080
```

## Manual Pipeline Run

To manually trigger the pipeline:

```bash
tkn pipeline start accounts-cd-pipeline \
  --param repo-url=https://github.com/Zeon012/devops-capstone-project \
  --param branch=master \
  --workspace name=source,volumeClaimTemplateFile=tekton/workspace-pvc.yaml \
  --workspace name=dockerconfig,secret=docker-credentials \
  --showlog
```

Or use the Makefile:

```bash
make tekton-run
```

## View Pipeline Runs

```bash
# List all pipeline runs
tkn pipelinerun list

# View logs of the latest run
tkn pipelinerun logs -f -L

# View specific run
tkn pipelinerun logs <run-name> -f
```

## Troubleshooting

- **Pipeline fails at clone**: Check repo URL and network connectivity
- **Pipeline fails at build**: Verify docker-credentials secret is configured
- **Pipeline fails at deploy**: Check RBAC permissions for the service account
- **Webhook not triggering**: Verify GitHub webhook secret and event listener service is exposed

## Files

- `pipeline.yaml` - Main CD pipeline definition
- `tasks/flake8-task.yaml` - Custom flake8 linting task
- `tasks/pytest-task.yaml` - Custom pytest testing task
- `triggers.yaml` - EventListener, TriggerBinding, and TriggerTemplate for GitHub webhooks
- `workspace-pvc.yaml` - PersistentVolumeClaim template for workspace storage
