# Capture Play Store screenshots from connected Android device via adb.
param(
    [string]$Device = "RZ8N2225JDJ",
    [string]$Package = "com.cyberchef.pantry",
    [string]$OutDir = "$PSScriptRoot\..\docs\play-store\screenshots"
)

$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

function Invoke-Adb([string[]]$AdbArgs) {
    & adb -s $Device @AdbArgs
    if ($LASTEXITCODE -ne 0) { throw "adb failed: $AdbArgs" }
}

function Wait-App([int]$Seconds = 2) {
    Start-Sleep -Seconds $Seconds
}

function Tap([int]$X, [int]$Y) {
    Invoke-Adb @("shell", "input", "tap", "$X", "$Y")
    Wait-App 1
}

function Capture([string]$Name) {
    $remote = "/sdcard/cc_cap_$Name.png"
    $local = Join-Path $OutDir "$Name.png"
    Invoke-Adb @("shell", "screencap", "-p", $remote)
    Invoke-Adb @("pull", $remote, $local) | Out-Null
    Write-Host "Saved $local"
}

Write-Host "Launching $Package..."
Invoke-Adb @("shell", "am", "force-stop", $Package)
Wait-App 1
Invoke-Adb @("shell", "monkey", "-p", $Package, "-c", "android.intent.category.LAUNCHER", "1") | Out-Null
Wait-App 5

Capture "02_scan_fridge"

Tap 540 323   # Receipt toggle
Capture "03_scan_receipt"

Tap 540 2125  # Freshness tab
Wait-App 2
Capture "04_freshness"

Tap 180 2125  # Scan tab
Tap 300 730   # Recent scan → recipes
Wait-App 3
Capture "05_recipe_results"

Invoke-Adb @("shell", "input", "keyevent", "KEYCODE_BACK")
Wait-App 1

Tap 900 2125  # Shopping tab
Wait-App 2
Capture "06_shopping"

Tap 180 2125  # Scan tab
Tap 1020 160  # Settings (app bar)
Wait-App 2
Capture "07_settings"

Tap 540 776   # Language row
Wait-App 2
Capture "08_language"

Write-Host "Done. Capture 01_splash manually on cold launch (splash ~2s)."
