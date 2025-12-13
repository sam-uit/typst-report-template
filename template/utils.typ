// MARK: Unheading (Heading without numbering, for TOC entries)

#let unheading(body) = {
  heading(level: 1, numbering: none, outlined: true)[#body]
}
