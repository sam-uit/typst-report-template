// template/core/tokens.typ
#let cfg = yaml("../../config/config.yaml")

// Safely extract main blocks (fallback to empty dict if missing)
#let _fonts = cfg.at("fonts", default: (:))
#let _colors = cfg.at("colors", default: (:))
#let _ui = cfg.at("ui", default: (:))

// --- Fonts ---
#let font-sans  = _fonts.at("sans", default: "Tex Gyre Adventor")
#let font-serif = _fonts.at("serif", default: "CMU Serif")
#let font-mono  = _fonts.at("mono", default: "Google Sans Code")

// --- Core Theme Colors ---
#let clr-primary          = rgb(_colors.at("primary", default: "#003F88"))
#let clr-primary-light    = rgb(_colors.at("primary-light", default: "#2159A5"))
#let clr-primary-lightest = rgb(_colors.at("primary-lightest", default: "#F2F4F8"))
#let clr-neutral-lightest = rgb(_colors.at("neutral-lightest", default: "#FFFFFF"))

// --- Semantic Colors (Callouts) ---
#let clr-note = rgb(_colors.at("note", default: "#003F88"))
#let clr-info = rgb(_colors.at("info", default: "#008080"))
#let clr-warn = rgb(_colors.at("warning", default: "#FFA500"))
#let clr-erro = rgb(_colors.at("error", default: "#FF0000"))
#let clr-succ = rgb(_colors.at("success", default: "#008000"))

// --- UI Elements ---
#let ui-radius = _ui.at("radius", default: 8) * 1pt

// --- Legacy Semantic Colors (Restored for compatibility) ---
#let clr-heading-rule = black.lighten(60%)
#let clr-neutral-bg = luma(240)
#let clr-neutral-border = luma(300)
#let clr-neutral-text = gray
#let clr-cover-gradient = gradient.linear(clr-primary-light, clr-primary, angle: 45deg)
#let clr-cover-bg = rgb(248, 250, 252)
#let clr-code-bg = luma(240)
#let clr-code-line = luma(300)
#let clr-quote-bg = luma(248)
#let clr-quote-border = luma(180)
