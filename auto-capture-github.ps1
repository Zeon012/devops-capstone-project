# Automated Screenshot Capture Script for DevOps Capstone
# This script opens each required URL and automatically captures screenshots

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to take a screenshot
function Capture-Screenshot {
    param(
        [string]$FilePath,
        [string]$Title
    )
    
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "  Capturing: $Title" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
    
    # Wait for page to load
    Start-Sleep -Seconds 3
    
    # Capture screenshot
    $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object System.Drawing.Bitmap($screen.Width, $screen.Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size)
    
    # Save to file
    $fullPath = Join-Path (Get-Location) "screenshots\$FilePath"
    $directory = Split-Path $fullPath -Parent
    if (-not (Test-Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
    }
    
    $bitmap.Save($fullPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
    # Cleanup
    $graphics.Dispose()
    $bitmap.Dispose()
    
    Write-Host "✓ Saved: screenshots\$FilePath" -ForegroundColor Green
}

# Function to open URL and capture
function Open-AndCapture {
    param(
        [string]$Url,
        [string]$FileName,
        [string]$Description,
        [int]$WaitSeconds = 5
    )
    
    Write-Host "`n" -NoNewline
    Write-Host "================================================" -ForegroundColor Yellow
    Write-Host "  $Description" -ForegroundColor Yellow
    Write-Host "================================================" -ForegroundColor Yellow
    Write-Host "Opening: $Url" -ForegroundColor White
    
    # Open URL in default browser
    Start-Process $Url
    
    Write-Host "Waiting $WaitSeconds seconds for page to load..." -ForegroundColor Cyan
    Start-Sleep -Seconds $WaitSeconds
    
    # Capture screenshot
    Capture-Screenshot -FilePath $FileName -Title $Description
    
    Write-Host "Press any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}

# Create screenshots directory
if (-not (Test-Path "screenshots")) {
    New-Item -ItemType Directory -Path "screenshots" -Force | Out-Null
}

Write-Host "========================================" -ForegroundColor Green
Write-Host "  DevOps Capstone Screenshot Automation" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "This script will:" -ForegroundColor White
Write-Host "  1. Open each required URL" -ForegroundColor White
Write-Host "  2. Wait for page to load" -ForegroundColor White
Write-Host "  3. Automatically capture screenshot" -ForegroundColor White
Write-Host "  4. Save with correct filename" -ForegroundColor White
Write-Host ""
Write-Host "Make sure your browser window is maximized!" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to start"

# TASK 1: Agile Planning (6 screenshots)
Write-Host "`n`n==================================================" -ForegroundColor Magenta
Write-Host "  TASK 1: AGILE PLANNING (6 screenshots)" -ForegroundColor Magenta
Write-Host "==================================================" -ForegroundColor Magenta

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project" `
    -FileName "planning-repository-done.jpg" `
    -Description "1a) Repository Homepage" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/blob/master/.github/ISSUE_TEMPLATE/user_story.md" `
    -FileName "planning-storytemplate-done.jpg" `
    -Description "1b) User Story Template" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues" `
    -FileName "planning-userstories-done.jpg" `
    -Description "1c) User Stories List" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/users/Zeon012/projects/1" `
    -FileName "planning-productbacklog-done.jpg" `
    -Description "1d) Product Backlog (Kanban)" `
    -WaitSeconds 6

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/labels" `
    -FileName "planning-labels-done.jpg" `
    -Description "1e) Labels" `
    -WaitSeconds 4

Open-AndCapture `
    -Url "https://github.com/users/Zeon012/projects/1" `
    -FileName "planning-kanban-done.jpg" `
    -Description "1f) Kanban Board" `
    -WaitSeconds 6

# TASK 2: REST API (GitHub screenshots only - API tests done separately)
Write-Host "`n`n==================================================" -ForegroundColor Magenta
Write-Host "  TASK 2: REST API - GitHub Screenshots (5/11)" -ForegroundColor Magenta
Write-Host "==================================================" -ForegroundColor Magenta

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/blob/master/setup.cfg" `
    -FileName "rest-setupcfg-done.jpg" `
    -Description "2a) setup.cfg File" `
    -WaitSeconds 4

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/milestone/1?closed=1" `
    -FileName "rest-techdebt-done.jpg" `
    -Description "2b) Sprint 1 Completed" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues/1" `
    -FileName "rest-create-done.jpg" `
    -Description "2g) Create Endpoint Issue Closed" `
    -WaitSeconds 4

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues/2" `
    -FileName "rest-read-done.jpg" `
    -Description "2h) Read Endpoint Issue Closed" `
    -WaitSeconds 4

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues/5" `
    -FileName "rest-list-done.jpg" `
    -Description "2i) List Endpoint Issue Closed" `
    -WaitSeconds 4

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues/3" `
    -FileName "rest-update-done.jpg" `
    -Description "2j) Update Endpoint Issue Closed" `
    -WaitSeconds 4

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues/4" `
    -FileName "rest-delete-done.jpg" `
    -Description "2k) Delete Endpoint Issue Closed" `
    -WaitSeconds 4

# TASK 3: CI/CD & Security
Write-Host "`n`n==================================================" -ForegroundColor Magenta
Write-Host "  TASK 3: CI/CD & SECURITY (6 screenshots)" -ForegroundColor Magenta
Write-Host "==================================================" -ForegroundColor Magenta

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/milestone/2" `
    -FileName "sprint2-plan.jpg" `
    -Description "3a) Sprint 2 Planning" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/actions/runs/19273432787" `
    -FileName "ci-workflow-done.jpg" `
    -Description "3b) CI Workflow Run" `
    -WaitSeconds 6

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/actions" `
    -FileName "ci-badge-done.jpg" `
    -Description "3c) GitHub Actions Badge" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/users/Zeon012/projects/1" `
    -FileName "ci-kanban-done.jpg" `
    -Description "3d) CI Kanban (Sprint 2 Done)" `
    -WaitSeconds 6

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/blob/master/accounts/__init__.py" `
    -FileName "security-code-done.jpg" `
    -Description "3i) Security Code (Talisman + CORS)" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues/7" `
    -FileName "security-kanban-done.jpg" `
    -Description "3k) Security Issue Closed" `
    -WaitSeconds 4

# TASK 4: Docker & Kubernetes
Write-Host "`n`n==================================================" -ForegroundColor Magenta
Write-Host "  TASK 4: DOCKER & KUBERNETES (3 screenshots)" -ForegroundColor Magenta
Write-Host "==================================================" -ForegroundColor Magenta

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/milestone/3" `
    -FileName "sprint3-plan.jpg" `
    -Description "4a) Sprint 3 Planning" `
    -WaitSeconds 5

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/issues/8" `
    -FileName "kube-docker-done.jpg" `
    -Description "4c) Docker Issue Closed" `
    -WaitSeconds 4

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/blob/master/k8s/deployment.yaml" `
    -FileName "kube-kubernetes-done.jpg" `
    -Description "4g) Kubernetes Manifests" `
    -WaitSeconds 5

# TASK 5: Tekton
Write-Host "`n`n==================================================" -ForegroundColor Magenta
Write-Host "  TASK 5: TEKTON PIPELINE (1 screenshot)" -ForegroundColor Magenta
Write-Host "==================================================" -ForegroundColor Magenta

Open-AndCapture `
    -Url "https://github.com/Zeon012/devops-capstone-project/blob/master/tekton/pipeline.yaml" `
    -FileName "cd-pipeline-done.jpg" `
    -Description "5b) Tekton Pipeline Definition" `
    -WaitSeconds 5

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
Write-Host "✓ GitHub screenshots: 21/30 complete" -ForegroundColor Green
Write-Host "⏳ API/Docker screenshots: 6 remaining" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
