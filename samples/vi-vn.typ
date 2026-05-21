// samples/vi-vn.typ
// Language sample entry point — vi-vn
// Compile: typst compile samples/vi-vn.typ samples/sample-vi-vn.pdf --font-path template/fonts

#import "../template/lib.typ": *

#let acronyms = csv("../content/acronyms.csv")

#show: document.with(
  doc-class: "report",
  paper: "a4",
  font-size: 11pt,
  two-sided: false,
  output: "digital",
  lang: "vi-vn",
  acronyms: acronyms,
  university: (
    name: "Trường Đại Học Công Nghệ Thông Tin",
    college: "Khoa Khoa Học Và Kỹ Thuật Thông Tin",
    logo: "uit.jpeg",
  ),
  course: (
    id: "DEMO101",
    name: "Giới Thiệu Mẫu Báo Cáo Chuyên Nghiệp",
    class: "LT.K2025.2-CNTT",
  ),
  instructor: "Nguyễn Văn Giảng Viên",
  author: (
    name: "Trần Thị Sinh Viên",
    id: "25410001",
  ),
  assignment: (
    title: "BÀI TẬP THỰC HÀNH DEMO",
    subtitle: "TEMPLATE SHOWCASE — TẤT CẢ THÀNH PHẦN ĐỊNH DẠNG",
    date: "Ngày 20 Tháng 05 Năm 2026",
  ),
)

#include "_content.typ"

#show: appendix-l10n.with("vi")
