# Customer Accounts Microservice - Capstone Scaffold

Link: https://www.coursera.org/learn/devops-capstone-project?specialization=devops-and-software-engineering

This repository is a scaffold for the Customer Accounts microservice used in the Coursera DevOps Capstone.

## What this scaffold provides

- A small Flask app with CRUD endpoints for accounts
- Unit tests using pytest with 100% code coverage
- Security configuration (Flask-Talisman + Flask-CORS)
- A GitHub Actions CI workflow file (runs lint, tests, coverage)
- Dockerfile and simple Kubernetes manifest templates
- A GitHub user story issue template under `.github/ISSUE_TEMPLATE`

## How to run locally (Windows PowerShell)

**Windows Users**: Use the PowerShell build script instead of `make`:

```powershell
# Show all available commands
.\build.ps1 help

# Install dependencies
.\build.ps1 install

# Run tests with coverage
.\build.ps1 test

# Run the app
.\build.ps1 run

# Build Docker image
.\build.ps1 docker-build

# Run Docker container
.\build.ps1 docker-run
```

**Manual setup** (if not using build script):

```powershell
# create a virtual env (recommended)
py -m venv .venv
.\.venv\Scripts\Activate.ps1

# upgrade pip and install dev requirements
py -m pip install --upgrade pip
py -m pip install -r requirements-dev.txt

# run app
py run.py

# run tests
pytest -v

# run coverage and fail if coverage under 95%
pytest --cov=accounts --cov-report=term --cov-fail-under=95
```

## Project structure

```
.
├── accounts/               # Flask app package
│   ├── __init__.py        # App factory with CORS & Talisman
│   └── routes.py          # CRUD endpoints (in-memory store)
├── tests/
│   └── test_accounts.py   # Unit tests for CRUD + security
├── k8s/                   # Kubernetes manifests
│   ├── deployment.yaml    # Accounts service deployment
│   └── postgres.yaml      # PostgreSQL service
├── .github/
│   ├── ISSUE_TEMPLATE/    # User story template
│   └── workflows/ci.yml   # CI pipeline (lint, test, coverage)
├── Dockerfile             # Docker image for accounts service
├── requirements.txt       # Production dependencies
├── requirements-dev.txt   # Dev dependencies (test, lint)
└── run.py                 # Entry point
```

## Notes

- This scaffold uses an in-memory store for development and tests. When integrating with PostgreSQL, replace the in-memory store with a database-backed repository.
- CI is configured in `.github/workflows/ci.yml` and will run on push/PR to `main` or `master`.
- Security headers are enabled via Flask-Talisman.
- CORS is configured via Flask-CORS (permissive for development; tighten in production).

## Using the Makefile (Recommended)

The project includes a Makefile for common tasks:

```bash
make help          # Show all available commands
make install       # Install dependencies
make test          # Run tests with coverage
make lint          # Run flake8 linter
make run           # Run the Flask app locally
make docker-build  # Build Docker image
make docker-run    # Run Docker container
make deploy-k8s    # Deploy to Kubernetes
make tekton-install # Install Tekton pipeline
```

## Docker & Kubernetes

### Build and run the Docker image

```bash
# Build image
make docker-build
# or
docker build -t accounts:latest .

# Run locally
make docker-run
# or
docker run -p 5000:5000 accounts:latest
```

### Push to container registry

```bash
# Set your registry URL and push
make docker-push REGISTRY=us.icr.io/your-namespace
```

### Deploy to Kubernetes/OpenShift

```bash
# Deploy using Makefile
make deploy-k8s

# Or manually
kubectl apply -f k8s/postgres.yaml
kubectl apply -f k8s/deployment.yaml
```

## Tekton CD Pipeline

Automated deployment pipeline included in `tekton/` directory.

See [tekton/README.md](tekton/README.md) for full setup instructions.

Quick start:

```bash
# Install Tekton tasks and pipeline
make tekton-install

# Manually trigger a pipeline run
make tekton-run
```

## Project Links

- **Repository**: https://github.com/Zeon012/devops-capstone-project
- **CI/CD Actions**: https://github.com/Zeon012/devops-capstone-project/actions
- **Issues/Kanban**: https://github.com/Zeon012/devops-capstone-project/issues
- **Project Board**: https://github.com/users/Zeon012/projects/1

## License

MIT

## Notes from Capstone modules
- 
