// samples/zh-hant.typ
// Language sample entry point — zh-Hant
// Compile: typst compile samples/zh-hant.typ samples/sample-zh-hant.pdf --font-path template/fonts

#import "../template/lib.typ": *

#let acronyms = csv("../content/acronyms.csv")

#show: document.with(
  doc-class: "report",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: "zh-Hant",
  acronyms: acronyms,
  university: (
    name: "資訊科技大學",
    college: "電腦科學與工程學院",
    logo: "uit.jpeg",
  ),
  course: (
    id: "CS101",
    name: "專業報告模板展示",
    class: "CS.K2025.1",
  ),
  instructor: "王教授",
  author: (
    name: "陳同學",
    id: "25410003",
  ),
  assignment: (
    title: "模板展示",
    subtitle: "所有格式組件",
    date: "2026 年 5 月 20 日",
  ),
)

#include "_content.typ"

#show: appendix-l10n.with("zh-Hant")
