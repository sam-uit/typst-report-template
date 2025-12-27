#import "/template/fonts.typ": *
#import "/template/utils.typ": static

#let cover-page(
  university: (:),
  assignment: (:),
  course: (:),
  instructor: "",
  author: (:),
  logo-path: none, // Explicit path if needed, or pass university.logo
) = {
  align(center)[
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

    // MARK: University Logo
    #v(0.3em)
    #stack(
      dir: ltr,
      spacing: 1em,
      if university.keys().contains("logo") and university.logo != "" {
        image(static(university.logo), width: 5cm)
      } else {
        box(height: 3cm, width: 3cm, stroke: 0.5pt + black.lighten(90%), radius: 50%, fill: none)[
          #align(center + horizon)[
            #text(size: 40pt, fill: black.lighten(80%))[🏛️]
          ]
        ]
      },
    )
    #v(1em)

    // MARK: Title
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
      #if assignment.subtitle != none and assignment.subtitle != "" [
        #v(0.5em)
        #text(size: 20pt, weight: "regular")[
          #assignment.subtitle
        ]
      ]
    ]
  ]

  // Thêm khoảng trống (vspace) giữa title và summary box
  v(4em)

  // MARK: Summary Box
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
}
