// samples/_content.typ
// Shared demo content for all language samples.
// Imported by each lang entry point — do not compile directly.

#import "../template/lib.typ": co-note

= Overview

This document demonstrates the UIT Typst Report Template. The system labels
(table of contents title, chapter prefix, figure supplements, etc.) adapt
automatically to the active `lang` setting.

== Key Features

The template provides four document classes: *article*, *report*, *book*, and
*thesis*. Each class ships with sensible defaults for font size, margins, and
two-sided printing.

#co-note[
  This sample was generated automatically. Inspect the `samples/` directory for
  the entry-point `.typ` file for each language.
]

== Sample Table

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    table.header([*\#*], [*Feature*], [*Status*]),
    [1], [Multilingual labels (en, vi, ms, zh-Hant, zh-Hans)], [✓],
    [2], [Document classes (article / report / book / thesis)],  [✓],
    [3], [Digital and print output profiles],                    [✓],
    [4], [BCP 47 language pack structure],                       [✓],
    [5], [Per-language sample PDFs],                             [✓],
  ),
  caption: [Template Feature Overview],
)

== Sample Code

#figure(
  ```typst
  #show: document.with(
    doc-class: "report",
    lang: "vi-vn",
    output: "digital",
    ..data,
  )
  ```,
  caption: [Minimal Document Setup],
)

= Configuration Reference

The `document()` function accepts the following top-level parameters:

- `doc-class` — `"article"` | `"report"` | `"book"` | `"thesis"`
- `lang` — BCP 47 language code, e.g. `"en-us"`, `"vi-vn"`, `"zh-hant"`
- `output` — `"digital"` | `"print"`
- `paper` — `"a4"` | `"a5"` | `"letter"`
- `font-size` — any Typst length, e.g. `11pt`
- `components` — dictionary of boolean flags to override class defaults
