// /template/fonts.typ
// Common font settings for reports and thesis
// Author: Sam Dinh
// Version: 0.1.0
// License: MIT

// MARK: Fonts
// The current font set makes the document a LaTeX-like look.
#let document-fonts = (
  // Alternative: Montserrat, Google Sans
  sans: "Montserrat",
  // Alternative: Lora, Linux Libertine
  serif: "New Computer Modern",
  // Alternative: Fira Code, Ubuntu Mono
  mono: "Iosevka",
)

#let heading-font = document-fonts.sans
#let body-font = document-fonts.serif
#let code-font = document-fonts.mono
