# Screenshot Guide for Capstone Submission

This document provides instructions for capturing all required screenshots for the DevOps Capstone submission.

---

## 📁 Screenshot Organization

Create a `screenshots/` folder with the following structure:

```
screenshots/
├── module1-agile/
│   ├── 01-github-repo.png
│   ├── 02-project-board.png
│   ├── 03-user-story-template.png
│   ├── 04-milestones.png
│   ├── 05-sprint1-issues.png
│   └── 06-sprint2-issues.png
├── module2-tdd-ci/
│   ├── 01-test-coverage.png
│   ├── 02-pytest-output.png
│   ├── 03-ci-workflow.png
│   ├── 04-ci-passing.png
│   └── 05-security-tests.png
├── module3-docker-k8s/
│   ├── 01-docker-build.png
│   ├── 02-docker-images.png
│   ├── 03-docker-run.png
│   ├── 04-api-test.png
│   ├── 05-registry-push.png
│   ├── 06-kubectl-pods.png
│   └── 07-app-running.png
└── module4-tekton/
    ├── 01-pipeline-yaml.png
    ├── 02-pipeline-deployed.png
    ├── 03-pipeline-run.png
    └── 04-pipeline-logs.png
```

---

## Module 1: Agile Planning

### Screenshot 1: GitHub Repository
**File**: `screenshots/module1-agile/01-github-repo.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project
- Show: Repository name, description, file structure, README preview
- Include: Star/fork counts, visibility (public)

### Screenshot 2: GitHub Project (Kanban)
**File**: `screenshots/module1-agile/02-project-board.png`

**What to capture**:
- Navigate to: https://github.com/users/Zeon012/projects/1
- Show: All columns (Backlog, In Progress, Done, Closed)
- Include: Issue cards in each column

### Screenshot 3: User Story Template
**File**: `screenshots/module1-agile/03-user-story-template.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/.github/ISSUE_TEMPLATE/user_story.md
- Show: Template structure with user story format, acceptance criteria, story points, sprint

### Screenshot 4: Sprint Milestones
**File**: `screenshots/module1-agile/04-milestones.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project/milestones
- Show: All 4 sprints with due dates, open/closed issue counts
- Include: Sprint 1 & 2 marked complete, Sprint 3 & 4 in progress

### Screenshot 5: Sprint 1 Issues (Closed)
**File**: `screenshots/module1-agile/05-sprint1-issues.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project/milestone/1?closed=1
- Show: All closed issues in Sprint 1 (#1-#5)
- Include: Issue titles, closed status

### Screenshot 6: Sprint 2 Issues (Closed)
**File**: `screenshots/module1-agile/06-sprint2-issues.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project/milestone/2?closed=1
- Show: All closed issues in Sprint 2 (#6-#7)

---

## Module 2: TDD & CI/CD

### Screenshot 1: Test Coverage Report
**File**: `screenshots/module2-tdd-ci/01-test-coverage.png`

**Command to run**:
```powershell
.\build.ps1 test
```

**What to capture**:
- Terminal output showing coverage report
- Highlight: 100% coverage on accounts/ modules
- Include: "Required test coverage of 95% reached"

### Screenshot 2: Pytest Output
**File**: `screenshots/module2-tdd-ci/02-pytest-output.png`

**Command to run**:
```powershell
pytest tests/ -v
```

**What to capture**:
- All 5 tests passing (green)
- Test names visible
- Execution time

### Screenshot 3: CI Workflow Configuration
**File**: `screenshots/module2-tdd-ci/03-ci-workflow.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml
- Show: YAML configuration with steps (lint, test, coverage)

### Screenshot 4: CI Run (Passing)
**File**: `screenshots/module2-tdd-ci/04-ci-passing.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project/actions
- Show: Latest successful run with green checkmarks
- Include: All steps passed (lint, test, coverage)

### Screenshot 5: Security Tests
**File**: `screenshots/module2-tdd-ci/05-security-tests.png`

**What to capture**:
- Code showing test_security_headers_and_cors test
- Or: pytest output highlighting security test passing

---

## Module 3: Docker & Kubernetes

### Screenshot 1: Docker Build
**File**: `screenshots/module3-docker-k8s/01-docker-build.png`

**Command to run**:
```powershell
.\build.ps1 docker-build
```

**What to capture**:
- Terminal showing build process
- Include: "Successfully built" and "Successfully tagged accounts:latest"

### Screenshot 2: Docker Images List
**File**: `screenshots/module3-docker-k8s/02-docker-images.png`

**Command to run**:
```powershell
docker images accounts
```

**What to capture**:
- List showing accounts:latest image
- Include: Image ID, size, created date

### Screenshot 3: Docker Container Running
**File**: `screenshots/module3-docker-k8s/03-docker-run.png`

**Command to run**:
```powershell
.\build.ps1 docker-run
docker ps
```

**What to capture**:
- Container running with status "Up"
- Include: Port mapping 5000:5000

### Screenshot 4: API Test in Container
**File**: `screenshots/module3-docker-k8s/04-api-test.png`

**Command to run**:
```powershell
Invoke-RestMethod -Uri http://localhost:5000/accounts
```

**What to capture**:
- Terminal showing successful API response
- Include: JSON output (empty array or account data)

### Screenshot 5: Registry Push (If completed)
**File**: `screenshots/module3-docker-k8s/05-registry-push.png`

**Command to run**:
```powershell
.\build.ps1 docker-push -Registry <your-registry>
```

**What to capture**:
- Terminal showing push progress
- Include: "Pushed to <registry>/accounts:latest"

### Screenshot 6: Kubectl Pods (If cluster available)
**File**: `screenshots/module3-docker-k8s/06-kubectl-pods.png`

**Command to run**:
```bash
kubectl get pods
kubectl get services
```

**What to capture**:
- Pod listing showing accounts and postgres pods running
- Include: Status "Running"

### Screenshot 7: App Running in Cluster (If deployed)
**File**: `screenshots/module3-docker-k8s/07-app-running.png`

**What to capture**:
- Browser or curl showing app accessible via cluster URL
- Include: Response from /accounts endpoint

---

## Module 4: Tekton Pipeline

### Screenshot 1: Pipeline YAML
**File**: `screenshots/module4-tekton/01-pipeline-yaml.png`

**What to capture**:
- Navigate to: https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/pipeline.yaml
- Show: Pipeline definition with all tasks (clone, lint, test, build, deploy)

### Screenshot 2: Pipeline Deployed (If cluster available)
**File**: `screenshots/module4-tekton/02-pipeline-deployed.png`

**Command to run**:
```bash
tkn pipeline list
```

**What to capture**:
- List showing accounts-cd-pipeline installed

### Screenshot 3: Pipeline Run
**File**: `screenshots/module4-tekton/03-pipeline-run.png`

**Command to run**:
```bash
tkn pipelinerun list
```

**What to capture**:
- Pipeline run in progress or completed
- Include: Run name, status, duration

### Screenshot 4: Pipeline Logs
**File**: `screenshots/module4-tekton/04-pipeline-logs.png`

**Command to run**:
```bash
tkn pipelinerun logs -f -L
```

**What to capture**:
- Logs showing each task execution
- Include: lint, test, build, deploy outputs

---

## Quick Capture Commands (Windows PowerShell)

```powershell
# Create screenshots directory
New-Item -ItemType Directory -Force -Path screenshots/module1-agile
New-Item -ItemType Directory -Force -Path screenshots/module2-tdd-ci
New-Item -ItemType Directory -Force -Path screenshots/module3-docker-k8s
New-Item -ItemType Directory -Force -Path screenshots/module4-tekton

# Module 2: Run tests locally
.\build.ps1 test
pytest tests/ -v

# Module 3: Docker
.\build.ps1 docker-build
.\build.ps1 docker-run
docker images accounts
docker ps
Invoke-RestMethod -Uri http://localhost:5000/accounts
```

---

## Screenshot Tips

1. **Use Windows Snipping Tool** or **Snip & Sketch** (Win + Shift + S)
2. **Capture full context** - include URLs, timestamps, status indicators
3. **High resolution** - ensure text is readable
4. **Annotate if needed** - add arrows or highlights for important details
5. **Consistent naming** - follow the filename convention above
6. **Organize immediately** - place in correct folder as you capture

---

## Submission Format

After capturing all screenshots:

1. Add screenshots/ folder to repository
2. Update CAPSTONE_URLS.md with screenshot references
3. Create a ZIP file of screenshots/ folder for submission platform
4. Ensure all URLs in CAPSTONE_URLS.md are accessible

---

**Note**: Screenshots marked "(If completed)" depend on cluster access and registry credentials. Capture what's available and document any blockers.
