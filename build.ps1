# PowerShell Build Script for Windows
# Alternative to Makefile for Windows users

param(
    [Parameter(Position=0)]
    [string]$Command = "help",
    
    [Parameter()]
    [string]$Registry = ""
)

function Show-Help {
    Write-Host "Available commands:" -ForegroundColor Cyan
    Write-Host "  .\build.ps1 install       - Install dependencies"
    Write-Host "  .\build.ps1 test          - Run tests with coverage"
    Write-Host "  .\build.ps1 lint          - Run flake8 linter"
    Write-Host "  .\build.ps1 run           - Run the Flask app locally"
    Write-Host "  .\build.ps1 clean         - Clean up generated files"
    Write-Host "  .\build.ps1 docker-build  - Build Docker image"
    Write-Host "  .\build.ps1 docker-run    - Run Docker container"
    Write-Host "  .\build.ps1 docker-stop   - Stop Docker container"
    Write-Host "  .\build.ps1 docker-push   - Push Docker image (requires -Registry parameter)"
    Write-Host "  .\build.ps1 deploy-k8s    - Deploy to Kubernetes"
    Write-Host ""
    Write-Host "Example:" -ForegroundColor Yellow
    Write-Host "  .\build.ps1 docker-push -Registry us.icr.io/your-namespace"
}

function Install-Dependencies {
    Write-Host "Installing dependencies..." -ForegroundColor Green
    python -m pip install --upgrade pip
    pip install -r requirements-dev.txt
    pip install -e .
}

function Run-Tests {
    Write-Host "Running tests with coverage..." -ForegroundColor Green
    pytest tests/ -v --cov=accounts --cov-report=term --cov-report=html --cov-fail-under=95
}

function Run-Lint {
    Write-Host "Running flake8 linter..." -ForegroundColor Green
    flake8 . --max-line-length=120 --exclude=.venv,__pycache__,.pytest_cache
}

function Run-App {
    Write-Host "Starting Flask app..." -ForegroundColor Green
    python run.py
}

function Clean-Files {
    Write-Host "Cleaning up generated files..." -ForegroundColor Green
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue __pycache__, .pytest_cache, htmlcov, .coverage
    Get-ChildItem -Recurse -Directory -Filter __pycache__ | Remove-Item -Recurse -Force
    Get-ChildItem -Recurse -File -Filter *.pyc | Remove-Item -Force
}

function Build-Docker {
    Write-Host "Building Docker image..." -ForegroundColor Green
    docker build -t accounts:latest .
}

function Run-Docker {
    Write-Host "Running Docker container..." -ForegroundColor Green
    docker stop accounts-service 2>$null
    docker rm accounts-service 2>$null
    docker run -d -p 5000:5000 -e FLASK_ENV=development --name accounts-service accounts:latest
    Write-Host "Container started. API available at http://localhost:5000/accounts" -ForegroundColor Cyan
}

function Stop-Docker {
    Write-Host "Stopping Docker container..." -ForegroundColor Green
    docker stop accounts-service
    docker rm accounts-service
}

function Push-Docker {
    if ([string]::IsNullOrEmpty($Registry)) {
        Write-Host "Error: Registry not specified. Use: .\build.ps1 docker-push -Registry <url>" -ForegroundColor Red
        exit 1
    }
    Write-Host "Pushing Docker image to $Registry..." -ForegroundColor Green
    docker tag accounts:latest "$Registry/accounts:latest"
    docker push "$Registry/accounts:latest"
}

function Deploy-Kubernetes {
    Write-Host "Deploying to Kubernetes..." -ForegroundColor Green
    kubectl apply -f k8s/postgres.yaml
    kubectl apply -f k8s/deployment.yaml
}

# Main command router
switch ($Command.ToLower()) {
    "help" { Show-Help }
    "install" { Install-Dependencies }
    "test" { Run-Tests }
    "lint" { Run-Lint }
    "run" { Run-App }
    "clean" { Clean-Files }
    "docker-build" { Build-Docker }
    "docker-run" { Run-Docker }
    "docker-stop" { Stop-Docker }
    "docker-push" { Push-Docker }
    "deploy-k8s" { Deploy-Kubernetes }
    default {
        Write-Host "Unknown command: $Command" -ForegroundColor Red
        Show-Help
        exit 1
    }
}
