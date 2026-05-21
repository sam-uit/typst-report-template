// /template/langs/i18n.typ
// Internationalization dispatcher — imports all language packs
// Author: Sam Dinh
// Version: 0.3.0
// License: MIT
//
// Supported languages: en (default), vi, ms, zh-Hant, zh-Hans
// Usage:
//   #import "langs/i18n.typ": i18n-labels
//   #let labels = i18n-labels("vi")
//   labels.toc  // => "Mục Lục"
//
// To add a new language:
//   1. Create langs/<code>.typ with a `labels-<code>` dictionary
//   2. Import it below and add an entry to _registry

#import "en.typ": labels-en
#import "vi.typ": labels-vi
#import "ms.typ": labels-ms
#import "zh-hant.typ": labels-zh-hant
#import "zh-hans.typ": labels-zh-hans

// MARK: Language Registry

#let _registry = (
  en:      labels-en,
  vi:      labels-vi,
  ms:      labels-ms,
  zh-Hant: labels-zh-hant,
  zh-Hans: labels-zh-hans,
)

// MARK: Public API

/// Returns the label dictionary for the given language code.
/// Falls back to English if the language is not supported.
///
/// - lang (str): Language code ("en", "vi", "ms", "zh-Hant", "zh-Hans")
/// -> dictionary
#let i18n-labels(lang) = {
  if lang in _registry {
    _registry.at(lang)
  } else {
    _registry.at("en")
  }
}

/// Returns the list of supported language codes.
/// -> array
#let i18n-supported-languages() = {
  _registry.keys()
}
