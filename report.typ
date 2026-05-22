// /report.typ
// A Report Main Content File

// Import template and metadata
#import "template/lib.typ": *
#let data = yaml("config/metadata.yaml")

// Show document with report class
#show: document.with(
  ..data,
  doc-class: "report",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: "vi",
)

// Content goes here
#include "content/chapter01.typ"
#include "content/chapter02.typ"
#include "content/chapter03.typ"
#include "content/chapter04.typ"
#include "content/chapter05.typ"

// Show appendix
#show: appendix-l10n.with("vi")
#include "content/appendixA.typ"

// Show bibliography
#show: bibliography-page-l10n.with("vi")
#bibliography("content/bibliography.bib", title: "Tài Liệu Tham Khảo", style: "ieee")
