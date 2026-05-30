// /template/core/colors.typ
// Themed color palette for the document template
// Author: Sam Dinh
// Version: 0.2.0
// License: MIT
//
// Centralized color definitions used across the template.
// All components should reference these instead of hard-coding colors.

// MARK: Load user config
#let _cfg = yaml("../../config/config.yaml")

// Define fallbacks in case config/config.yaml lacks the colors block
#let _color-defaults = (
  brand: (
    primary: "#003F88",
    primary-light: "#2159A5",
    primary-lightest: "#F2F4F8",
    secondary: "#0778b5",
    secondary-dark: "#004078",
    tertiary: "#6709ea",
  ),
  neutral: (
    lightest: "#FFFFFF",
    darkest: "#20293F",
  )
)

#let _user-colors = _cfg.at("colors", default: _color-defaults)
#let _brand = _user-colors.at("brand", default: _color-defaults.brand)
#let _neutral = _user-colors.at("neutral", default: _color-defaults.neutral)

// MARK: Brand Colors (Parsed to rgb)
#let brand-primary = rgb(_brand.at("primary", default: _color-defaults.brand.primary))
#let brand-primary-light = rgb(_brand.at("primary-light", default: _color-defaults.brand.primary-light))
#let brand-primary-lightest = rgb(_brand.at("primary-lightest", default: _color-defaults.brand.primary-lightest))
#let brand-secondary = rgb(_brand.at("secondary", default: _color-defaults.brand.secondary))
#let brand-secondary-dark = rgb(_brand.at("secondary-dark", default: _color-defaults.brand.secondary-dark))
#let brand-tertiary = rgb(_brand.at("tertiary", default: _color-defaults.brand.tertiary))

#let brand-neutral-lightest = rgb(_neutral.at("lightest", default: _color-defaults.neutral.lightest))
#let brand-neutral-darkest = rgb(_neutral.at("darkest", default: _color-defaults.neutral.darkest))

// MARK: Semantic Colors

/// Primary accent — used for table headers, TOC wrappers, etc.
#let clr-accent = brand-primary

/// Subtle accent — lighter variant for backgrounds and borders
#let clr-accent-light = brand-primary.lighten(90%)
#let clr-accent-lighter = brand-primary.lighten(98%)

/// Border and stroke colors
#let clr-border = brand-primary.lighten(80%)
#let clr-border-light = brand-primary.lighten(90%)

/// Heading decoration color
#let clr-heading-rule = black.lighten(60%)

/// Gray palette for neutral UI elements
#let clr-neutral-bg = luma(240)
#let clr-neutral-border = luma(300)
#let clr-neutral-text = gray

/// Cover page gradients
#let clr-cover-gradient = gradient.linear(brand-secondary, brand-primary, angle: 45deg)
#let clr-cover-bg = rgb(248, 250, 252)

/// Callout severity colors
#let clr-info = teal
#let clr-note = brand-primary
#let clr-warn = orange
#let clr-error = red
#let clr-success = green

/// Code block colors
#let clr-code-bg = luma(240)
#let clr-code-line = luma(300)

/// Quote block
#let clr-quote-bg = luma(248)
#let clr-quote-border = luma(180)
