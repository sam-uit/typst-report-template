#import "@preview/minimal-presentation:0.7.0": *

#set text(font: "Google Sans")
//#show math.equation: set text(font: "Lato Math")
//#show raw: set text(font: "Fira Code")

#show: project.with(
  title: "AI Trong Đời Sống & Công Việc",
  sub-title: "Ứng Dụng Thực Tiễn, Lợi Ích và Lưu Ý",
  author: "Nhóm 01",
  date: "Tháng 01/2026",
  index-title: "Mục Lục",
  logo: image("static/alpha-logo.svg"),
  logo-light: image("static/alpha-logo-light.svg"),
  cover: image("static/Mantle.png"),
  main-color: rgb("#3154ef"),
  lang: "it",
)

= This is a section

== This is a slide title

#lorem(10)

- #lorem(10)
  - #lorem(10)
  - #lorem(10)

== One column image

#figure(
  image("static/wallhaven-83mg52.png", height: 10.5cm),
  caption: [An image],
) <image_label>
