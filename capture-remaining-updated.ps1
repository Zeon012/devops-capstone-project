# Complete Screenshot Automation - Updated Version
# Captures remaining 18 screenshots with terminal automation

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$screenshotsDir = "screenshots"
if (-not (Test-Path $screenshotsDir)) {
    New-Item -ItemType Directory -Path $screenshotsDir | Out-Null
}

function Capture-Screenshot {
    param([string]$filename)
    
    $fullPath = Join-Path $screenshotsDir $filename
    
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

function Run-APICommand {
    param(
        [string]$command,
        [string]$filename,
        [string]$description
    )
    
    Write-Host ""
    Write-Host "[$description]" -ForegroundColor Cyan
    Write-Host "Command: $command" -ForegroundColor White
    
    # Create a script file to run the command in a new maximized window
    $scriptContent = @"
`$Host.UI.RawUI.WindowTitle = '$description'
Write-Host '========================================' -ForegroundColor Cyan
Write-Host '  $description' -ForegroundColor Cyan
Write-Host '========================================' -ForegroundColor Cyan
Write-Host ''
Write-Host 'Command: $command' -ForegroundColor Yellow
Write-Host ''
$command | ConvertTo-Json -Depth 10
Write-Host ''
Write-Host 'Press any key to continue...' -ForegroundColor Green
`$null = `$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
"@
    
    $tempScript = [System.IO.Path]::GetTempFileName() + ".ps1"
    $scriptContent | Out-File -FilePath $tempScript -Encoding UTF8
    
    # Start PowerShell in new maximized window
    $process = Start-Process powershell.exe -ArgumentList "-NoExit", "-ExecutionPolicy", "Bypass", "-File", $tempScript -PassThru -WindowStyle Maximized
    
    Write-Host "  Waiting for terminal to open and command to execute..." -ForegroundColor Yellow
    Write-Host "  Auto-capturing in 10 seconds..." -ForegroundColor Cyan
    Start-Sleep -Seconds 10
    
    Capture-Screenshot -filename $filename
    
    # Close the window
    Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
    Remove-Item $tempScript -Force -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  REMAINING SCREENSHOTS - 18 items" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "This script will capture the remaining 18 screenshots." -ForegroundColor White
Write-Host "It will open browsers and terminals automatically." -ForegroundColor Yellow
Write-Host ""
Write-Host "Make sure Flask app is running on http://127.0.0.1:5000" -ForegroundColor Yellow
Write-Host "Press any key to start..." -ForegroundColor Green
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# TASK 2: REST API - 4 API test screenshots
Write-Host ""
Write-Host "========== TASK 2: REST API Testing - 4 screenshots ==========" -ForegroundColor Magenta

# Create account first
Write-Host ""
Write-Host "Creating test account..." -ForegroundColor Cyan
try {
    $createBody = '{"name":"John Doe"}'
    $created = Invoke-RestMethod -Uri "http://127.0.0.1:5000/accounts" -Method POST -ContentType "application/json" -Body $createBody
    $accountId = $created.id
    Write-Host "  Created account ID: $accountId" -ForegroundColor Green
} catch {
    Write-Host "  ERROR: Could not create account. Is Flask running?" -ForegroundColor Red
    exit 1
}

Run-APICommand `
    -command "Invoke-RestMethod -Uri 'http://127.0.0.1:5000/accounts/$accountId' -Method GET" `
    -filename "read-accounts.jpg" `
    -description "2c - Read Single Account"

Run-APICommand `
    -command "Invoke-RestMethod -Uri 'http://127.0.0.1:5000/accounts' -Method GET" `
    -filename "list-accounts.jpg" `
    -description "2d - List All Accounts"

Run-APICommand `
    -command "`$body = '{`"name`":`"Jane Doe`"}'; Invoke-RestMethod -Uri 'http://127.0.0.1:5000/accounts/$accountId' -Method PUT -ContentType 'application/json' -Body `$body" `
    -filename "update-accounts.jpg" `
    -description "2e - Update Account"

Run-APICommand `
    -command "Invoke-RestMethod -Uri 'http://127.0.0.1:5000/accounts/$accountId' -Method DELETE; Invoke-RestMethod -Uri 'http://127.0.0.1:5000/accounts' -Method GET" `
    -filename "delete-accounts.jpg" `
    -description "2f - Delete Account and Verify"

# TASK 3: CI/CD Pipeline - 7 screenshots
Write-Host ""
Write-Host "========== TASK 3: CI/CD Pipeline - 7 screenshots ==========" -ForegroundColor Magenta

Open-PageAndCapture `
    -url "https://github.com/users/Zeon012/projects/1" `
    -filename "sprint2-plan.jpg" `
    -description "3a - Sprint 2 Plan"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml" `
    -filename "ci-workflow-done.jpg" `
    -description "3b - CI Workflow YAML"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project" `
    -filename "ci-badge-done.jpg" `
    -description "3c - CI Badge on README"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/9" `
    -filename "ci-kanban-done.jpg" `
    -description "3d - Issue 9 CI Setup CLOSED"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/accounts/__init__.py" `
    -filename "security-code-done.jpg" `
    -description "3e - Security Code Talisman and CORS"

Write-Host ""
Write-Host "For security headers, open browser DevTools Network tab." -ForegroundColor Yellow
Write-Host "Navigate to: http://127.0.0.1:5000/accounts" -ForegroundColor White
Write-Host "Press ENTER when you have the headers visible..." -ForegroundColor Green
Read-Host
Capture-Screenshot -filename "security-headers-done.jpg"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/issues/11" `
    -filename "security-kanban-done.jpg" `
    -description "3g - Issue 11 Security CLOSED"

# TASK 4: Docker and Kubernetes - 6 screenshots
Write-Host ""
Write-Host "========== TASK 4: Docker and Kubernetes - 6 screenshots ==========" -ForegroundColor Magenta

Open-PageAndCapture `
    -url "https://github.com/users/Zeon012/projects/1" `
    -filename "sprint3-plan.jpg" `
    -description "4a - Sprint 3 Plan"

Run-APICommand `
    -command "docker run --rm -p 5001:5000 accounts:latest" `
    -filename "kube-app-output.jpg" `
    -description "4b - Docker Run Output"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/Dockerfile" `
    -filename "kube-docker-done.jpg" `
    -description "4c - Dockerfile"

Run-APICommand `
    -command "docker images | Select-String 'accounts'" `
    -filename "kube-images.jpg" `
    -description "4e - Docker Images List"

Open-PageAndCapture `
    -url "https://github.com/Zeon012/devops-capstone-project/blob/master/k8s/deployment.yaml" `
    -filename "kube-deploy-accounts.jpg" `
    -description "4f - Kubernetes Deployment YAML"

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
    -description "5a - Issue 13 Tekton CD Pipeline CLOSED"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AUTOMATION COMPLETE!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$captured = (Get-ChildItem screenshots -File | Where-Object { $_.Name -ne '.gitkeep' }).Count
Write-Host "Total screenshots captured: $captured/30" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Verify all 30 screenshots in screenshots folder" -ForegroundColor White
Write-Host "  2. Submit 2 URLs:" -ForegroundColor White
Write-Host "     - ci-build.yaml: https://github.com/Zeon012/devops-capstone-project/blob/master/.github/workflows/ci.yml" -ForegroundColor Gray
Write-Host "     - Dockerfile: https://github.com/Zeon012/devops-capstone-project/blob/master/Dockerfile" -ForegroundColor Gray
Write-Host "  3. Submit pipelinerun.txt" -ForegroundColor White
Write-Host ""
Write-Host "Good luck with your submission!" -ForegroundColor Green
Write-Host ""
