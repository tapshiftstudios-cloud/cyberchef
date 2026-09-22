# Platform permissions (after `flutter create`)

Run once inside `cyberchef_flutter` if Android/iOS folders are missing:

```bash
flutter create . --project-name cyberchef
```

Then add camera permissions:

## Android — `android/app/src/main/AndroidManifest.xml`

Inside `<manifest>` (before `<application>`):

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera" android:required="false" />
```

## iOS — `ios/Runner/Info.plist`

```xml
<key>NSCameraUsageDescription</key>
<string>CyberChef needs camera access to scan your fridge and identify ingredients.</string>
```
