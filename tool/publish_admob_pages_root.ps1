# Publishes app-ads.txt to https://tapshiftstudios-cloud.github.io/app-ads.txt
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $PSScriptRoot
$SiteSrc = Join-Path $Root "docs\admob-pages-site"
$Git = "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\cmd\git.exe"
if (-not (Test-Path $Git)) {
  $Git = (Get-Command git -ErrorAction SilentlyContinue).Source
}
if (-not $Git) { throw "git not found" }

$Repo = "tapshiftstudios-cloud/tapshiftstudios-cloud.github.io"
$prevEap = $ErrorActionPreference
$ErrorActionPreference = "Continue"
gh auth status 2>$null | Out-Null
$ErrorActionPreference = $prevEap
$ghAuthed = ($LASTEXITCODE -eq 0)
if (-not $ghAuthed) {
  Write-Host "gh not logged in - create empty repo on github.com if push fails: $Repo"
}

$Work = Join-Path $env:TEMP "tapshiftstudios-github-io-publish"
Remove-Item -Recurse -Force $Work -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $Work | Out-Null
Copy-Item -Path (Join-Path $SiteSrc "*") -Destination $Work -Force

Set-Location $Work
& $Git init | Out-Null
& $Git checkout -b main 2>$null | Out-Null
& $Git add .
& $Git -c user.email="tapshiftstudios@hotmail.com" -c user.name="TapShift Studios" commit -m "AdMob app-ads.txt at GitHub Pages root"

if ($ghAuthed) {
  $ErrorActionPreference = "Continue"
  gh repo view $Repo 2>$null | Out-Null
  if ($LASTEXITCODE -ne 0) {
    gh repo create $Repo --public --description "GitHub Pages root (app-ads.txt for AdMob)"
  }
  $ErrorActionPreference = $prevEap
}

& $Git remote remove origin 2>$null
& $Git remote add origin "https://github.com/$Repo.git"
& $Git push -u origin main --force

Write-Host "Done. Verify: https://tapshiftstudios-cloud.github.io/app-ads.txt"
Write-Host "Then AdMob: CyberChef - Guncellemeleri kontrol edin"
