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
  // MARK: Back to Top Label
  [#metadata("top") <top>]

  // MARK: Page Setup
  // Căn lề
  set page(margin: 2.5cm)
  // set text(font: "CMU Concrete", size: 12pt, weight: "regular")
  set text(
    // Font cho nội dung, vui lòng xem file fonts.typ
    // Serif font
    font: body-font,
    size: 12pt,
    weight: "regular",
  )

  // MARK: Paragraph
  // Paragraph settings
  set par(
    // Khoảng cách giữa các dòng trong một đoạn
    leading: 0.8em,
    // Căn đều lề của đoạn
    justify: true,
    // Khoảng cách giữa các đoạn
    spacing: 1.5em,
  )

  // MARK: Heading
  // Heading settings
  set heading(numbering: "1.")
  // Indent for List
  set list(indent: 1em)
  // Indent for Enum
  set enum(indent: 1em)
  // set par()

  // Line Numbering implemented in show rule below

  // MARK: Figure Supplement
  // Rename "Figure" to "Mã nguồn", "Hình ảnh", "Bảng"
  show figure.where(kind: raw): set figure(supplement: "Mã nguồn")
  show figure.where(kind: image): set figure(supplement: "Hình ảnh")
  show figure.where(kind: table): set figure(supplement: "Bảng")

  // MARK: Table formatting
  // Gray header, and the first column

  set table(
    stroke: 0.5pt + gray,
    fill: (x, y) => if x == 0 or y == 0 {
      gray.lighten(40%)
    },
    align: right,
  )

  // Raw: font, and size
  show raw: set text(font: code-font, size: 1em, weight: 400)

  // Inline-raw
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Code block with Line Numbering
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
          // Move padding inside so the vertical line spans full height
          inset: (x, y) => {
            let v = 1em
            let inner = 0.5em
            let outer = 1.5em
            if x == 0 {
              (top: v, bottom: v, left: outer, right: inner)
            } else {
              (top: v, bottom: v, left: inner, right: outer)
            }
          },
          stroke: (x, y) => if x == 0 { (right: 1pt + luma(300)) } else { none },
          align: (right, left),
          align(right, text(fill: gray)[
            #for i in range(1, it.text.split("\n").len() + 1) [
              #i \
            ]
          ]),
          it,
        )
      ]
    ]
  ]

  show block.where(fill: rgb("#f0f8ff")): it => align(left, it)

  // vspace after/below every heading
  show heading: set block(below: 1.2em)

  // MARK: Custom heading styles
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

  // show heading.where(level: 2): it => [
  //   #set text(font: sans-font, size: 18pt, weight: "regular", fill: rgb(50, 50, 50))
  //   #block(above: 1.2em, below: 0.8em)[#it.body]
  // ]

  // show heading.where(level: 3): it => [
  //   #set text(font: sans-font, size: 16pt, weight: "regular", fill: rgb(50, 50, 50))
  //   #block(above: 1.2em, below: 0.8em)[#it.body]
  // ]

  // Simple emphasis and strong styling
  show emph: it => text(style: "italic", weight: "medium")[#it.body]
  show strong: it => text(weight: "bold")[#it.body]

  // Simple list styling
  // show list: it => block(above: 0.6em, below: 0.6em)[#it]

  // Simple quote styling
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

  // Show TODO content/body only
  show figure.where(kind: "todo"): it => it.body

  // Enhanced title page
  // Add the Cover page to TOC
  // place(hide(unheading[Trang Bìa (#assignment.title)]))

  // MARK: Cover Page
  // Trang Bìa
  // Không có số trang, không có header, footer
  set page(header: none, footer: none, numbering: none)
  cover-page(
    university: university,
    course: course,
    instructor: instructor,
    author: author,
    assignment: assignment,
  )

  // Page Break, end of the Title Page
  pagebreak()

  // MARK: PAGE NUMBERING SETUP
  // List of Tables, List of Figures, List of Code Snippets, List of TODOs
  // CÓ header, footer
  set page(header: auto, footer: auto)

  // Được đánh số kiểu Roman từ i
  // Số trang nằm ở giữa
  // Bắt đầu đếm số trang từ 1
  set page(numbering: "i", number-align: center)
  counter(page).update(1)

  // MARK: Table of Contents
  block(
    radius: 8pt,
    fill: rgb(248, 250, 252),
    stroke: 1pt + rgb(200, 220, 240),
    inset: 1.5em,
    width: 100%,
  )[
    #unheading[Mục Lục]
    #outline(
      title: none,
      indent: auto,
      depth: 2,
    )
  ]

  // MARK: List of Tables
  block(
    radius: 8pt,
    fill: rgb(248, 250, 252),
    stroke: 1pt + rgb(200, 220, 240),
    inset: 1.5em,
    width: 100%,
  )[
    #unheading[Danh Sách Bảng]
    #outline(
      title: none, // Sets the title of the list
      target: figure.where(kind: table), // Selects only tables
    )
  ]

  // MARK: List of Figures
  block(
    radius: 8pt,
    fill: rgb(248, 250, 252),
    stroke: 1pt + rgb(200, 220, 240),
    inset: 1.5em,
    width: 100%,
  )[
    #unheading[Danh Sách Hình Ảnh]
    #outline(
      title: none, // Title: "List of Images"
      target: figure.where(kind: image), // Filter: Only show images
    )
  ]

  // MARK: List of Code Snippets
  block(
    radius: 8pt,
    fill: rgb(248, 250, 252),
    stroke: 1pt + rgb(200, 220, 240),
    inset: 1.5em,
    width: 100%,
  )[
    #unheading[Danh Sách Mã Nguồn]
    #outline(
      title: none,
      target: figure.where(kind: raw), // Targets figures containing code
    )
  ]

  // MARK: List of TODOs (Only appears if there are actual TODOs)
  context {
    let todos = query(figure.where(kind: "todo"))
    if todos.len() > 0 {
      block(
        radius: 8pt,
        fill: red.lighten(95%),
        stroke: 1pt + red.lighten(80%),
        inset: 1.5em,
        width: 100%,
      )[
        #unheading[Danh Sách TODO]
        #outline(
          title: none,
          target: figure.where(kind: "todo"),
        )
      ]
    }
  }

  // Some space after the TOC
  v(2em)
  // line(length: 100%, stroke: 0.5pt + rgb(200, 220, 240))
  v(0.5em)
  // v(2em)

  // End of TOC, start main content on new page
  pagebreak()

  // MARK: CONTENT PAGE NUMBERING SETUP
  // Được đánh số kiểu Arabic từ 1
  // CÓ header, footer
  // Số trang nằm ở bên phải
  set page(
    numbering: "1",
    number-align: right,
  )
  // Reset page counter về 1 (bắt đầu từ trang 1)
  counter(page).update(1)

  // MARK: FOOTER WITH BACK-TO-TOP
  // CÓ footer
  // Có link back to top
  set page(
    footer: context [
      // We use a stack or grid to align items
      #set text(size: 10pt, fill: gray)
      #grid(
        columns: (1fr, 1fr),
        align: (left, right),

        // TODO: Un-blue the link here
        // LEFT: The clickable link
        link(<top>)[#text(fill: gray)[↑ Back to Top]],

        // RIGHT: The page number
        counter(page).display(page.numbering),
      )
    ],
  )

  // --- LINK STYLING ---
  // We put this HERE so it only affects the actual content, not the TOC.
  show link: set text(fill: rgb("#0000EE"))

  // GLOBAL RULE: All tables inside this document get rounded
  show table: it => block(
    radius: 8pt,
    stroke: 1pt + luma(200),
    clip: true,
    width: 100%,
    it,
  )

  // MARK: The BODY
  body
}

// MARK: Appendix Helper
#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A.1", supplement: "Phụ Lục")
  body
}
