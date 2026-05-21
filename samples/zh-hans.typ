// samples/zh-hans.typ
// Language sample entry point — zh-Hans
// Compile: typst compile samples/zh-hans.typ samples/sample-zh-hans.pdf --font-path template/fonts

#import "../template/lib.typ": *

#let acronyms = csv("../content/acronyms.csv")

#show: document.with(
  doc-class: "report",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: "zh-Hans",
  acronyms: acronyms,
  university: (
    name: "信息技术大学",
    college: "计算机科学与工程学院",
    logo: "uit.jpeg",
  ),
  course: (
    id: "CS101",
    name: "专业报告模板展示",
    class: "CS.K2025.1",
  ),
  instructor: "王教授",
  author: (
    name: "陈同学",
    id: "25410004",
  ),
  assignment: (
    title: "模板展示",
    subtitle: "所有格式组件",
    date: "2026年5月20日",
  ),
)

#include "_content.typ"

#show: appendix-l10n.with("zh-Hans")
