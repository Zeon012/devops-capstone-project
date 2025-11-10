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

**Note:** If `python` resolves to an msys64 or MinGW installation without pip, use the Windows Python launcher `py` instead.

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

## Docker & Kubernetes

Build and run the Docker image:

```powershell
# build image
docker build -t accounts:latest .

# run locally
docker run -p 5000:5000 accounts:latest
```

Deploy to Kubernetes/OpenShift:

```powershell
# deploy postgres
kubectl apply -f k8s/postgres.yaml

# update k8s/deployment.yaml with your registry URL, then deploy
kubectl apply -f k8s/deployment.yaml
```

## License

MIT

## Notes from Capstone modules
- 
