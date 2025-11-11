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

### Module 1: Agile Planning (15 points)
- GitHub repo created: 3/3 ✅
- Project board created: 3/3 ✅
- User stories created: 3/3 ✅
- Sprint planning: 3/3 ✅
- Screenshots/URLs: 3/3 🔄 (need screenshots)

**Score: 12/15** (pending screenshots)

### Module 2: TDD & CI/CD (20 points)
- Flask app with CRUD: 5/5 ✅
- TDD tests: 5/5 ✅
- 95%+ coverage: 5/5 ✅ (100%)
- CI pipeline: 5/5 ✅

**Score: 20/20**

### Module 3: Docker & K8s (20 points)
- Dockerfile: 5/5 ✅
- Image built & tested: 5/5 ✅
- K8s manifests: 5/5 ✅
- Deployed to cluster: 0/5 ⏳ (pending)

**Score: 15/20** (pending deployment)

### Module 4: Tekton (20 points)
- Pipeline created: 10/10 ✅
- Pipeline deployed: 0/5 ⏳ (pending)
- Pipeline run: 0/5 ⏳ (pending)

**Score: 10/20** (pending deployment)

### Module 5: Documentation (15 points)
- README: 5/5 ✅
- Screenshots: 0/5 ⏳ (pending)
- URLs documented: 5/5 ✅

**Score: 10/15** (pending screenshots)

### Peer Review (10 points)
- Review completed: 0/10 ⏳

**Score: 0/10** (pending)

---

## **Current Total: 67/100 (67%)**
## **Potential Total: 95/100 (95%)** (with all screenshots and deployments)

---

**Last Updated**: November 11, 2025
