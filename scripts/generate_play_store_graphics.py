"""Generate Play Store 512 icon and 1024x500 feature graphic."""
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont, ImageFilter

ROOT = Path(__file__).resolve().parent.parent
ICON_SRC = ROOT / "assets" / "icon" / "app_icon.png"
OUT_DIR = ROOT / "assets" / "store"
OUT_DIR.mkdir(parents=True, exist_ok=True)

BG_TOP = (18, 42, 28)
BG_BOTTOM = (8, 18, 12)
ACCENT = (76, 175, 120)
TEXT = (240, 248, 242)
MUTED = (180, 210, 190)


def load_font(size: int, bold: bool = False) -> ImageFont.FreeTypeFont:
    candidates = [
        Path(r"C:\Windows\Fonts\segoeuib.ttf") if bold else Path(r"C:\Windows\Fonts\segoeui.ttf"),
        Path(r"C:\Windows\Fonts\arialbd.ttf") if bold else Path(r"C:\Windows\Fonts\arial.ttf"),
    ]
    for path in candidates:
        if path.exists():
            return ImageFont.truetype(str(path), size)
    return ImageFont.load_default()


def vertical_gradient(size: tuple[int, int]) -> Image.Image:
    w, h = size
    base = Image.new("RGB", size, BG_TOP)
    draw = ImageDraw.Draw(base)
    for y in range(h):
        t = y / max(h - 1, 1)
        color = tuple(
            int(BG_TOP[i] * (1 - t) + BG_BOTTOM[i] * t) for i in range(3)
        )
        draw.line([(0, y), (w, y)], fill=color)
    return base


def make_icon_512() -> Path:
    src = Image.open(ICON_SRC).convert("RGBA")
    icon = src.resize((512, 512), Image.Resampling.LANCZOS)
    out = OUT_DIR / "play_store_icon_512.png"
    icon.save(out, "PNG", optimize=True)
    return out


def make_feature_graphic() -> Path:
    w, h = 1024, 500
    canvas = vertical_gradient((w, h)).convert("RGBA")
    draw = ImageDraw.Draw(canvas)

    # Soft glow circles
    glow = Image.new("RGBA", (w, h), (0, 0, 0, 0))
    glow_draw = ImageDraw.Draw(glow)
    glow_draw.ellipse((680, 40, 980, 340), fill=(76, 175, 120, 35))
    glow_draw.ellipse((40, 260, 280, 500), fill=(76, 175, 120, 22))
    glow = glow.filter(ImageFilter.GaussianBlur(28))
    canvas = Image.alpha_composite(canvas, glow)
    draw = ImageDraw.Draw(canvas)

    # Icon on the right
    src = Image.open(ICON_SRC).convert("RGBA")
    icon_size = 300
    icon = src.resize((icon_size, icon_size), Image.Resampling.LANCZOS)
    icon_x = w - icon_size - 72
    icon_y = (h - icon_size) // 2
    canvas.paste(icon, (icon_x, icon_y), icon)

    # Text block
    title_font = load_font(72, bold=True)
    tag_font = load_font(34, bold=False)
    sub_font = load_font(28, bold=False)

    draw.text((64, 118), "CyberChef", font=title_font, fill=TEXT)
    draw.text((64, 205), "Scan  ·  Track  ·  Cook", font=tag_font, fill=ACCENT)
    draw.text(
        (64, 268),
        "Fiş tara · Tazelik takip et · AI tarif öner",
        font=sub_font,
        fill=MUTED,
    )

    # Accent line
    draw.rounded_rectangle((64, 330, 420, 336), radius=3, fill=ACCENT)

    out = OUT_DIR / "play_store_feature_graphic_1024x500.png"
    canvas.convert("RGB").save(out, "PNG", optimize=True)
    return out


if __name__ == "__main__":
    icon_path = make_icon_512()
    feature_path = make_feature_graphic()
    print(icon_path)
    print(feature_path)
