#import "template/libslides.typ": *
#import "config/metadata.typ": *
#import "template/lib.typ": *
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
#outline-slide()

#show text: set text(font: "Lora", size: 0.8em)

// MARK: - Nội Dung Chính
#include "content/nhom.typ"


#set table(
  // Đường viền cho bảng
  stroke: 0.5pt + blue.lighten(90%),
  // Màu nền cho hàng đầu tiên (header) và hàng chẵn (nhạt hơn)
  fill: (x, y) => if y == 0 { blue.lighten(90%) } else if calc.even(y) { blue.lighten(98%) } else { none },
)
#show table.cell: set text(font: "Lora", size: 0.8em)

#include "content/contents.typ"

// MARK: - Kết Thúc

= Q&A

// #focus-slide[
//   #smallcaps(lorem(10))
// ]

#ending-slide(title: [Thank You!])[Questions?]
