// samples/en-us.typ
// Language sample entry point — en-us
// Compile: typst compile samples/en-us.typ samples/sample-en-us.pdf --font-path template/fonts

#import "../template/lib.typ": *

#let acronyms = csv("../content/acronyms.csv")

#show: document.with(
  doc-class: "report",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: "en-us",
  acronyms: acronyms,
  university: (
    name: "University of Information Technology",
    college: "Faculty of Computer Science and Engineering",
    logo: "uit.jpeg",
  ),
  course: (
    id: "CS101",
    name: "Professional Report Template Showcase",
    class: "CS.K2025.1",
  ),
  instructor: "Prof. John Smith",
  author: (
    name: "Alice Student",
    id: "25410000",
  ),
  assignment: (
    title: "TEMPLATE SHOWCASE",
    subtitle: "ALL FORMATTING COMPONENTS",
    date: "May 20, 2026",
  ),
)

#include "_content.typ"

#show: appendix-l10n.with("en-us")
