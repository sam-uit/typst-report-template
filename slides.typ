#import "template/libslides.typ": *
#let data = yaml("config/metadata.yaml")
#import "@preview/numbly:0.1.0": numbly

#let build_lang = sys.inputs.at("lang", default: "vi")

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
#let chapters = ("01", "02", "03", "04", "05")
#for ch in chapters {
  include "content/chapter-" + ch + "-" + build_lang + ".typ"
}

// MARK: - Kết Thúc

= Q&A

#focus-slide[
  #smallcaps(lorem(10))
]

#ending-slide(title: [Thank You!])[Questions?]

#bibliography("content/bibliography.yaml", title: "Tài Liệu Tham Khảo", style: "ieee")
