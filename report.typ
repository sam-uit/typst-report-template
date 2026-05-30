// /report.typ
// A Report Main Content File

// Import template and metadata
#import "template/lib.typ": *
#let data = yaml("config/metadata.yaml")

#let build_lang = sys.inputs.at("lang", default: "vi")

// Show document with report class
#show: document.with(
  ..data,
  doc-class: "report",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: build_lang,
)

// Front Matter
#include "content/00-preamble-ack-" + build_lang + ".typ"
#include "content/01-preamble-forewords-" + build_lang + ".typ"
#include "content/02-preamble-summary-" + build_lang + ".typ"

// Main Content
#let chapters = ("10-chapter-01", "20-chapter-02", "30-chapter-03", "40-chapter-04", "50-chapter-05")
#for ch in chapters {
  include "content/" + ch + "-" + build_lang + ".typ"
}

// Back Matter
#show: appendix-l10n.with(build_lang)
#include "content/90-appendix-A-" + build_lang + ".typ"
#include "content/91-appendix-B-" + build_lang + ".typ"

#show: bibliography-page-l10n.with(build_lang)
#let bib-title = if build_lang == "vi" { "Tài Liệu Tham Khảo" } else { "References" }
#bibliography("content/99-bibliography.bib", title: bib-title, style: "ieee")
