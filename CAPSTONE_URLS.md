# DevOps Capstone Project - URLs and Resources

**Student**: Zeon012  
**Date**: November 11, 2025  
**Repository**: https://github.com/Zeon012/devops-capstone-project

---

## 📋 Module 1: Agile Planning

### Repository and Project Management

- **GitHub Repository**: https://github.com/Zeon012/devops-capstone-project
- **GitHub Project (Kanban)**: https://github.com/users/Zeon012/projects/1
- **GitHub Issues**: https://github.com/Zeon012/devops-capstone-project/issues
- **Issue Template**: `.github/ISSUE_TEMPLATE/user_story.md`

### Sprint Planning

- **Milestones**: https://github.com/Zeon012/devops-capstone-project/milestones
  - Sprint 1 (CRUD endpoints) - Due: Nov 18, 2025 - ✅ **COMPLETED**
  - Sprint 2 (CI/CD, Security) - Due: Nov 25, 2025 - ✅ **COMPLETED**
  - Sprint 3 (Docker, K8s) - Due: Dec 2, 2025 - 🔄 **IN PROGRESS**
  - Sprint 4 (Tekton, Docs) - Due: Dec 9, 2025 - 📝 **PLANNED**

### User Stories (Product Backlog)

**Completed Stories (8)**:
- Issue #1: Create Account endpoint ✅
- Issue #2: Read Account endpoint ✅
- Issue #3: Update Account endpoint ✅
- Issue #4: Delete Account endpoint ✅
- Issue #5: List Accounts endpoint ✅
- Issue #6: Add CI/CD pipeline ✅
- Issue #7: Add security headers and CORS ✅
- Issue #8: Create Docker image ✅

**Open Stories (5)**:
- Issue #9: Deploy PostgreSQL to Kubernetes (Sprint 3)
- Issue #10: Deploy accounts service to Kubernetes (Sprint 3)
- Issue #11: Push Docker image to container registry (Sprint 3)
- Issue #12: Create Tekton CD pipeline (Sprint 4)
- Issue #13: Documentation and submission artifacts (Sprint 4)

---

## 🧪 Module 2: Test-Driven Development (TDD)

### Code Structure

- **Flask App**: `accounts/__init__.py`, `accounts/routes.py`
- **Tests**: `tests/test_accounts.py`
- **Test Configuration**: `tests/conftest.py`
- **Setup**: `setup.py`

### Test Coverage

- **Coverage**: 100% (exceeds 95% requirement) ✅
- **Test Framework**: pytest
- **Tests Run**: 5 tests (all passing)
  - test_create_and_get_account
  - test_list_accounts
  - test_update_account
  - test_delete_account
  - test_security_headers_and_cors

### CI/CD Pipeline

- **GitHub Actions**: https://github.com/Zeon012/devops-capstone-project/actions
- **Latest CI Run**: https://github.com/Zeon012/devops-capstone-project/actions/runs/19243859192
- **Status**: ✅ **PASSING**
- **Workflow File**: `.github/workflows/ci.yml`
- **CI Steps**:
  1. Checkout code
  2. Set up Python 3.11
  3. Install dependencies
  4. Run flake8 linting
  5. Run pytest with coverage (95% minimum)

---

## 🔒 Module 2 (Sprint 2): Security

### Security Features Implemented

- **Flask-Talisman**: Security headers enabled
  - Content-Security-Policy configurable
  - HTTPS enforcement (disabled in development mode)
- **Flask-CORS**: Cross-Origin Resource Sharing configured
  - Permissive for development
  - Ready to tighten for production
- **Tests**: Security headers verified in test suite

---

## 🐳 Module 3: Docker & Containerization

### Docker Image

- **Image Name**: accounts:latest
- **Base Image**: python:3.11-slim
- **Size**: ~150MB
- **Dockerfile**: `Dockerfile` (root)
- **Status**: ✅ **Built and Tested**

### Docker Testing

- **Container Name**: accounts-service
- **Port**: 5000
- **Test Results**: ✅ All CRUD endpoints working
  - GET /accounts - Returns account list
  - POST /accounts - Creates new account
  - PUT /accounts/{id} - Updates account
  - DELETE /accounts/{id} - Deletes account

### Build Commands (Windows)

```powershell
.\build.ps1 docker-build  # Build image
.\build.ps1 docker-run    # Run container
.\build.ps1 docker-stop   # Stop container
```

---

## ☸️ Module 3: Kubernetes Manifests

### Kubernetes Files

- **PostgreSQL**: `k8s/postgres.yaml` - Database deployment and service
- **Accounts Service**: `k8s/deployment.yaml` - Microservice deployment
- **Status**: ✅ **Manifests Created** (awaiting cluster deployment)

### Deployment Plan

1. Deploy PostgreSQL service
2. Update deployment.yaml with registry image URL
3. Deploy accounts service
4. Verify connectivity and health

---

## 🔄 Module 4: Tekton CD Pipeline

### Tekton Pipeline

- **Pipeline File**: `tekton/pipeline.yaml`
- **Tasks**:
  - `tekton/tasks/flake8-task.yaml` - Linting
  - `tekton/tasks/pytest-task.yaml` - Testing
- **Triggers**: `tekton/triggers.yaml` - GitHub webhook automation
- **Documentation**: `tekton/README.md`
- **Status**: ✅ **Pipeline Created** (awaiting cluster installation)

### Pipeline Stages

1. **Clone** - Git repository clone
2. **Lint** - Flake8 code quality check
3. **Test** - Pytest with 95% coverage
4. **Build** - Docker image build with buildah
5. **Deploy** - Kubernetes deployment update

---

## 🛠️ Development Tools

### Scripts

- **Makefile**: Linux/Mac build automation
- **build.ps1**: Windows PowerShell build script
  - 10 commands: install, test, lint, run, docker-build, etc.

### Commands Quick Reference

```powershell
# Windows
.\build.ps1 help          # Show all commands
.\build.ps1 test          # Run tests
.\build.ps1 docker-build  # Build Docker image
.\build.ps1 deploy-k8s    # Deploy to Kubernetes

# Linux/Mac
make help
make test
make docker-build
make deploy-k8s
```

---

## 📊 Project Statistics

- **Total Commits**: 5
- **Issues Created**: 13
- **Issues Closed**: 8
- **Code Coverage**: 100%
- **CI Status**: ✅ Passing
- **Sprint Completion**: 2/4 sprints completed

---

## 🎯 Remaining Tasks

### Sprint 3 (In Progress)
- [ ] Push Docker image to IBM Cloud Container Registry or Docker Hub
- [ ] Deploy PostgreSQL to Kubernetes cluster
- [ ] Deploy accounts service to Kubernetes cluster
- [ ] Capture deployment screenshots

### Sprint 4 (Planned)
- [ ] Install Tekton pipeline on cluster
- [ ] Configure GitHub webhook
- [ ] Test automated deployment
- [ ] Capture Tekton pipeline screenshots
- [ ] Complete documentation
- [ ] Peer review

---

## 📸 Screenshots Needed for Submission

- [ ] GitHub repository homepage
- [ ] GitHub Project (Kanban board) with all stories
- [ ] Sprint milestones page
- [ ] Closed issues showing completed work
- [ ] GitHub Actions CI run (passing)
- [ ] Docker image build
- [ ] Docker container running
- [ ] Kubernetes deployments
- [ ] Tekton pipeline run
- [ ] Application running in cluster

---

## 📝 Notes

- All code committed to master branch
- CI/CD pipeline running on every push
- TDD approach followed throughout development
- Security best practices implemented
- Ready for container registry push and K8s deployment
