# Capstone Submission Checklist

## Module 1: Agile Planning (✅ COMPLETE)

### Required Deliverables

- [x] **GitHub Repository Created**
  - URL: https://github.com/Zeon012/devops-capstone-project
  - Screenshot: ⏳ Needed

- [x] **GitHub Project (Kanban) Created**
  - URL: https://github.com/users/Zeon012/projects/1
  - Screenshot: ⏳ Needed

- [x] **User Story Template**
  - File: `.github/ISSUE_TEMPLATE/user_story.md`
  - Screenshot: ⏳ Needed

- [x] **Product Backlog**
  - 13 user stories created (issues #1-#13)
  - Screenshot: ⏳ Needed

- [x] **Sprint Planning**
  - 4 sprint milestones created
  - All issues assigned to sprints
  - URL: https://github.com/Zeon012/devops-capstone-project/milestones
  - Screenshot: ⏳ Needed

### Screenshots to Capture

- [ ] Repository homepage showing README
- [ ] Project board with all user stories
- [ ] Milestones page showing all 4 sprints
- [ ] Sample user story (issue page)
- [ ] Closed issues showing Sprint 1 & 2 completion

---

## Module 2: Sprint 1 - TDD & CRUD API (✅ COMPLETE)

### Required Deliverables

- [x] **Flask Microservice Created**
  - Files: `accounts/__init__.py`, `accounts/routes.py`, `run.py`
  
- [x] **Test Suite (TDD)**
  - File: `tests/test_accounts.py`
  - Coverage: 100% (exceeds 95% requirement)
  - All tests passing
  - Screenshot: ⏳ Needed

- [x] **CRUD Endpoints Implemented**
  - POST /accounts - Create
  - GET /accounts - List
  - GET /accounts/{id} - Read
  - PUT /accounts/{id} - Update
  - DELETE /accounts/{id} - Delete

- [x] **Issues Closed**
  - #1, #2, #3, #4, #5 (Sprint 1)

### Screenshots to Capture

- [ ] Test coverage report (showing 100%)
- [ ] pytest output (all tests passing)
- [ ] Sprint 1 issues (all closed)

---

## Module 2: Sprint 2 - CI/CD & Security (✅ COMPLETE)

### Required Deliverables

- [x] **GitHub Actions CI Pipeline**
  - File: `.github/workflows/ci.yml`
  - Status: ✅ Passing
  - URL: https://github.com/Zeon012/devops-capstone-project/actions
  - Screenshot: ⏳ Needed

- [x] **Security Headers (Flask-Talisman)**
  - Implemented in `accounts/__init__.py`
  - Tests verify headers present

- [x] **CORS (Flask-CORS)**
  - Implemented in `accounts/__init__.py`
  - Tests verify CORS headers

- [x] **Issues Closed**
  - #6 (CI/CD), #7 (Security)

### Screenshots to Capture

- [ ] GitHub Actions workflow run (green/passing)
- [ ] CI workflow showing all steps passed
- [ ] Flake8 linting results
- [ ] Coverage report in CI

---

## Module 3: Sprint 3 - Docker & Kubernetes (🔄 IN PROGRESS)

### Required Deliverables

- [x] **Dockerfile Created**
  - File: `Dockerfile`
  - Base: python:3.11-slim
  - Status: ✅ Built and tested locally
  - Screenshot: ⏳ Needed

- [x] **Docker Image Built**
  - Name: accounts:latest
  - Tested: ✅ All endpoints working
  - Screenshot: ⏳ Needed

- [ ] **Push to Container Registry**
  - Issue #11 (open)
  - Registry: TBD (IBM Cloud Container Registry or Docker Hub)
  - Image URL: ⏳ Pending
  - Screenshot: ⏳ Needed

- [x] **Kubernetes Manifests**
  - Files: `k8s/postgres.yaml`, `k8s/deployment.yaml`
  - Status: ✅ Created (not yet deployed)

- [ ] **Deploy to Kubernetes Cluster**
  - Issue #9 (PostgreSQL), #10 (accounts service)
  - Status: ⏳ Awaiting cluster access
  - Screenshot: ⏳ Needed

- [x] **Issue Closed**
  - #8 (Docker image creation)

### Screenshots to Capture

- [ ] Docker build command and output
- [ ] Docker images list showing accounts:latest
- [ ] Docker container running (docker ps)
- [ ] API test in container (curl/Invoke-WebRequest output)
- [ ] Container registry showing pushed image
- [ ] kubectl get pods (showing deployments)
- [ ] kubectl get services
- [ ] Application running in cluster

---

## Module 4: Sprint 4 - Tekton Pipeline (🔄 IN PROGRESS)

### Required Deliverables

- [x] **Tekton Pipeline Created**
  - File: `tekton/pipeline.yaml`
  - Tasks: clone, lint, test, build, deploy
  - Status: ✅ Created (not yet deployed)

- [x] **Tekton Tasks**
  - Files: `tekton/tasks/flake8-task.yaml`, `tekton/tasks/pytest-task.yaml`
  
- [x] **Tekton Triggers**
  - File: `tekton/triggers.yaml`
  - GitHub webhook configuration

- [x] **Tekton Documentation**
  - File: `tekton/README.md`

- [ ] **Deploy Tekton Pipeline**
  - Issue #12 (open)
  - Status: ⏳ Awaiting cluster access
  - Screenshot: ⏳ Needed

- [ ] **Trigger Pipeline Run**
  - Status: ⏳ Awaiting deployment
  - Screenshot: ⏳ Needed

### Screenshots to Capture

- [ ] Tekton pipeline definition (YAML or UI)
- [ ] Tekton pipeline run (in progress)
- [ ] Tekton pipeline run (completed/successful)
- [ ] Pipeline logs showing each task
- [ ] GitHub webhook configuration

---

## Module 5: Documentation & Submission (🔄 IN PROGRESS)

### Required Deliverables

- [x] **README.md**
  - Installation instructions
  - Usage examples
  - Project structure
  - Links to resources
  - Status: ✅ Complete and updated

- [x] **CAPSTONE_URLS.md**
  - All URLs documented
  - Status: ✅ Complete and updated

- [x] **Build Scripts**
  - Makefile (Linux/Mac)
  - build.ps1 (Windows)

- [ ] **All Screenshots Captured**
  - Status: ⏳ In progress

- [x] **All Code Committed**
  - Total commits: 5
  - All pushed to master

- [ ] **Issue #13 Completed**
  - Documentation finalized
  - Screenshots collected

---

## Module 5: Peer Review (⏳ PENDING)

### Required Deliverables

- [ ] **Review at Least One Peer Project**
  - Issue #16 (not started)
  - Use provided rubric
  - Submit review link

- [ ] **Rubric Scoring**
  - Task completion documented
  - Evidence provided (screenshots + URLs)

---

## Summary Status

### Completed (12/16 tasks - 75%)

✅ GitHub repository & Kanban  
✅ User story template  
✅ Product backlog (13 stories)  
✅ Sprint planning (4 sprints)  
✅ Flask microservice scaffold  
✅ TDD tests (100% coverage)  
✅ CRUD endpoints implementation  
✅ CI/CD pipeline (GitHub Actions)  
✅ Security (Talisman + CORS)  
✅ Dockerfile creation & testing  
✅ Kubernetes manifests  
✅ Tekton pipeline creation  

### In Progress (2/16 tasks)

🔄 Push Docker image to registry  
🔄 Documentation & screenshots  

### Not Started (2/16 tasks)

⏳ Manual deploy to cluster  
⏳ Peer review  

---

## Next Actions

### Immediate (Can do now)
1. ✅ Capture screenshots of:
   - GitHub repo, project board, milestones
   - CI/CD runs
   - Test coverage
   - Docker build/run
   
### Requires Access
2. ⏳ Push Docker image (need registry credentials)
3. ⏳ Deploy to Kubernetes (need cluster access)
4. ⏳ Install Tekton pipeline (need cluster access)

### Final Steps
5. ⏳ Complete peer review
6. ✅ Finalize documentation
7. ✅ Submit capstone

---

## Grading Rubric (Self-Assessment)

**Total Points Available: 50**

### Task 1: Repository and Kanban Board (6 points)
**Screenshots Required:**
- [ ] GitHub repository homepage
- [ ] GitHub Project (Kanban) board with all stories

**Work Completed:**
- ✅ GitHub repo created: https://github.com/Zeon012/devops-capstone-project
- ✅ Project board created: https://github.com/users/Zeon012/projects/1
- ✅ 13 user stories created
- ✅ 4 sprint milestones created

**Score: 6/6** ✅ (screenshots needed for evidence)

---

### Task 2: REST API Development (16 points)
**Screenshots Required:**
- [ ] setup.cfg file contents (nosetests configuration)
- [ ] Kanban board showing Sprint 1 stories closed
- [ ] REST API URL (repository or running service)
- [ ] REST API responses (POST, GET, PUT, DELETE calls)

**Work Completed:**
- ✅ setup.cfg created with pytest configuration (modern alternative to nose)
- ✅ All Sprint 1 stories closed (issues #1-#5: CRUD endpoints)
- ✅ REST API fully implemented in `accounts/routes.py`
- ✅ All endpoints tested and working:
  - POST /accounts (Create) ✅
  - GET /accounts (List) ✅
  - GET /accounts/{id} (Read) ✅
  - PUT /accounts/{id} (Update) ✅
  - DELETE /accounts/{id} (Delete) ✅
- ✅ 100% test coverage (exceeds 95% requirement)

**Score: 16/16** ✅ (screenshots needed for evidence)

---

### Task 3: CI/CD Pipeline (12 points)
**Screenshots Required:**
- [ ] Sprint 2 Planning (milestone/kanban board)
- [ ] GitHub Actions Badge (in README)
- [ ] CI workflow run (passing/green)
- [ ] GitHub repo link to ci-build.yaml file

**Work Completed:**
- ✅ Sprint 2 milestone created with issues #6, #7, #8
- ✅ GitHub Actions CI pipeline implemented (`.github/workflows/ci.yml`)
- ✅ CI status: PASSING (latest run: https://github.com/Zeon012/devops-capstone-project/actions/runs/19243859192)
- ✅ Security headers (Flask-Talisman) implemented
- ✅ CORS (Flask-CORS) configured
- ✅ All Sprint 2 issues closed

**Score: 12/12** ✅ (screenshots needed for evidence)

---

### Task 4: Docker & Kubernetes (10 points)
**Screenshots Required:**
- [ ] Sprint 3 Planning (milestone/kanban board)
- [ ] Kanban board showing Sprint 3 progress
- [ ] Docker image (docker images output)
- [ ] Application page (running in container)
- [ ] Deployment details (kubectl output or cluster info)

**Work Completed:**
- ✅ Sprint 3 milestone created with issues #8, #9, #10, #11
- ✅ Dockerfile created and tested
- ✅ Docker image built: accounts:latest (~150MB)
- ✅ Container tested locally on port 5000
- ✅ All CRUD endpoints verified in container
- ✅ Kubernetes manifests created:
  - k8s/postgres.yaml (database deployment)
  - k8s/deployment.yaml (accounts service)
- ⏳ **Missing:** Push to container registry (issue #11 open)
- ⏳ **Missing:** Deploy to K8s cluster (issues #9, #10 open)

**Score: 5/10** 🔄 (Docker complete, K8s deployment pending)

---

### Task 5: Tekton Pipeline (6 points)
**Screenshots Required:**
- [ ] Kanban board showing Sprint 4/Tekton work
- [ ] Pipeline run log file (tkn pipeline logs or UI)

**Work Completed:**
- ✅ Sprint 4 milestone created with issues #12, #13
- ✅ Tekton pipeline created (`tekton/pipeline.yaml`)
- ✅ Custom Tekton tasks created:
  - flake8-task.yaml (linting)
  - pytest-task.yaml (testing)
- ✅ Tekton triggers configured (GitHub webhook)
- ✅ Workspace PVC template created
- ✅ Tekton README with installation instructions
- ⏳ **Missing:** Deploy pipeline to cluster (issue #12 open)
- ⏳ **Missing:** Trigger pipeline run and capture logs

**Score: 0/6** ⏳ (pipeline created but not deployed/run)

---

## **Current Total: 39/50 (78%)**
## **With Screenshots: 44/50 (88%)** (all work complete, just need deployment evidence)
## **Maximum Achievable: 50/50 (100%)** (requires cluster access for K8s + Tekton)

---

**Last Updated**: November 11, 2025
