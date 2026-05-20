// /template/i18n.typ
// Internationalization: multilingual label system
// Author: Sam Dinh
// Version: 0.2.0
// License: MIT
//
// Supported languages: en (default), vi, ms, zh-Hant, zh-Hans
// Usage:
//   #import "i18n.typ": i18n-labels
//   #let labels = i18n-labels("vi")
//   labels.toc  // => "Mục Lục"

// MARK: Label Definitions

#let _labels = (
  // ── English (default) ──────────────────────────────
  en: (
    // Front matter
    toc: "Table of Contents",
    lot: "List of Tables",
    lof: "List of Figures",
    loc: "List of Code Snippets",
    todo-list: "TODO List",
    abbreviations: "Abbreviations",
    abbreviation-short: "Abbreviation",
    abbreviation-full: "Full Form",
    summary: "Abstract",
    forewords: "Foreword",
    acknowledgement: "Acknowledgement",
    instructor-comment: "Instructor's Comment",
    // Chapter heading prefix
    chapter-prefix: "CHAPTER",
    appendix-prefix: "APPENDIX",
    appendix-supplement: "Appendix",
    bibliography-supplement: "References",
    // Figure supplements
    figure-code: "Code",
    figure-image: "Figure",
    figure-table: "Table",
    // Misc
    blank-page: "This page is intentionally left blank.",
    back-to-top: "↑ Back to Top",
  ),

  // ── Vietnamese ─────────────────────────────────────
  vi: (
    toc: "Mục Lục",
    lot: "Danh Sách Bảng",
    lof: "Danh Sách Hình Ảnh",
    loc: "Danh Sách Mã Nguồn",
    todo-list: "Danh Sách TODO",
    abbreviations: "Bảng Viết Tắt",
    abbreviation-short: "Viết Tắt",
    abbreviation-full: "Nghĩa Đầy Đủ",
    summary: "Tóm Tắt",
    forewords: "Lời Nói Đầu",
    acknowledgement: "Lời Cảm Ơn",
    instructor-comment: "Nhận Xét Của Giảng Viên",
    chapter-prefix: "CHƯƠNG",
    appendix-prefix: "PHỤ LỤC",
    appendix-supplement: "Phụ Lục",
    bibliography-supplement: "Tài Liệu Tham Khảo",
    figure-code: "Mã nguồn",
    figure-image: "Hình ảnh",
    figure-table: "Bảng",
    blank-page: "Trang này được cố tình để trống.",
    back-to-top: "↑ Back to Top",
  ),

  // ── Bahasa Malaysia ────────────────────────────────
  ms: (
    toc: "Isi Kandungan",
    lot: "Senarai Jadual",
    lof: "Senarai Rajah",
    loc: "Senarai Kod Sumber",
    todo-list: "Senarai TODO",
    abbreviations: "Senarai Singkatan",
    abbreviation-short: "Singkatan",
    abbreviation-full: "Maksud Penuh",
    summary: "Abstrak",
    forewords: "Kata Pengantar",
    acknowledgement: "Penghargaan",
    instructor-comment: "Ulasan Penyelia",
    chapter-prefix: "BAB",
    appendix-prefix: "LAMPIRAN",
    appendix-supplement: "Lampiran",
    bibliography-supplement: "Rujukan",
    figure-code: "Kod",
    figure-image: "Rajah",
    figure-table: "Jadual",
    blank-page: "Halaman ini sengaja dikosongkan.",
    back-to-top: "↑ Kembali ke Atas",
  ),

  // ── Chinese Traditional ───────────────────────────
  zh-Hant: (
    toc: "目錄",
    lot: "表格列表",
    lof: "圖片列表",
    loc: "程式碼列表",
    todo-list: "待辦事項",
    abbreviations: "縮寫表",
    abbreviation-short: "縮寫",
    abbreviation-full: "全稱",
    summary: "摘要",
    forewords: "前言",
    acknowledgement: "致謝",
    instructor-comment: "指導教師評語",
    chapter-prefix: "第",
    appendix-prefix: "附錄",
    appendix-supplement: "附錄",
    bibliography-supplement: "參考文獻",
    figure-code: "程式碼",
    figure-image: "圖",
    figure-table: "表",
    blank-page: "本頁刻意留白。",
    back-to-top: "↑ 返回頂部",
  ),

  // ── Chinese Simplified ────────────────────────────
  zh-Hans: (
    toc: "目录",
    lot: "表格列表",
    lof: "图片列表",
    loc: "代码列表",
    todo-list: "待办事项",
    abbreviations: "缩写表",
    abbreviation-short: "缩写",
    abbreviation-full: "全称",
    summary: "摘要",
    forewords: "前言",
    acknowledgement: "致谢",
    instructor-comment: "指导教师评语",
    chapter-prefix: "第",
    appendix-prefix: "附录",
    appendix-supplement: "附录",
    bibliography-supplement: "参考文献",
    figure-code: "代码",
    figure-image: "图",
    figure-table: "表",
    blank-page: "本页刻意留白。",
    back-to-top: "↑ 返回顶部",
  ),
)

// MARK: Public API

/// Returns the label dictionary for the given language code.
/// Falls back to English if the language is not supported.
///
/// - lang (str): Language code ("en", "vi", "ms", "zh-Hant", "zh-Hans")
/// -> dictionary
#let i18n-labels(lang) = {
  if lang in _labels {
    _labels.at(lang)
  } else {
    _labels.at("en")
  }
}

/// Returns the list of supported language codes.
/// -> array
#let i18n-supported-languages() = {
  _labels.keys()
}
