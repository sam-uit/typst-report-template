#import "fonts.typ": *
#import "utils.typ": *
#import "components/callout.typ": *
#import "components/todo.typ": *
#import "components/table.typ": *
#import "components/cover.typ": cover-page

// MARK: The Template
#let report(
  university: (:),
  course: (:),
  instructor: "",
  author: (:),
  assignment: (:),
  ..args,
  body,
) = {
  // Anchor/Móc cho nút Back to Top
  [#metadata("top") <top>]

  // MARK: Page & Text Setup
  set page(margin: 2.5cm)
  set text(
    font: body-font,
    size: 12pt,
    weight: "regular",
  )
  set par(
    leading: 0.8em,
    justify: true,
    spacing: 1.5em,
  )

  // MARK: Formatting - Headings
  set heading(numbering: "1.")
  show heading: set block(below: 1.2em)

  // Custom Heading 1 Style
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(font: heading-font, size: 20pt, weight: "regular")
    #block(
      width: 100%,
      stroke: (bottom: 0.5pt + rgb("#808080")),
      inset: (bottom: 0.5em),
      below: 0.8em,
    )[
      #smallcaps[#it.body]
    ]
  ]

  // MARK: Formatting - Figures & Tables
  // Rename "Figure" supplements
  show figure.where(kind: raw): set figure(supplement: "Mã nguồn")
  show figure.where(kind: image): set figure(supplement: "Hình ảnh")
  show figure.where(kind: table): set figure(supplement: "Bảng")

  // MARK: Formatting - Tables
  // Bảng có đường viền và màu nền
  set table(
    // Đường viền cho bảng
    stroke: 0.5pt + blue.lighten(90%),
    // Màu nền cho hàng đầu tiên (header)
    fill: (x, y) => if y == 0 { blue.lighten(90%) },
  )

  // Tắt căn bằng lề cho văn bản trong bảng
  show table: set par(justify: false)

  // Bảng có góc bo tròn
  show table: it => block(
    radius: 8pt,
    stroke: 1pt + blue.lighten(90%),
    clip: true,
    width: 100%,
    it,
  )

  // MARK: Formatting - Code Blocks
  // Inline code style
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Block code style with Line Numbering
  show raw.where(block: true): it => align(start)[
    #block(
      radius: 8pt,
      fill: luma(240),
      inset: 0pt,
      stroke: none,
      breakable: false,
      width: 100%,
      clip: true,
    )[
      #text(font: code-font, size: 1em)[
        #grid(
          columns: (auto, 1fr),
          inset: (x, y) => {
            let v = 1em
            let inner = 0.5em
            let outer = 1.5em
            if x == 0 { (top: v, bottom: v, left: outer, right: inner) } else {
              (top: v, bottom: v, left: inner, right: outer)
            }
          },
          stroke: (x, y) => if x == 0 { (right: 1pt + luma(300)) } else { none },
          align: (right, left),
          // Line number column
          align(right, text(fill: gray)[
            #for i in range(1, it.text.split("\n").len() + 1) [ #i \ ]
          ]),
          // Code content column
          it,
        )
      ]
    ]
  ]

  // MARK: Formatting - General
  // Emph & Strong
  show emph: it => text(style: "italic", weight: "medium")[#it.body]
  show strong: it => text(weight: "bold")[#it.body]
  // Links
  show link: set text(fill: rgb("#0000EE"))
  // Lists
  set list(indent: 1em)
  set enum(indent: 1em)
  // Callouts (Left align text inside specialized blocks)
  show block.where(fill: rgb("#f0f8ff")): it => align(left, it)
  // Quotes
  show quote: it => block(
    align(center),
    fill: luma(248),
    stroke: (left: 3pt + luma(180)),
    inset: (left: 1em, rest: 0.8em),
    radius: (right: 3pt),
  )[
    #set text(style: "italic")
    #it
  ]
  // TODOs
  show figure.where(kind: "todo"): it => it.body

  // MARK: Section - Cover Page
  // No headers/footers, no numbering
  set page(header: none, footer: none, numbering: none)
  cover-page(
    university: university,
    course: course,
    instructor: instructor,
    author: author,
    assignment: assignment,
  )
  pagebreak()

  // MARK: Section - Front Matter (TOC, Lists)
  // Roman numbering, Header/Footer active
  set page(header: auto, footer: auto, numbering: "i", number-align: center)
  counter(page).update(1)

  // Table of Contents
  toc-section-wrapper(blue)[
    #unheading[Mục Lục]
    #outline(title: none, indent: auto, depth: 2)
  ]

  // List of Tables
  toc-section-wrapper(blue)[
    #unheading[Danh Sách Bảng]
    #outline(title: none, target: figure.where(kind: table))
  ]

  // List of Figures
  toc-section-wrapper(blue)[
    #unheading[Danh Sách Hình Ảnh]
    #outline(title: none, target: figure.where(kind: image))
  ]

  // List of Code Snippets
  toc-section-wrapper(blue)[
    #unheading[Danh Sách Mã Nguồn]
    #outline(title: none, target: figure.where(kind: raw))
  ]

  // List of TODOs (Conditional)
  context {
    let todos = query(figure.where(kind: "todo"))
    if todos.len() > 0 {
      block(
        radius: 8pt,
        fill: red.lighten(98%),
        stroke: 1pt + red.lighten(80%),
        inset: 1.5em,
        width: 100%,
      )[
        #unheading[Danh Sách TODO]
        #outline(title: none, target: figure.where(kind: "todo"))
      ]
    }
  }

  // Spacing after TOC
  v(2em)
  v(0.5em)
  pagebreak()

  // MARK: Section - Main Content
  // Arabic numbering, Right aligned
  set page(numbering: "1", number-align: right)
  counter(page).update(1)

  // Footer with "Back to Top"
  set page(footer: context [
    #set text(size: 10pt, fill: gray)
    #grid(
      columns: (1fr, 1fr),
      align: (left, right),
      link(<top>)[#text(fill: gray)[↑ Back to Top]], counter(page).display(page.numbering),
    )
  ])

  // MARK: Body
  body
}

// MARK: Appendix Helper
#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A.1", supplement: "Phụ Lục")
  body
}
