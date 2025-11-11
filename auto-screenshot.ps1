# Automated Screenshot Capture Script
# Opens GitHub pages and takes screenshots automatically

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create screenshots directory
$screenshotDir = Join-Path (Get-Location) "screenshots"
if (-not (Test-Path $screenshotDir)) {
    New-Item -ItemType Directory -Path $screenshotDir -Force | Out-Null
}

# Function to capture screenshot
function Take-Screenshot {
    param(
        [string]$FileName
    )
    
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object System.Drawing.Bitmap($screen.Width, $screen.Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size)
    
    $fullPath = Join-Path $screenshotDir $FileName
    $bitmap.Save($fullPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
    $graphics.Dispose()
    $bitmap.Dispose()
    
    Write-Host "Saved: $FileName" -ForegroundColor Green
}

# Function to open URL and capture
function OpenAndCapture {
    param(
        [string]$Url,
        [string]$FileName,
        [string]$Description
    )
    
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "  $Description" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "URL: $Url" -ForegroundColor White
    
    # Open URL
    Start-Process $Url
    
    # Wait for page to load
    Write-Host "Waiting 5 seconds for page to load..." -ForegroundColor Gray
    Start-Sleep -Seconds 5
    
    # Take screenshot
    Take-Screenshot -FileName $FileName
    
    # Pause
    Write-Host "Press any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}

# Welcome
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Screenshot Capture Automation" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "This script will open each URL and capture screenshots" -ForegroundColor White
Write-Host "Make sure your browser window is maximized!" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to start"

# TASK 1: Agile Planning
Write-Host "`n`n========== TASK 1: AGILE PLANNING ==========" -ForegroundColor Magenta

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project" `
    "planning-repository-done.jpg" `
    "1a - Repository Homepage"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/blob/master/.github/ISSUE_TEMPLATE/user_story.md" `
    "planning-storytemplate-done.jpg" `
    "1b - User Story Template"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues" `
    "planning-userstories-done.jpg" `
    "1c - User Stories List"

OpenAndCapture `
    "https://github.com/users/Zeon012/projects/1" `
    "planning-productbacklog-done.jpg" `
    "1d - Product Backlog Kanban"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/labels" `
    "planning-labels-done.jpg" `
    "1e - Labels"

OpenAndCapture `
    "https://github.com/users/Zeon012/projects/1" `
    "planning-kanban-done.jpg" `
    "1f - Kanban Board"

# TASK 2: REST API
Write-Host "`n`n========== TASK 2: REST API ==========" -ForegroundColor Magenta

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/blob/master/setup.cfg" `
    "rest-setupcfg-done.jpg" `
    "2a - setup.cfg File"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/milestone/1?closed=1" `
    "rest-techdebt-done.jpg" `
    "2b - Sprint 1 Completed"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues/1" `
    "rest-create-done.jpg" `
    "2g - Create Account Issue Closed"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues/2" `
    "rest-read-done.jpg" `
    "2h - Read Account Issue Closed"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues/5" `
    "rest-list-done.jpg" `
    "2i - List Accounts Issue Closed"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues/3" `
    "rest-update-done.jpg" `
    "2j - Update Account Issue Closed"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues/4" `
    "rest-delete-done.jpg" `
    "2k - Delete Account Issue Closed"

# TASK 3: CI/CD & Security
Write-Host "`n`n========== TASK 3: CI/CD & SECURITY ==========" -ForegroundColor Magenta

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/milestone/2" `
    "sprint2-plan.jpg" `
    "3a - Sprint 2 Planning"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/actions/runs/19273432787" `
    "ci-workflow-done.jpg" `
    "3b - CI Workflow Run"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/actions" `
    "ci-badge-done.jpg" `
    "3c - GitHub Actions Badge"

OpenAndCapture `
    "https://github.com/users/Zeon012/projects/1" `
    "ci-kanban-done.jpg" `
    "3d - CI Kanban Done"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/blob/master/accounts/__init__.py" `
    "security-code-done.jpg" `
    "3i - Security Code Talisman CORS"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues/7" `
    "security-kanban-done.jpg" `
    "3k - Security Issue Closed"

# TASK 4: Docker & Kubernetes
Write-Host "`n`n========== TASK 4: DOCKER & KUBERNETES ==========" -ForegroundColor Magenta

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/milestone/3" `
    "sprint3-plan.jpg" `
    "4a - Sprint 3 Planning"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/issues/8" `
    "kube-docker-done.jpg" `
    "4c - Docker Issue Closed"

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/blob/master/k8s/deployment.yaml" `
    "kube-kubernetes-done.jpg" `
    "4g - Kubernetes Manifests"

# TASK 5: Tekton
Write-Host "`n`n========== TASK 5: TEKTON PIPELINE ==========" -ForegroundColor Magenta

OpenAndCapture `
    "https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/pipeline.yaml" `
    "cd-pipeline-done.jpg" `
    "5b - Tekton Pipeline Definition"

# Summary
Write-Host "`n`n========================================" -ForegroundColor Green
Write-Host "  GITHUB SCREENSHOTS COMPLETE!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Screenshots saved in: screenshots\" -ForegroundColor White
Write-Host ""
Write-Host "Still needed (run separately):" -ForegroundColor Yellow
Write-Host "  - API test screenshots (2c-2f): Run capture-screenshots.ps1" -ForegroundColor White
Write-Host "  - Security headers (3j): Run capture-screenshots.ps1" -ForegroundColor White
Write-Host "  - Docker images (4e): Run capture-screenshots.ps1" -ForegroundColor White
Write-Host "  - App output (4b): Run capture-screenshots.ps1" -ForegroundColor White
Write-Host ""
Write-Host "GitHub screenshots: 21/30 complete" -ForegroundColor Green
Write-Host "API/Docker screenshots: 6 remaining" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
