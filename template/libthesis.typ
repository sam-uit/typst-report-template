// A THESIS TEMPLATE
// Đây là template cho luận văn, bao gồm các component như:
// - Cover page
// - Front matter
// - Main content
// - Appendix
// - Back matter
// Định dạng: 1 mặt hoặc 2 mặt (book)

#import "fonts.typ": *
#import "utils.typ": *
#import "components/callout.typ": *
#import "components/todo.typ": *
#import "components/table.typ": *
#import "components/cover.typ": cover-page

// MARK: Thesis Template
#let thesis(
  university: (:),
  course: (:),
  instructor: "",
  author: (:),
  assignment: (:),
  ..args,
  body,
) = {
  // Page setup
  set page(margin: 2.5cm)
  set text(font: body-font, size: 12pt, weight: "regular")

  // Paragraph
  set par(leading: 0.8em, justify: true, spacing: 1.5em)

  // ------------------------------------------------------------------
  // 1. HARD COVER (No page numbering, not counted)
  // ------------------------------------------------------------------
  set page(header: none, footer: none)
  cover-page(
    university: university,
    course: course,
    instructor: instructor,
    author: author,
    assignment: assignment,
  )

  // If a 2-sided document, add a blank page
  // Empty Page after Hard Cover
  // empty-page()

  // REMOVED/XÓA SOFT COVER
  // TODO: Nếu có tùy chọn 1-mặt/2-mặt, thì thêm soft cover

  // ------------------------------------------------------------------
  // 3. FRONT MATTER (Roman numbering, starts at iii)
  // ------------------------------------------------------------------
  set page(
    numbering: "i",
    number-align: center, // Thesis usually center or outer
  )

  // Configure headings for Front Matter (No numbering)
  set heading(numbering: none)
  show heading.where(level: 1): it => {
    block(below: 2em)[
      #set align(left)
      #text(size: 24pt, weight: "bold")[#it.body]
    ]
  }

  // Foreword (Placeholder if not passed, but usually user provides it in body?)
  // The user body starts here.
  // But wait, the user's 'body' contains everything including chapters.
  // We need to inject TOC etc BEFORE the user's chapters.
  // But user might want to write Foreword themselves.

  // Let's assume the user uses 'thesis.typ' to include sections.
  // We will provide TOC here.

  // TOC
  // Cleartoodd handled by heading show rule?
  // Standard outline usually doesn't trigger heading show rule.

  // Nếu là 2-mặt, thì thêm cleartoodd()
  // cleartoodd()
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
  pagebreak()
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
  pagebreak()
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
  pagebreak()
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

  // ------------------------------------------------------------------
  // 4. MAIN CONTENT (Arabic numbering, Chapter X)
  // We need to switch style for the rest of the body
  // ------------------------------------------------------------------

  // We cannot easily switch the show rule for headings dynamically inside the template
  // unless we use a state or a scoped show rule.
  // But 'body' is yielded at the end.

  // The common trick is to use a show rule on the rest of the content.
  show: rest => {
    // Reset page numbering to Arabic
    set page(numbering: "1")
    counter(page).update(1)

    // Update Heading styling for Chapters
    set heading(numbering: "1.")

    // Custom Chapter Heading
    show heading.where(level: 1): it => {
      // Nếu là 2-mặt, thì thêm cleartoodd()
      // cleartoodd()
      // else, thêm pagebreak()
      pagebreak()
      // Check if it's a "Chapter" or "Appendix" based on numbering?
      // For now, assume Chapter.
      // v(15%)
      align(left)[
        #text(size: 18pt, weight: "bold", fill: gray)[CHƯƠNG #counter(heading).display("1.")]
        #v(0.5em)
        #text(size: 30pt, weight: "bold")[#it.body]
        #v(1em)
        #line(length: 100%, stroke: 2pt + black)
      ]
      v(1em)
    }

    rest
  }

  // Finally yield the body
  body
}

// MARK: Appendix Helper
#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A.1", supplement: "Phụ Lục")

  show heading.where(level: 1): it => {
    // Nếu là 2-mặt, thì thêm cleartoodd()
    // cleartoodd()
    // else, thêm pagebreak()
    pagebreak()
    // v(15%)
    align(left)[
      #text(size: 18pt, weight: "bold", fill: gray)[PHỤ LỤC #counter(heading).display()]
      #v(0.5em)
      #text(size: 30pt, weight: "bold")[#it.body]
      #v(1em)
      #line(length: 100%, stroke: 2pt + black)
    ]
    v(1em)
  }

  body
}
