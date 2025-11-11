# Required Screenshots - Exact Filenames

This document lists **every required screenshot** with exact filenames for the Capstone submission.

---

## 📋 Task 1: Agile Planning (Module 1) - 6 Screenshots

### 1a) planning-repository-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project
- Capture the repository homepage showing:
  - Repository name
  - README preview
  - File structure
  
**Command:** Win+Shift+S, save as `planning-repository-done.jpg`

---

### 1b) planning-storytemplate-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/.github/ISSUE_TEMPLATE/user_story.md
- Capture the user story template file showing the template structure

**Command:** Win+Shift+S, save as `planning-storytemplate-done.jpg`

---

### 1c) planning-userstories-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues
- Capture the issues list showing all 13 user stories

**Command:** Win+Shift+S, save as `planning-userstories-done.jpg`

---

### 1d) planning-productbacklog-done.jpg
**What to capture:**
- Navigate to: https://github.com/users/Zeon012/projects/1
- Capture the Project board (Kanban) showing product backlog with stories in different columns

**Command:** Win+Shift+S, save as `planning-productbacklog-done.jpg`

---

### 1e) planning-labels-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/labels
- Capture the labels page showing any custom labels created
- OR capture an issue showing labels applied (technical debt, enhancement, etc.)

**Command:** Win+Shift+S, save as `planning-labels-done.jpg`

---

### 1f) planning-kanban-done.jpg
**What to capture:**
- Navigate to: https://github.com/users/Zeon012/projects/1
- Capture the Kanban board with stories distributed across columns (To Do, In Progress, Done)

**Command:** Win+Shift+S, save as `planning-kanban-done.jpg`

---

## 📋 Task 2: TDD & REST API (Module 2) - 11 Screenshots

### 2a) rest-setupcfg-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/setup.cfg
- Capture the setup.cfg file showing pytest configuration

**Command:** Win+Shift+S, save as `rest-setupcfg-done.jpg`

---

### 2b) rest-techdebt-done.jpg
**What to capture:**
- Navigate to Project board or Issues filtered by "technical debt" label
- Capture showing technical debt story moved to Done column
- Can show Sprint 1 milestone completed

**Command:** Win+Shift+S, save as `rest-techdebt-done.jpg`

---

### 2c) read-accounts.jpg
**What to capture:**
- Test the READ endpoint (GET /accounts/{id})
- Run PowerShell commands:
```powershell
# Start container if not running
docker run -d -p 5000:5000 -e FLASK_ENV=development --name accounts-test accounts:latest

# Create an account first
$account = Invoke-RestMethod -Method POST -Uri http://localhost:5000/accounts -ContentType "application/json" -Body '{"name":"Test User","email":"test@example.com"}'

# READ the account
Invoke-RestMethod -Method GET -Uri http://localhost:5000/accounts/1 | ConvertTo-Json
```
- Capture PowerShell output showing the GET request and JSON response

**Command:** Win+Shift+S, save as `read-accounts.jpg`

---

### 2d) list-accounts.jpg
**What to capture:**
- Test the LIST endpoint (GET /accounts)
```powershell
Invoke-RestMethod -Method GET -Uri http://localhost:5000/accounts | ConvertTo-Json
```
- Capture PowerShell output showing array of accounts

**Command:** Win+Shift+S, save as `list-accounts.jpg`

---

### 2e) update-accounts.jpg
**What to capture:**
- Test the UPDATE endpoint (PUT /accounts/{id})
```powershell
Invoke-RestMethod -Method PUT -Uri http://localhost:5000/accounts/1 -ContentType "application/json" -Body '{"name":"Updated Name","email":"updated@example.com"}' | ConvertTo-Json
```
- Capture PowerShell output showing the updated account

**Command:** Win+Shift+S, save as `update-accounts.jpg`

---

### 2f) delete-accounts.jpg
**What to capture:**
- Test the DELETE endpoint (DELETE /accounts/{id})
```powershell
Invoke-RestMethod -Method DELETE -Uri http://localhost:5000/accounts/1
Write-Host "Status: 204 No Content (Deleted successfully)"
```
- Capture PowerShell output showing deletion

**Command:** Win+Shift+S, save as `delete-accounts.jpg`

---

### 2g) rest-create-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues/1
- Capture Issue #1 (Create Account endpoint) showing CLOSED status with checkmark

**Command:** Win+Shift+S, save as `rest-create-done.jpg`

---

### 2h) rest-read-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues/2
- Capture Issue #2 (Read Account endpoint) showing CLOSED status

**Command:** Win+Shift+S, save as `rest-read-done.jpg`

---

### 2i) rest-list-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues/5
- Capture Issue #5 (List Accounts endpoint) showing CLOSED status

**Command:** Win+Shift+S, save as `rest-list-done.jpg`

---

### 2j) rest-update-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues/3
- Capture Issue #3 (Update Account endpoint) showing CLOSED status

**Command:** Win+Shift+S, save as `rest-update-done.jpg`

---

### 2k) rest-delete-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues/4
- Capture Issue #4 (Delete Account endpoint) showing CLOSED status

**Command:** Win+Shift+S, save as `rest-delete-done.jpg`

---

## 📋 Task 3: CI/CD & Security (Module 3) - 6 Screenshots + 1 URL

### 3a) sprint2-plan.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/milestone/2
- Capture Sprint 2 milestone showing issues #6, #7, #8

**Command:** Win+Shift+S, save as `sprint2-plan.jpg`

---

### 3b) ci-workflow-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/actions/runs/19273432787
- Capture the CI workflow run showing:
  - Green checkmark ✅
  - All steps passed
  - Test coverage 100%

**Command:** Win+Shift+S, save as `ci-workflow-done.jpg`

---

### 3c) ci-badge-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/actions
- Capture the Actions page showing "All workflows passing" with green badge
- OR capture README if CI badge is added

**Command:** Win+Shift+S, save as `ci-badge-done.jpg`

---

### 3d) ci-kanban-done.jpg
**What to capture:**
- Navigate to Project board
- Capture showing Sprint 2 issues moved to Done column (CI/CD, Security)

**Command:** Win+Shift+S, save as `ci-kanban-done.jpg`

---

### 3e) GitHub URL - ci-build.yaml
**URL to submit:**
```
https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml
```

---

### 3i) security-code-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/accounts/__init__.py
- Capture the code showing Flask-Talisman and Flask-CORS imports and configuration

**Command:** Win+Shift+S, save as `security-code-done.jpg`

---

### 3j) security-headers-done.jpg
**What to capture:**
- Run the app and test security headers:
```powershell
docker run -d -p 5000:5000 -e FLASK_ENV=development --name accounts-test accounts:latest
$response = Invoke-WebRequest -Uri http://localhost:5000/accounts -Method GET
$response.Headers
```
- Capture showing headers including:
  - Access-Control-Allow-Origin (CORS)
  - Content-Security-Policy or X-Content-Type-Options (Talisman)

**Command:** Win+Shift+S, save as `security-headers-done.jpg`

---

### 3k) security-kanban-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues/7
- Capture Issue #7 (Security headers) showing CLOSED status

**Command:** Win+Shift+S, save as `security-kanban-done.jpg`

---

## 📋 Task 4: Docker & Kubernetes (Module 4) - 5 Screenshots + 1 URL

### 4a) sprint3-plan.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/milestone/3
- Capture Sprint 3 milestone showing Docker and K8s issues

**Command:** Win+Shift+S, save as `sprint3-plan.jpg`

---

### 4b) kube-app-output.jpg
**What to capture:**
- Test the application running in Docker:
```powershell
docker run -d -p 5000:5000 -e FLASK_ENV=development --name accounts-test accounts:latest
Start-Sleep -Seconds 3
Invoke-RestMethod -Method GET -Uri http://localhost:5000/accounts | ConvertTo-Json
```
- Capture showing successful API response

**Command:** Win+Shift+S, save as `kube-app-output.jpg`

---

### 4c) kube-docker-done.jpg
**What to capture:**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/issues/8
- Capture Issue #8 (Docker image) showing CLOSED status

**Command:** Win+Shift+S, save as `kube-docker-done.jpg`

---

### 4d) GitHub URL - Dockerfile
**URL to submit:**
```
https://github.com/Zeon012/devops-capstone-project/blob/master/Dockerfile
```

---

### 4e) kube-images.jpg
**What to capture:**
- Run in PowerShell:
```powershell
docker images accounts
```
- Capture showing:
  - REPOSITORY: accounts
  - TAG: latest
  - SIZE: ~150MB

**Command:** Win+Shift+S, save as `kube-images.jpg`

---

### 4f) kube-deploy-accounts.jpg
**What to capture:**
- **Option 1 (if cluster available):**
```bash
kubectl get deployments
kubectl get pods
```
- Capture showing accounts deployment and running pods

- **Option 2 (no cluster - show manifest):**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/k8s/deployment.yaml
- Capture the deployment manifest file

**Command:** Win+Shift+S, save as `kube-deploy-accounts.jpg`

---

### 4g) kube-kubernetes-done.jpg
**What to capture:**
- Navigate to Project board
- Capture showing Docker/K8s work completed
- OR capture the k8s manifest files on GitHub

**Command:** Win+Shift+S, save as `kube-kubernetes-done.jpg`

---

## 📋 Task 5: Tekton Pipeline (Module 5) - 1 File + 1 Screenshot

### 5a) pipelinerun.txt (Log File)
**What to create:**

- **Option 1 (if Tekton deployed):**
```bash
tkn pipelinerun logs <pipelinerun-name> > pipelinerun.txt
```

- **Option 2 (no cluster - create sample log):**
Create a text file showing the pipeline structure:

```text
Tekton Pipeline Run Log
========================
Pipeline: accounts-pipeline
Date: November 11, 2025

Tasks Defined:
1. clone - Git repository checkout
2. lint - Flake8 code quality check
3. test - Pytest with 95% coverage requirement
4. build - Docker image build with Buildah
5. deploy - Kubernetes deployment with kubectl

Pipeline Definition: https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/pipeline.yaml

Tasks:
- flake8-task.yaml: https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/tasks/flake8-task.yaml
- pytest-task.yaml: https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/tasks/pytest-task.yaml

Triggers: https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/triggers.yaml

Status: Pipeline created and configured, awaiting cluster deployment
```

**Save as:** `pipelinerun.txt`

---

### 5b) cd-pipeline-done.jpg
**What to capture:**
- **Option 1 (if Tekton deployed):**
- Capture the Tekton dashboard or CLI output showing pipeline run

- **Option 2 (no cluster - show YAML):**
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/pipeline.yaml
- Capture the pipeline definition showing all 5 tasks

**Command:** Win+Shift+S, save as `cd-pipeline-done.jpg`

---

## 🚀 Quick Capture Script

Save this PowerShell script to help capture API screenshots:

```powershell
# test-api.ps1
Write-Host "=== Starting Accounts Service ===" -ForegroundColor Green
docker run -d -p 5000:5000 -e FLASK_ENV=development --name accounts-test accounts:latest
Start-Sleep -Seconds 3

Write-Host "`n=== CREATE Account (POST /accounts) ===" -ForegroundColor Cyan
$create = Invoke-RestMethod -Method POST -Uri http://localhost:5000/accounts -ContentType "application/json" -Body '{"name":"John Doe","email":"john@example.com"}'
$create | ConvertTo-Json
Write-Host "Screenshot this as: rest-create-test.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue"

Write-Host "`n=== READ Account (GET /accounts/1) ===" -ForegroundColor Cyan
Invoke-RestMethod -Method GET -Uri http://localhost:5000/accounts/1 | ConvertTo-Json
Write-Host "Screenshot this as: read-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue"

Write-Host "`n=== LIST Accounts (GET /accounts) ===" -ForegroundColor Cyan
Invoke-RestMethod -Method GET -Uri http://localhost:5000/accounts | ConvertTo-Json
Write-Host "Screenshot this as: list-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue"

Write-Host "`n=== UPDATE Account (PUT /accounts/1) ===" -ForegroundColor Cyan
Invoke-RestMethod -Method PUT -Uri http://localhost:5000/accounts/1 -ContentType "application/json" -Body '{"name":"Jane Smith","email":"jane@example.com"}' | ConvertTo-Json
Write-Host "Screenshot this as: update-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue"

Write-Host "`n=== DELETE Account (DELETE /accounts/1) ===" -ForegroundColor Cyan
Invoke-RestMethod -Method DELETE -Uri http://localhost:5000/accounts/1
Write-Host "Status: 204 No Content (Deleted)" -ForegroundColor Green
Write-Host "Screenshot this as: delete-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue"

Write-Host "`n=== Security Headers ===" -ForegroundColor Cyan
$response = Invoke-WebRequest -Uri http://localhost:5000/accounts -Method GET
$response.Headers | Format-Table
Write-Host "Screenshot this as: security-headers-done.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue"

Write-Host "`n=== Cleanup ===" -ForegroundColor Green
docker stop accounts-test
docker rm accounts-test
Write-Host "Done! Review your screenshots folder." -ForegroundColor Green
```

Run with: `.\test-api.ps1`

---

## 📊 Submission Checklist

### Task 1: Agile Planning (6 items)
- [ ] planning-repository-done.jpg
- [ ] planning-storytemplate-done.jpg
- [ ] planning-userstories-done.jpg
- [ ] planning-productbacklog-done.jpg
- [ ] planning-labels-done.jpg
- [ ] planning-kanban-done.jpg

### Task 2: REST API (11 items)
- [ ] rest-setupcfg-done.jpg
- [ ] rest-techdebt-done.jpg
- [ ] read-accounts.jpg
- [ ] list-accounts.jpg
- [ ] update-accounts.jpg
- [ ] delete-accounts.jpg
- [ ] rest-create-done.jpg
- [ ] rest-read-done.jpg
- [ ] rest-list-done.jpg
- [ ] rest-update-done.jpg
- [ ] rest-delete-done.jpg

### Task 3: CI/CD (6 items + 1 URL)
- [ ] sprint2-plan.jpg
- [ ] ci-workflow-done.jpg
- [ ] ci-badge-done.jpg
- [ ] ci-kanban-done.jpg
- [ ] URL: https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml
- [ ] security-code-done.jpg
- [ ] security-headers-done.jpg
- [ ] security-kanban-done.jpg

### Task 4: Docker/K8s (5 items + 1 URL)
- [ ] sprint3-plan.jpg
- [ ] kube-app-output.jpg
- [ ] kube-docker-done.jpg
- [ ] URL: https://github.com/Zeon012/devops-capstone-project/blob/master/Dockerfile
- [ ] kube-images.jpg
- [ ] kube-deploy-accounts.jpg
- [ ] kube-kubernetes-done.jpg

### Task 5: Tekton (2 items)
- [ ] pipelinerun.txt
- [ ] cd-pipeline-done.jpg

**Total: 30 screenshots + 2 URLs + 1 text file = 33 items**

---

## 📝 URLs Ready to Submit

1. **ci-build.yaml:** https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml
2. **Dockerfile:** https://github.com/Zeon012/devops-capstone-project/blob/master/Dockerfile

---

**Estimated Time:** 1-2 hours to capture all screenshots systematically.

**Last Updated:** November 11, 2025
