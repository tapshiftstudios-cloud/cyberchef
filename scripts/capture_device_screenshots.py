"""Capture real Play Store screenshots from connected Android device."""
from __future__ import annotations

import subprocess
import time
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
OUT_DIR = ROOT / "assets" / "store" / "screenshots_en" / "device"
OUT_DIR.mkdir(parents=True, exist_ok=True)

DEVICE = "RZ8N2225JDJ"
PACKAGE = "com.cyberchef.pantry"
ACTIVITY = f"{PACKAGE}/.MainActivity"

TARGET_W, TARGET_H = 1080, 1920

# Samsung A51 1080x2400 — from uiautomator dump
NAV_SCAN = (180, 2125)
NAV_FRESHNESS = (540, 2125)
NAV_SHOPPING = (900, 2125)
TAB_PANTRY = (216, 323)
TAB_RECEIPT = (540, 323)
TAB_BARCODE = (863, 323)
BTN_SETTINGS = (1017, 162)


def adb_shell(*args: str) -> None:
    subprocess.run(["adb", "-s", DEVICE, "shell", *args], check=True)


def grant_permissions() -> None:
    for perm in (
        "android.permission.CAMERA",
        "android.permission.READ_MEDIA_IMAGES",
    ):
        subprocess.run(
            ["adb", "-s", DEVICE, "shell", "pm", "grant", PACKAGE, perm],
            check=False,
        )


def wake_and_unlock() -> None:
    adb_shell("input", "keyevent", "KEYCODE_WAKEUP")
    time.sleep(0.8)
    adb_shell("wm", "dismiss-keyguard")
    adb_shell("input", "swipe", "540", "2100", "540", "900", "300")
    time.sleep(1.0)


def launch_app() -> None:
    subprocess.run(
        [
            "adb",
            "-s",
            DEVICE,
            "shell",
            "am",
            "start",
            "-W",
            "-n",
            ACTIVITY,
        ],
        check=True,
    )


def tap(x: int, y: int, delay: float = 2.0) -> None:
    adb_shell("input", "tap", str(x), str(y))
    time.sleep(delay)


def capture(name: str) -> Path:
    out = OUT_DIR / name
    proc = subprocess.run(
        ["adb", "-s", DEVICE, "exec-out", "screencap", "-p"],
        capture_output=True,
        check=True,
    )
    img = Image.open(__import__("io").BytesIO(proc.stdout)).convert("RGB")

    w, h = img.size
    target_ratio = TARGET_W / TARGET_H
    new_h = int(w / target_ratio)
    top = max(0, (h - new_h) // 2)
    img = img.crop((0, top, w, min(h, top + new_h)))
    if img.size != (TARGET_W, TARGET_H):
        img = img.resize((TARGET_W, TARGET_H), Image.Resampling.LANCZOS)

    img.save(out, "PNG", optimize=True)
    return out


def main() -> None:
    grant_permissions()
    wake_and_unlock()
    launch_app()
    time.sleep(3)

    shots: list[tuple[str, list[tuple[int, int]]]] = [
        ("01_scan_pantry.png", [NAV_SCAN, TAB_PANTRY]),
        ("02_scan_receipt.png", [NAV_SCAN, TAB_RECEIPT]),
        ("03_scan_barcode.png", [NAV_SCAN, TAB_BARCODE]),
        ("04_freshness.png", [NAV_FRESHNESS]),
        ("05_shopping.png", [NAV_SHOPPING]),
        ("06_settings.png", [NAV_SCAN, BTN_SETTINGS]),
    ]

    captured: list[Path] = []
    for filename, taps in shots:
        for x, y in taps:
            tap(x, y)
        path = capture(filename)
        captured.append(path)
        print(f"{path.name}: {path.stat().st_size // 1024} KB")

    stale_names = {
        "01_scan_receipt.png",
        "02_freshness_tracking.png",
        "03_shopping_list.png",
        "04_ai_recipes.png",
        "05_barcode_scan.png",
        "05_detail_or_recipe.png",
        "05_freshness_tab.png",
        "04_settings.png",
    }
    for stale in OUT_DIR.glob("*.png"):
        if stale.name in stale_names:
            stale.unlink(missing_ok=True)

    print(f"\nSaved {len(captured)} screenshots to {OUT_DIR}")


if __name__ == "__main__":
    main()
