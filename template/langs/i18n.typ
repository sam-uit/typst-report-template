// /template/langs/i18n.typ
// Internationalization dispatcher — imports all language packs
// Author: Sam Dinh
// Version: 0.3.0
// License: MIT
//
// Files follow BCP 47 tag format, all lowercase:
//   en-us.typ, vi-vn.typ, ms-my.typ, zh-hant.typ, zh-hans.typ
//
// Usage:
//   #import "langs/i18n.typ": i18n-labels
//   #let labels = i18n-labels("vi")        // short code
//   #let labels = i18n-labels("vi-vn")     // full BCP 47, also works
//   labels.toc  // => "Mục Lục"
//
// To add a new language:
//   1. Create langs/<bcp47-lowercase>.typ with a `labels-<bcp47>` dict
//   2. Import it below and add entries to _registry

#import "en-us.typ": labels-en-us
#import "vi-vn.typ": labels-vi-vn
#import "ms-my.typ": labels-ms-my
#import "zh-hant.typ": labels-zh-hant
#import "zh-hans.typ": labels-zh-hans

// MARK: Language Registry
// Keys: full BCP 47 lowercase. Short-code aliases are listed below.

#let _registry = (
  // Full BCP 47 keys (canonical)
  "en-us":   labels-en-us,
  "vi-vn":   labels-vi-vn,
  "ms-my":   labels-ms-my,
  "zh-hant": labels-zh-hant,
  "zh-hans": labels-zh-hans,
  // Short-code aliases (backward-compatible)
  "en":      labels-en-us,
  "vi":      labels-vi-vn,
  "ms":      labels-ms-my,
  // Typst canonical casing aliases (zh-Hant / zh-Hans)
  "zh-Hant": labels-zh-hant,
  "zh-Hans": labels-zh-hans,
)

// MARK: Public API

/// Returns the label dictionary for the given language code.
/// Accepts full BCP 47 lowercase tags ("vi-vn"), short codes ("vi"),
/// or Typst-canonical casing ("zh-Hant"). Falls back to English if unknown.
///
/// - lang (str): Language code
/// -> dictionary
#let i18n-labels(lang) = {
  if lang in _registry {
    _registry.at(lang)
  } else {
    _registry.at("en-us")
  }
}

/// Returns the list of canonical BCP 47 language codes supported.
/// -> array
#let i18n-supported-languages() = {
  ("en-us", "vi-vn", "ms-my", "zh-hant", "zh-hans")
}
