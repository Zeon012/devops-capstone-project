# Automated Screenshot Capture - REMAINING ITEMS ONLY
# This script captures the 22 missing screenshots

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$screenshotsDir = "screenshots"
if (-not (Test-Path $screenshotsDir)) {
    New-Item -ItemType Directory -Path $screenshotsDir | Out-Null
}

function Take-Screenshot {
    param([string]$filename)
    
    $fullPath = Join-Path $screenshotsDir $filename
    
    # Check if already exists
    if (Test-Path $fullPath) {
        Write-Host "  ✓ Already exists: $filename" -ForegroundColor Gray
        return
    }
    
    Write-Host "  📸 Capturing: $filename" -ForegroundColor Yellow
    Start-Sleep -Seconds 1
    
    $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)
    
    $bitmap.Save($fullPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
    $graphics.Dispose()
    $bitmap.Dispose()
    
    Write-Host "  ✓ Saved: $filename" -ForegroundColor Green
}

function OpenAndCapture {
    param(
        [string]$url,
        [string]$filename,
        [string]$description
    )
    
    Write-Host "`n[$description]" -ForegroundColor Cyan
    Write-Host "Opening: $url" -ForegroundColor White
    
    Start-Process $url
    Start-Sleep -Seconds 3
    
    Take-Screenshot -filename $filename
    Start-Sleep -Seconds 1
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  REMAINING SCREENSHOT AUTOMATION" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

Write-Host "This script will capture the 22 missing screenshots." -ForegroundColor White
Write-Host "Make sure your browser is ready and visible on screen.`n" -ForegroundColor Yellow
Write-Host "Press any key to start..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# TASK 2: REST API Development (9 remaining)
Write-Host "`n========== TASK 2: REST API (9 screenshots) ==========" -ForegroundColor Magenta

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/7" `
    -filename "rest-create-done.jpg" `
    -description "2g - Issue #7 Create endpoint CLOSED"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/4" `
    -filename "rest-read-done.jpg" `
    -description "2h - Issue #4 Read endpoint CLOSED"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/3" `
    -filename "rest-list-done.jpg" `
    -description "2i - Issue #3 List endpoint CLOSED"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/5" `
    -filename "rest-update-done.jpg" `
    -description "2j - Issue #5 Update endpoint CLOSED"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/6" `
    -filename "rest-delete-done.jpg" `
    -description "2k - Issue #6 Delete endpoint CLOSED"

Write-Host "`nNow we'll capture the API test screenshots." -ForegroundColor Yellow
Write-Host "Please run the app locally and test each endpoint." -ForegroundColor Yellow
Write-Host "`nPress any key when you have the READ response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Take-Screenshot -filename "read-accounts.jpg"

Write-Host "`nPress any key when you have the LIST response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Take-Screenshot -filename "list-accounts.jpg"

Write-Host "`nPress any key when you have the UPDATE response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Take-Screenshot -filename "update-accounts.jpg"

Write-Host "`nPress any key when you have the DELETE response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Take-Screenshot -filename "delete-accounts.jpg"

# TASK 3: CI/CD Pipeline (7 screenshots)
Write-Host "`n========== TASK 3: CI/CD Pipeline (7 screenshots) ==========" -ForegroundColor Magenta

OpenAndCapture `
    -url "https://github.com/users/Zeon012/projects/1?query=is:open" `
    -filename "sprint2-plan.jpg" `
    -description "3a - Sprint 2 Plan showing issues 9, 10, 11"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml" `
    -filename "ci-workflow-done.jpg" `
    -description "3b - CI workflow YAML file"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project" `
    -filename "ci-badge-done.jpg" `
    -description "3c - README with passing CI badge"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/9" `
    -filename "ci-kanban-done.jpg" `
    -description "3d - Issue #9 Setup CI CLOSED"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/accounts/__init__.py" `
    -filename "security-code-done.jpg" `
    -description "3e - Talisman/CORS code"

Write-Host "`nFor security headers screenshot, run the app and inspect network headers." -ForegroundColor Yellow
Write-Host "Press any key when you have the security headers visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Take-Screenshot -filename "security-headers-done.jpg"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/11" `
    -filename "security-kanban-done.jpg" `
    -description "3g - Issue #11 Security CLOSED"

# TASK 4: Docker & Kubernetes (6 screenshots)
Write-Host "`n========== TASK 4: Docker & Kubernetes (6 screenshots) ==========" -ForegroundColor Magenta

OpenAndCapture `
    -url "https://github.com/users/Zeon012/projects/1?query=is:open" `
    -filename "sprint3-plan.jpg" `
    -description "4a - Sprint 3 Plan showing issues 12, 13"

Write-Host "`nFor Docker screenshots, we need terminal outputs." -ForegroundColor Yellow
Write-Host "Press any key when you have 'docker run' output visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Take-Screenshot -filename "kube-app-output.jpg"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/Dockerfile" `
    -filename "kube-docker-done.jpg" `
    -description "4c - Dockerfile"

Write-Host "`nPress any key when you have 'docker images' output visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Take-Screenshot -filename "kube-images.jpg"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/k8s/deployment.yaml" `
    -filename "kube-deploy-accounts.jpg" `
    -description "4f - Kubernetes deployment.yaml"

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/12" `
    -filename "kube-kubernetes-done.jpg" `
    -description "4g - Issue #12 Kubernetes CLOSED"

# TASK 5: Tekton Pipeline (1 screenshot)
Write-Host "`n========== TASK 5: Tekton Pipeline (1 screenshot) ==========" -ForegroundColor Magenta

OpenAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/13" `
    -filename "cd-pipeline-done.jpg" `
    -description "5a - Issue #13 Tekton CLOSED"

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "  AUTOMATION COMPLETE!" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

$captured = (Get-ChildItem screenshots -File | Where-Object { $_.Name -ne '.gitkeep' }).Count
Write-Host "Total screenshots captured: $captured/30" -ForegroundColor Green
Write-Host "`nRemaining manual tasks:" -ForegroundColor Yellow
Write-Host "  1. Verify all 30 screenshots are present" -ForegroundColor White
Write-Host "  2. Submit 2 URLs (ci-build.yaml and Dockerfile)" -ForegroundColor White
Write-Host "  3. Submit pipelinerun.txt" -ForegroundColor White
Write-Host "`nGood luck with your submission! 🚀`n" -ForegroundColor Green
