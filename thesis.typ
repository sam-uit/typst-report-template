// /thesis.typ
// A Thesis Main Content File

// Import template and metadata
#import "template/lib.typ": *
#let data = yaml("config/metadata.yaml")

// Load acronyms
#let acronyms = csv("content/acronyms.csv")

#let build_lang = sys.inputs.at("lang", default: "vi")

// Show document with thesis class
#show: document.with(
  ..data,
  doc-class: "thesis",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: build_lang,
  acronyms: acronyms,
)

// Content goes here
#let chapters = ("01", "02", "03", "04", "05")
#for ch in chapters {
  include "content/chapter-" + ch + "-" + build_lang + ".typ"
}

// Show appendix
#show: appendix-l10n.with(build_lang)
#include "content/appendixA.typ"

// Show bibliography
#show: bibliography-page-l10n.with(build_lang)
#bibliography("content/bibliography.yaml", title: "Tài Liệu Tham Khảo", style: "ieee")
