// samples/ms-my.typ
// Language sample entry point — ms-my
// Compile: typst compile samples/ms-my.typ samples/sample-ms-my.pdf --font-path template/fonts

#import "../template/lib.typ": *

#let acronyms = csv("../content/acronyms.csv")

#show: document.with(
  doc-class: "report",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: "ms-my",
  acronyms: acronyms,
  university: (
    name: "Universiti Teknologi Maklumat",
    college: "Fakulti Sains Komputer dan Kejuruteraan",
    logo: "uit.jpeg",
  ),
  course: (
    id: "CS101",
    name: "Pameran Templat Laporan Profesional",
    class: "CS.K2025.1",
  ),
  instructor: "Prof. Ahmad Ibrahim",
  author: (
    name: "Siti Pelajar",
    id: "25410002",
  ),
  assignment: (
    title: "PAMERAN TEMPLAT",
    subtitle: "SEMUA KOMPONEN PEMFORMATAN",
    date: "20 Mei 2026",
  ),
)

#include "_content.typ"

#show: appendix-l10n.with("ms")
