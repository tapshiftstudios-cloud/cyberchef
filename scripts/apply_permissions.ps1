# Patches Android/iOS camera permissions after `flutter create`
$root = Split-Path $PSScriptRoot -Parent

$manifest = Join-Path $root "android\app\src\main\AndroidManifest.xml"
if (Test-Path $manifest) {
    $xml = Get-Content $manifest -Raw
    if ($xml -notmatch "android.permission.CAMERA") {
        $xml = $xml -replace "(<manifest[^>]*>)", "`$1`n    <uses-permission android:name=`"android.permission.CAMERA`" />`n    <uses-feature android:name=`"android.hardware.camera`" android:required=`"false`" />"
        Set-Content $manifest $xml -NoNewline
        Write-Host "Android camera permission added." -ForegroundColor Green
    }
} else {
    Write-Host "AndroidManifest not found. Run: flutter create . --project-name cyberchef" -ForegroundColor Yellow
}

$plist = Join-Path $root "ios\Runner\Info.plist"
if (Test-Path $plist) {
    $p = Get-Content $plist -Raw
    if ($p -notmatch "NSCameraUsageDescription") {
        $p = $p -replace "(<dict>)", @"
<dict>
	<key>NSCameraUsageDescription</key>
	<string>CyberChef needs camera access to scan your fridge.</string>
"@
        Set-Content $plist $p
        Write-Host "iOS camera permission added." -ForegroundColor Green
    }
}
