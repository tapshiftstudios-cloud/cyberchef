# CyberChef Flutter — Windows one-time setup
# Run in PowerShell:  .\scripts\setup_windows.ps1

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path $PSScriptRoot -Parent
$FlutterRoot = "D:\flutter"

function Ensure-Flutter {
    if (Test-Path "$FlutterRoot\bin\flutter.bat") {
        Write-Host "Flutter found at $FlutterRoot" -ForegroundColor Green
        return
    }

    $zip = "D:\flutter_sdk.zip"
    $url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.44.0-stable.zip"

    if (-not (Test-Path $zip) -or (Get-Item $zip).Length -lt 1700000000) {
        Write-Host "Downloading Flutter SDK (~1.8 GB, resumable via curl)..." -ForegroundColor Cyan
        & curl.exe -L -C - -o $zip $url --retry 5 --retry-delay 5
        if ($LASTEXITCODE -ne 0) { throw "Download failed. Run: .\scripts\resume_flutter_download.ps1" }
    }

    Write-Host "Extracting Flutter SDK..." -ForegroundColor Cyan
    Expand-Archive -Path $zip -DestinationPath "D:\" -Force
    if (-not (Test-Path "$FlutterRoot\bin\flutter.bat")) {
        throw "Extract failed. Expected D:\flutter\bin\flutter.bat"
    }
}

function Add-FlutterToUserPath {
    $bin = "$FlutterRoot\bin"
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    if ($userPath -notlike "*$bin*") {
        [Environment]::SetEnvironmentVariable("Path", "$userPath;$bin", "User")
        $env:Path = "$bin;$env:Path"
        Write-Host "Added $bin to user PATH (restart terminal after script)." -ForegroundColor Green
    }
}

Ensure-Flutter
Add-FlutterToUserPath

Set-Location $ProjectRoot
& "$FlutterRoot\bin\flutter.bat" config --no-analytics
& "$FlutterRoot\bin\flutter.bat" doctor
& "$FlutterRoot\bin\flutter.bat" create . --project-name cyberchef
& "$FlutterRoot\bin\flutter.bat" pub get

Write-Host ""
Write-Host "Done. Next steps:" -ForegroundColor Cyan
Write-Host "  1. Fill .env with GEMINI_API_KEY, SUPABASE_URL, SUPABASE_ANON_KEY"
Write-Host "  2. Run Supabase SQL: supabase/migrations/001_pantry_scans.sql"
Write-Host "  3. Connect phone or emulator, then: flutter run"
Write-Host "  4. Open folder in Cursor: $ProjectRoot"
