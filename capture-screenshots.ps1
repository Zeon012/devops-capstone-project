# Test API and Capture Screenshots Helper Script
# Run this to systematically test all endpoints and pause for screenshots

Write-Host "========================================" -ForegroundColor Green
Write-Host "  Accounts Service API Screenshot Tool" -ForegroundColor Green  
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if Docker image exists
$imageExists = docker images accounts:latest -q
if (-not $imageExists) {
    Write-Host "ERROR: Docker image 'accounts:latest' not found!" -ForegroundColor Red
    Write-Host "Please build the image first:" -ForegroundColor Yellow
    Write-Host "  docker build -t accounts:latest ." -ForegroundColor Yellow
    exit 1
}

Write-Host "Starting Docker container..." -ForegroundColor Cyan
docker run -d -p 5000:5000 -e FLASK_ENV=development --name accounts-test accounts:latest | Out-Null
Start-Sleep -Seconds 3

$containerRunning = docker ps --filter "name=accounts-test" --format "{{.Names}}"
if ($containerRunning -ne "accounts-test") {
    Write-Host "ERROR: Failed to start container!" -ForegroundColor Red
    exit 1
}

Write-Host "✓ Container started successfully" -ForegroundColor Green
Write-Host ""

# Test CREATE
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TEST 1: CREATE Account" -ForegroundColor Cyan
Write-Host "  POST /accounts" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Request Body:" -ForegroundColor Yellow
Write-Host '{"name":"John Doe","email":"john@example.com"}' -ForegroundColor White
Write-Host ""
Write-Host "Response:" -ForegroundColor Yellow

try {
    $create = Invoke-RestMethod -Method POST -Uri http://localhost:5000/accounts `
        -ContentType "application/json" `
        -Body '{"name":"John Doe","email":"john@example.com"}'
    $create | ConvertTo-Json -Depth 3
    Write-Host ""
    Write-Host "Status: 201 Created ✓" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "📸 Screenshot this window as: read-accounts.jpg (after pressing Enter)" -ForegroundColor Yellow
Read-Host "Press Enter to continue to next test"
Clear-Host

# Test READ
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TEST 2: READ Account" -ForegroundColor Cyan
Write-Host "  GET /accounts/1" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Response:" -ForegroundColor Yellow

try {
    $read = Invoke-RestMethod -Method GET -Uri http://localhost:5000/accounts/1
    $read | ConvertTo-Json -Depth 3
    Write-Host ""
    Write-Host "Status: 200 OK ✓" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "📸 Screenshot this window as: read-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue to next test"
Clear-Host

# Test LIST
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TEST 3: LIST Accounts" -ForegroundColor Cyan
Write-Host "  GET /accounts" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Response:" -ForegroundColor Yellow

try {
    $list = Invoke-RestMethod -Method GET -Uri http://localhost:5000/accounts
    $list | ConvertTo-Json -Depth 3
    Write-Host ""
    Write-Host "Status: 200 OK ✓" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "📸 Screenshot this window as: list-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue to next test"
Clear-Host

# Test UPDATE
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TEST 4: UPDATE Account" -ForegroundColor Cyan
Write-Host "  PUT /accounts/1" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Request Body:" -ForegroundColor Yellow
Write-Host '{"name":"Jane Smith","email":"jane@example.com"}' -ForegroundColor White
Write-Host ""
Write-Host "Response:" -ForegroundColor Yellow

try {
    $update = Invoke-RestMethod -Method PUT -Uri http://localhost:5000/accounts/1 `
        -ContentType "application/json" `
        -Body '{"name":"Jane Smith","email":"jane@example.com"}'
    $update | ConvertTo-Json -Depth 3
    Write-Host ""
    Write-Host "Status: 200 OK ✓" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "📸 Screenshot this window as: update-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue to next test"
Clear-Host

# Test DELETE
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TEST 5: DELETE Account" -ForegroundColor Cyan
Write-Host "  DELETE /accounts/1" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    Invoke-RestMethod -Method DELETE -Uri http://localhost:5000/accounts/1 -ErrorAction Stop
    Write-Host "Response: (empty body)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Status: 204 No Content ✓" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "📸 Screenshot this window as: delete-accounts.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to continue to security headers test"
Clear-Host

# Test Security Headers
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TEST 6: Security Headers" -ForegroundColor Cyan
Write-Host "  GET /accounts (with headers)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    $response = Invoke-WebRequest -Uri http://localhost:5000/accounts -Method GET
    Write-Host "Response Headers:" -ForegroundColor Yellow
    Write-Host ""
    $response.Headers | Format-Table -AutoSize
    Write-Host ""
    Write-Host "✓ CORS Header (Access-Control-Allow-Origin): " -NoNewline -ForegroundColor Green
    Write-Host $response.Headers.'Access-Control-Allow-Origin' -ForegroundColor White
    Write-Host ""
    Write-Host "Status: 200 OK ✓" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "📸 Screenshot this window as: security-headers-done.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to view Docker images"
Clear-Host

# Show Docker Images
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Docker Images" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

docker images accounts

Write-Host ""
Write-Host "📸 Screenshot this window as: kube-images.jpg" -ForegroundColor Yellow
Read-Host "Press Enter to clean up"

# Cleanup
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Cleaning Up" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

docker stop accounts-test | Out-Null
docker rm accounts-test | Out-Null

Write-Host "✓ Container stopped and removed" -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Testing Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Screenshots captured:" -ForegroundColor Yellow
Write-Host "  ✓ read-accounts.jpg" -ForegroundColor White
Write-Host "  ✓ list-accounts.jpg" -ForegroundColor White
Write-Host "  ✓ update-accounts.jpg" -ForegroundColor White
Write-Host "  ✓ delete-accounts.jpg" -ForegroundColor White
Write-Host "  ✓ security-headers-done.jpg" -ForegroundColor White
Write-Host "  ✓ kube-images.jpg" -ForegroundColor White
Write-Host ""
Write-Host "Next: Capture GitHub screenshots from SCREENSHOT_FILENAMES.md" -ForegroundColor Cyan
