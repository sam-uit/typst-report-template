#import "template/libslides.typ": *
#let build_lang = sys.inputs.at("lang", default: "vi")
#let raw_data = yaml("config/metadata.yaml")
#let data = raw_data.at(build_lang)
#import "@preview/numbly:0.1.0": numbly

#show: presentation.with(
  title: data.assignment.title,
  subtitle: data.assignment.subtitle,
  author: data.author.name,
  date: datetime.today(),
  institution: data.course.name,
)

// MARK: - Title Slide
#title-slide()

// Unordered List of Content
// #outline-slide()

// MARK: - Nội Dung Chính
#let chapters = ("10-chapter-01", "20-chapter-02", "30-chapter-03", "40-chapter-04", "50-chapter-05")
#for ch in chapters {
  include "content/" + ch + "-" + build_lang + ".typ"
}

// MARK: - Kết Thúc

= Q&A

#focus-slide[
  #smallcaps(lorem(10))
]

#ending-slide(title: [Thank You!])[Questions?]

#let bib-title = if build_lang == "vi" { "Tài Liệu Tham Khảo" } else { "References" }
#bibliography("content/99-bibliography.yaml", title: bib-title, style: "ieee")
