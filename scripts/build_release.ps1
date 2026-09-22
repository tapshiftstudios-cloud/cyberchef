# Release build for Play Store - never embeds GEMINI_API_KEY in the APK/AAB.
param(
    [string]$ProjectRoot = (Split-Path $PSScriptRoot -Parent),
    [string]$EnvFile = ".env",
    [string]$FlutterBat = "D:\flutter_sdk\flutter\bin\flutter.bat",
    [ValidateSet("apk", "appbundle")]
    [string]$Target = "appbundle"
)

$ErrorActionPreference = "Stop"
Set-Location $ProjectRoot

function Read-EnvValue([string]$Key) {
    $path = Join-Path $ProjectRoot $EnvFile
    if (-not (Test-Path $path)) { return $null }
    foreach ($line in Get-Content $path) {
        if ($line -match "^\s*$([regex]::Escape($Key))\s*=\s*(.+)\s*$") {
            return $Matches[1].Trim().Trim('"').Trim("'")
        }
    }
    return $null
}

function Set-LocalProperty([string]$Key, [string]$Value) {
    if (-not $Value) { return }
    $path = Join-Path $ProjectRoot "android\local.properties"
    $lines = @()
    if (Test-Path $path) {
        $lines = Get-Content $path | Where-Object { $_ -notmatch "^\s*$([regex]::Escape($Key))\s*=" }
    }
    $lines += "$Key=$Value"
    Set-Content -Path $path -Value $lines -Encoding UTF8
}

$supabaseUrl = Read-EnvValue "SUPABASE_URL"
$supabaseAnon = Read-EnvValue "SUPABASE_ANON_KEY"
$proxyUrl = Read-EnvValue "AI_BACKEND_PROXY_URL"
$sentryDsn = Read-EnvValue "SENTRY_DSN"
$admobAppId = Read-EnvValue "ADMOB_APP_ID"
$admobBanner = Read-EnvValue "ADMOB_BANNER_UNIT_ID"
$admobRewarded = Read-EnvValue "ADMOB_REWARDED_UNIT_ID"
$adsEnabled = Read-EnvValue "ADS_ENABLED"
$privacyUrl = Read-EnvValue "PRIVACY_POLICY_URL"

if (-not $supabaseUrl -or -not $supabaseAnon -or -not $proxyUrl) {
    throw "Missing SUPABASE_URL, SUPABASE_ANON_KEY, or AI_BACKEND_PROXY_URL in $EnvFile"
}

$defines = @(
    "SUPABASE_URL=$supabaseUrl",
    "SUPABASE_ANON_KEY=$supabaseAnon",
    "AI_BACKEND_PROXY_URL=$proxyUrl",
    "AI_PROXY_REQUIRED=true"
)
if ($sentryDsn) { $defines += "SENTRY_DSN=$sentryDsn" }
if ($admobAppId) { $defines += "ADMOB_APP_ID=$admobAppId" }
if ($admobBanner) { $defines += "ADMOB_BANNER_UNIT_ID=$admobBanner" }
if ($admobRewarded) { $defines += "ADMOB_REWARDED_UNIT_ID=$admobRewarded" }
if ($adsEnabled) { $defines += "ADS_ENABLED=$adsEnabled" }
if ($privacyUrl) { $defines += "PRIVACY_POLICY_URL=$privacyUrl" }

if ($admobAppId) {
    Set-LocalProperty "admob.app.id" $admobAppId
    Write-Host "AdMob App ID set for Android manifest." -ForegroundColor DarkGray
} else {
    Write-Host "ADMOB_APP_ID not set - Google test ad units will be used." -ForegroundColor Yellow
}

$buildCmd = if ($Target -eq "apk") { "apk" } else { "appbundle" }
Write-Host "Building $buildCmd (no GEMINI_API_KEY on client)..." -ForegroundColor Cyan
& $FlutterBat build $buildCmd --release @(
    foreach ($d in $defines) { "--dart-define=$d" }
)

if ($Target -eq "apk") {
    Write-Host "Done. APK: build\app\outputs\flutter-apk\app-release.apk" -ForegroundColor Green
} else {
    Write-Host "Done. Upload build\app\outputs\bundle\release\app-release.aab to Play Console." -ForegroundColor Green
}
