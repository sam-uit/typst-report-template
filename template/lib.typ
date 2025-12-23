#import "fonts.typ": *
#import "utils.typ": *
#import "components/callout.typ": *
#import "components/todo.typ": *
#import "components/table.typ": *

// MARK: The Template

#let university-assignment(
  university: (
    name: "",
    college: "",
    center: "",
  ),
  course: (
    id: "",
    name: "",
    class: "",
  ),
  instructor: "",
  author: (
    name: "",
    members: (),
  ),
  assignment: (
    title: "",
    subtitle: "",
    type: "",
    date: "",
    duration: "",
    location: "",
  ),
  body,
) = {
  // Page setup
  set page(margin: 2cm)
  // The ROMAN page number
  set page(numbering: "i")
  // set text(font: "CMU Concrete", size: 12pt, weight: "regular")
  set text(font: body-font, size: 12pt, weight: "regular")

  // Paragraph
  set par(
    leading: 0.8em, // Controls space between lines WITHIN a paragraph
    justify: true, // Recommended for assignments to align text edges
    spacing: 1.5em,
  )
  set heading(numbering: "1.")
  // Indent for List
  set list(indent: 1em)
  // Indent for Enum
  set enum(indent: 1em)
  // set par()

  // Line Numbering implemented in show rule below

  // Rename "Figure" to "Mã nguồn" for code blocks
  show figure.where(kind: raw): set figure(supplement: "Mã nguồn")

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
  align(center)[
    // Add the Cover page to TOC
    #place(hide(unheading[Trang Bìa (#assignment.title)]))

    // MARK: University Name
    #if university.name != "" [
      #text(font: heading-font, size: 20pt, weight: "regular", fill: black.lighten(50%))[#upper(university.name)] \
      #v(0.2em)
    ]
    #if university.college != "" [
      #text(font: heading-font, size: 18pt, weight: "regular", fill: black.lighten(50%))[#upper(university.college)] \
      #v(0.2em)
    ]
    #if university.center != "" [
      #text(font: heading-font, size: 16pt, weight: "regular", fill: black.lighten(50%))[#upper(university.center)] \
      #v(0.2em)
    ]

    #block(
      width: 80%,
      stroke: (bottom: 0.5pt + gradient.linear(red, blue, angle: 45deg)),
      inset: (bottom: 0.5em),
    )

    #v(3.5em)

    // MARK: Assignment Title
    #block(
      radius: 12pt,
      inset: 4em,
      stroke: (
        bottom: 2pt + gradient.linear(teal, blue, angle: 45deg),
        // left: 2pt + gradient.linear(teal, blue, angle: 45deg),
        // right: 2pt + gradient.linear(teal, blue, angle: 45deg),
        top: 2pt + gradient.linear(teal, blue, angle: 45deg),
      ),
      width: 100%,
    )[
      #text(font: heading-font, size: 28pt, weight: "regular")[
        #smallcaps[#assignment.title]
      ]
      #if assignment.subtitle != none [
        #v(0.5em)
        #text(size: 20pt, weight: "regular")[
          #assignment.subtitle
        ]
      ]
    ]
    #v(0.3em)
    #stack(
      dir: ltr,
      spacing: 1em,
      if university.keys().contains("logo") and university.logo != "" {
        image(university.logo, width: 3cm)
      } else {
        box(height: 3cm, width: 3cm, stroke: 0.5pt + black.lighten(90%), radius: 50%, fill: none)[
          #align(center + horizon)[
            #text(size: 40pt, fill: black.lighten(80%))[🏛️]
          ]
        ]
      },
      // text(size: 20pt, fill: rgb(100, 100, 100))[#date.display("[month repr:long] [day], [year]")],
    )
    #v(1em)
  ]

  // TODO: Truncate long headings in the outline
  // MARK: Assignment Summary Box
  block(
    radius: 8pt,
    fill: rgb(248, 250, 252),
    stroke: 1pt + gradient.linear(teal, blue, angle: 45deg),
    inset: 1.5em,
    width: 100%,
  )[
    #grid(
      columns: (40%, 60%),
      column-gutter: 1em,
      row-gutter: 1em,
      align: (right, left),
      // Left column
      [
        #list(
          marker: none,
          [Mã Môn:],
          [Tên Môn:],
          [Lớp:],
          [Giảng Viên:],
          [Thực Hiện:],
        )
      ],
      // Right column
      [
        #list(
          marker: none,
          [#course.id],
          [#course.name],
          [#course.class],
          [#instructor],
          [#author.name],
        )
      ],
    )

    #v(2em)

    // Place & Date

    #align(center)[
      #assignment.date
    ]
    #v(0.8em)
  ]

  // Page Break, end of the Title Page
  pagebreak()

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

  // --- PAGE NUMBERING SETUP ---
  // set page(
  //   numbering: "1",
  //   number-align: right
  // )
  // counter(page).update(1) // Optional: Resets count so this page starts at 1

  // SETUP FOOTER WITH BACK-TO-TOP
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

  // Document body
  body
}
