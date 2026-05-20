# Document Classes

The template provides four document classes, inspired by LaTeX's `\documentclass` system.

## Usage

```typst
#show: document.with(
  doc-class: "thesis",   // "article" | "report" | "book" | "thesis"
  paper: "a4",           // "a4" | "a5" | "letter"
  font-size: 12pt,       // any length
  two-sided: true,       // true | false
  output: "digital",     // "digital" | "print"
  lang: "vi",            // "en" | "vi" | "ms" | "zh-Hant" | "zh-Hans"
  components: (          // override default toggles
    show-toc: true,
    show-lof: false,
  ),
  ..data,
)
```

---

## Article

The simplest format — no cover page, no chapter-level pagebreaks. Ideal for short papers, memos, or quick reviews.

| Setting | Default |
|---------|---------|
| Paper | A4 |
| Font size | 11pt |
| Margins | 2cm all sides |
| Layout | One-sided |
| Cover page | No |
| TOC | Yes |
| Lists (LOT/LOF/LOC) | No |

---

## Report

Standard single-sided report with a cover page and front-matter lists.

| Setting | Default |
|---------|---------|
| Paper | A4 |
| Font size | 12pt |
| Margins | 2.5cm all sides |
| Layout | One-sided |
| Cover page | Yes |
| Author page | Yes |
| TOC | Yes |
| Lists (LOT/LOF/LOC) | Yes |

### Structure

1. **Cover page** — no page number
2. **Front matter** — Roman numerals (i, ii, ...)
   - Author page, TOC, List of Tables, List of Figures, List of Code
3. **Main content** — Arabic numerals (1, 2, ...)
   - Chapters with `pagebreak()` between them
4. **Appendix** — continues Arabic numbering (A.1, A.2)
5. **Bibliography** — continues Arabic numbering

---

## Book

Two-sided, chapter-based layout for longer works.

| Setting | Default |
|---------|---------|
| Paper | A4 |
| Font size | 12pt |
| Margins | Inside 3cm, Outside 2cm, Top/Bottom 2.5cm |
| Layout | Two-sided |
| Cover page | Yes |
| TOC | Yes |
| Lists (LOT/LOF/LOC) | Yes |
| Abbreviations | Yes |
| Chapter heading | "CHAPTER X" + title + horizontal rule |

---

## Thesis

Book class + thesis-specific preamble sections. Designed for university theses.

| Setting | Default |
|---------|---------|
| Paper | A4 |
| Font size | 12pt |
| Margins | Inside 3cm, Outside 2cm, Top/Bottom 2.5cm |
| Layout | Two-sided |
| Cover page | Yes |
| Soft cover | Yes |
| Summary/Abstract | Yes |
| Forewords | Yes |
| Acknowledgement | Yes |
| Instructor's comment | Yes |
| TOC | Yes |
| Lists (LOT/LOF/LOC) | Yes |
| TODO list | Yes |
| Abbreviations | Yes |

### Structure

1. **Hard cover** — no page number
2. **Soft cover** — (optional)
3. **Front matter** — Roman numerals (i, ii, ...)
   - Summary, Forewords, Acknowledgement, Instructor's comment
   - TOC, LOT, LOF, LOC, TODO list, Abbreviations
   - Each section on a separate page
4. **Main content** — Arabic numerals (1, 2, ...)
   - Chapters: "CHAPTER X" heading prefix
   - Two-sided: chapters start on odd pages
5. **Appendix** — "APPENDIX A" heading prefix
6. **Bibliography**

---

## Component Toggles

Override any default with the `components` parameter:

```typst
#show: document.with(
  doc-class: "thesis",
  components: (
    show-summary: false,          // skip abstract
    show-instructor-comment: false, // skip instructor comment
    show-todo-list: false,        // hide TODO list
  ),
  ..data,
)
```

Available toggles:

| Toggle | article | report | book | thesis |
|--------|---------|--------|------|--------|
| `show-cover` | ✗ | ✓ | ✓ | ✓ |
| `show-soft-cover` | ✗ | ✗ | ✗ | ✓ |
| `show-summary` | ✗ | ✗ | ✗ | ✓ |
| `show-forewords` | ✗ | ✗ | ✗ | ✓ |
| `show-acknowledgement` | ✗ | ✗ | ✗ | ✓ |
| `show-instructor-comment` | ✗ | ✗ | ✗ | ✓ |
| `show-author` | ✗ | ✓ | ✗ | ✗ |
| `show-toc` | ✓ | ✓ | ✓ | ✓ |
| `show-lot` | ✗ | ✓ | ✓ | ✓ |
| `show-lof` | ✗ | ✓ | ✓ | ✓ |
| `show-loc` | ✗ | ✓ | ✓ | ✓ |
| `show-todo-list` | ✗ | ✗ | ✗ | ✓ |
| `show-acronyms` | ✗ | ✗ | ✓ | ✓ |

---

## Output Modes

| Aspect | `"digital"` | `"print"` |
|--------|-------------|-----------|
| Link color | Blue | Black |
| Citation color | Blue italic | Black italic |
| Table accent | Blue tints | Gray tints |
| "Back to Top" footer | Shown | Hidden |
