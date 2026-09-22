# Resumes stalled Flutter SDK download using curl (-C -).
$ZipPath = "D:\flutter_sdk.zip"
$Url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.44.0-stable.zip"

if (Test-Path "D:\flutter\bin\flutter.bat") {
    Write-Host "Flutter already installed at D:\flutter" -ForegroundColor Green
    exit 0
}

$existing = if (Test-Path $ZipPath) { (Get-Item $ZipPath).Length } else { 0 }
Write-Host ("Resuming download from {0:N1} MB ..." -f ($existing / 1MB)) -ForegroundColor Cyan
Write-Host "Press Ctrl+C only if you want to cancel." -ForegroundColor Yellow

& curl.exe -L -C - -o $ZipPath $Url --retry 5 --retry-delay 5

if ($LASTEXITCODE -ne 0) {
    Write-Host "curl failed with exit code $LASTEXITCODE" -ForegroundColor Red
    exit $LASTEXITCODE
}

$final = (Get-Item $ZipPath).Length
Write-Host ("Download complete: {0:N1} MB" -f ($final / 1MB)) -ForegroundColor Green

if ($final -lt 1700000000) {
    Write-Host "File still seems small. Run this script again." -ForegroundColor Yellow
    exit 1
}

Write-Host "Starting project setup..." -ForegroundColor Cyan
& "$PSScriptRoot\finish_setup.ps1" -ZipPath $ZipPath
