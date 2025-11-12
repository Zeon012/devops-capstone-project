# Automated Screenshot Capture - REMAINING ITEMS ONLY
# This script captures the 22 missing screenshots

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$screenshotsDir = "screenshots"
if (-not (Test-Path $screenshotsDir)) {
    New-Item -ItemType Directory -Path $screenshotsDir | Out-Null
}

function Capture-Screenshot {
    param([string]$filename)
    
    $fullPath = Join-Path $screenshotsDir $filename
    
    # Check if already exists
    if (Test-Path $fullPath) {
        Write-Host "  Already exists: $filename" -ForegroundColor Gray
        return
    }
    
    Write-Host "  Capturing: $filename" -ForegroundColor Yellow
    Start-Sleep -Seconds 1
    
    $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)
    
    $bitmap.Save($fullPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
    $graphics.Dispose()
    $bitmap.Dispose()
    
    Write-Host "  Saved: $filename" -ForegroundColor Green
}

function Open-PageAndCapture {
    param(
        [string]$url,
        [string]$filename,
        [string]$description
    )
    
    Write-Host ""
    Write-Host "[$description]" -ForegroundColor Cyan
    Write-Host "Opening: $url" -ForegroundColor White
    
    Start-Process $url
    Start-Sleep -Seconds 3
    
    Capture-Screenshot -filename $filename
    Start-Sleep -Seconds 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  REMAINING SCREENSHOT AUTOMATION" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "This script will capture the 22 missing screenshots." -ForegroundColor White
Write-Host "Make sure your browser is ready and visible on screen." -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to start..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# TASK 2: REST API Development - 9 remaining
Write-Host ""
Write-Host "========== TASK 2: REST API - 9 screenshots ==========" -ForegroundColor Magenta

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/7" `
    -filename "rest-create-done.jpg" `
    -description "2g - Issue 7 Create endpoint CLOSED"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/4" `
    -filename "rest-read-done.jpg" `
    -description "2h - Issue 4 Read endpoint CLOSED"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/3" `
    -filename "rest-list-done.jpg" `
    -description "2i - Issue 3 List endpoint CLOSED"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/5" `
    -filename "rest-update-done.jpg" `
    -description "2j - Issue 5 Update endpoint CLOSED"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/6" `
    -filename "rest-delete-done.jpg" `
    -description "2k - Issue 6 Delete endpoint CLOSED"

Write-Host ""
Write-Host "Now we need API test screenshots from running app." -ForegroundColor Yellow
Write-Host "Please test each endpoint and have the response visible." -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key when you have the READ response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Capture-Screenshot -filename "read-accounts.jpg"

Write-Host ""
Write-Host "Press any key when you have the LIST response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Capture-Screenshot -filename "list-accounts.jpg"

Write-Host ""
Write-Host "Press any key when you have the UPDATE response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Capture-Screenshot -filename "update-accounts.jpg"

Write-Host ""
Write-Host "Press any key when you have the DELETE response visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Capture-Screenshot -filename "delete-accounts.jpg"

# TASK 3: CI/CD Pipeline - 7 screenshots
Write-Host ""
Write-Host "========== TASK 3: CI/CD Pipeline - 7 screenshots ==========" -ForegroundColor Magenta

Open-PageAndCapture `
    -url "https://github.com/users/Zeon012/projects/1?query=is:open" `
    -filename "sprint2-plan.jpg" `
    -description "3a - Sprint 2 Plan showing issues 9, 10, 11"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml" `
    -filename "ci-workflow-done.jpg" `
    -description "3b - CI workflow YAML file"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project" `
    -filename "ci-badge-done.jpg" `
    -description "3c - README with passing CI badge"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/9" `
    -filename "ci-kanban-done.jpg" `
    -description "3d - Issue 9 Setup CI CLOSED"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/accounts/__init__.py" `
    -filename "security-code-done.jpg" `
    -description "3e - Talisman and CORS security code"

Write-Host ""
Write-Host "For security headers, run the app and inspect network headers." -ForegroundColor Yellow
Write-Host "Press any key when you have the security headers visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Capture-Screenshot -filename "security-headers-done.jpg"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/11" `
    -filename "security-kanban-done.jpg" `
    -description "3g - Issue 11 Security CLOSED"

# TASK 4: Docker and Kubernetes - 6 screenshots
Write-Host ""
Write-Host "========== TASK 4: Docker and Kubernetes - 6 screenshots ==========" -ForegroundColor Magenta

Open-PageAndCapture `
    -url "https://github.com/users/Zeon012/projects/1?query=is:open" `
    -filename "sprint3-plan.jpg" `
    -description "4a - Sprint 3 Plan showing issues 12, 13"

Write-Host ""
Write-Host "For Docker screenshots, we need terminal outputs." -ForegroundColor Yellow
Write-Host "Press any key when you have docker run output visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Capture-Screenshot -filename "kube-app-output.jpg"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/Dockerfile" `
    -filename "kube-docker-done.jpg" `
    -description "4c - Dockerfile"

Write-Host ""
Write-Host "Press any key when you have docker images output visible..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Capture-Screenshot -filename "kube-images.jpg"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/k8s/deployment.yaml" `
    -filename "kube-deploy-accounts.jpg" `
    -description "4f - Kubernetes deployment manifest"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/12" `
    -filename "kube-kubernetes-done.jpg" `
    -description "4g - Issue 12 Kubernetes CLOSED"

# TASK 5: Tekton Pipeline - 1 screenshot
Write-Host ""
Write-Host "========== TASK 5: Tekton Pipeline - 1 screenshot ==========" -ForegroundColor Magenta

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/13" `
    -filename "cd-pipeline-done.jpg" `
    -description "5a - Issue 13 Tekton CLOSED"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AUTOMATION COMPLETE!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$captured = (Get-ChildItem screenshots -File | Where-Object { $_.Name -ne '.gitkeep' }).Count
Write-Host "Total screenshots captured: $captured/30" -ForegroundColor Green
Write-Host ""
Write-Host "Remaining manual tasks:" -ForegroundColor Yellow
Write-Host "  1. Verify all 30 screenshots are present" -ForegroundColor White
Write-Host "  2. Submit 2 URLs for ci-build.yaml and Dockerfile" -ForegroundColor White
Write-Host "  3. Submit pipelinerun.txt" -ForegroundColor White
Write-Host ""
Write-Host "Good luck with your submission!" -ForegroundColor Green
Write-Host ""
