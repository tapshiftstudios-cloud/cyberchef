# Waits for Flutter zip download, extracts, configures project.
param(
    [string]$ZipPath = "D:\flutter_sdk.zip",
    [string]$FlutterRoot = "D:\flutter",
    [long]$MinBytes = 1700000000
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path $PSScriptRoot -Parent

if (Test-Path "$FlutterRoot\bin\flutter.bat") {
    Write-Host "Flutter already installed at $FlutterRoot"
} else {
    if (-not (Test-Path $ZipPath)) {
        throw "Zip not found: $ZipPath. Run setup_windows.ps1 first."
    }

    $size = (Get-Item $ZipPath).Length
    if ($size -lt $MinBytes) {
        Write-Host "Zip incomplete ($([math]::Round($size/1MB,1)) MB). Run:" -ForegroundColor Yellow
        Write-Host "  .\scripts\resume_flutter_download.ps1" -ForegroundColor Cyan
        exit 1
    }

    Write-Host "Extracting to D:\ ..."
    if (Test-Path $FlutterRoot) { Remove-Item $FlutterRoot -Recurse -Force }
    Expand-Archive -Path $ZipPath -DestinationPath "D:\" -Force
}

$bin = "$FlutterRoot\bin"
$env:Path = "$bin;$env:Path"
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$bin*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$bin", "User")
}

Set-Location $ProjectRoot
& "$FlutterRoot\bin\flutter.bat" config --no-analytics
& "$FlutterRoot\bin\flutter.bat" doctor
if (-not (Test-Path "android")) {
    & "$FlutterRoot\bin\flutter.bat" create . --project-name cyberchef
}
& "$FlutterRoot\bin\flutter.bat" pub get
& "$PSScriptRoot\apply_permissions.ps1"

Write-Host "Setup complete. Run: flutter run" -ForegroundColor Green
