# University Report & Thesis Template

A professional [Typst](https://typst.app/) template for academic reports, theses, and slide presentations.

> [!WARNING]
> **Branch policy**: Never merge report branches (`report-xxx`) into `main`. Only merge feature branches (`feat/xxx`, `fix/xxx`).

## Quick Start

```bash
# 1. Clone and create your branch
git clone <repo-url> && cd typst-report-template
git checkout -b IE103-BTTH5

# 2. Edit metadata and author info
#    → config/metadata.typ
#    → author/author.typ

# 3. Write content in content/

# 4. Compile
make watch          # live reload
make                # compile all PDFs
```

## Document Classes

LaTeX-inspired class system — choose your format:

```typst
#show: document.with(
  doc-class: "thesis",   // article | report | book | thesis
  paper: "a4",           // a4 | a5 | letter
  font-size: 12pt,
  two-sided: true,
  output: "digital",     // digital | print
  lang: "vi",            // en | vi | ms | zh-Hant | zh-Hans
  ..data,
)
```

| Class | Use Case |
|-------|----------|
| `article` | Short papers, memos — no cover, compact layout |
| `report` | Course reports — cover page, single-sided |
| `book` | Long-form works — two-sided, chapter headings |
| `thesis` | University thesis — book + preamble sections |

## Project Structure

```
├── thesis.typ              # Thesis entry file
├── report.typ              # Report entry file
├── slides.typ              # Presentation entry file
├── Makefile                 # Build automation
│
├── config/
│   └── metadata.typ        # Document metadata (title, author, course)
├── author/
│   └── author.typ          # Author / team information
├── content/
│   ├── chapter01.typ       # Chapter files
│   ├── preamble-*.typ      # Front-matter sections (thesis)
│   ├── appendixA.typ       # Appendix files
│   ├── assets/             # Images, diagrams
│   └── acronyms.csv        # Abbreviation table
│
├── template/
│   ├── lib.typ             # Public API — document(), appendix, bibliography
│   ├── class-defaults.typ  # Per-class presets
│   ├── geometry.typ        # Paper size & margin logic
│   ├── output-profiles.typ # Digital vs print styling
│   ├── formatting.typ      # Show rules (headings, code, tables)
│   ├── front-matter.typ    # Preamble orchestration
│   ├── i18n.typ            # Multilingual labels (en, vi, ms, zh)
│   ├── fonts.typ           # Font definitions
│   ├── colors.typ          # Color tokens
│   ├── utils.typ           # Helper functions
│   ├── fonts/              # Bundled font files
│   ├── components/         # UI components (callout, cover, table, todo)
│   └── libslides.typ       # Presentation template
│
├── themes/                 # Slide presentation themes
├── static/                 # Static assets (logos)
├── pandoc/                 # Markdown → Typst conversion tools
└── docs/                   # Documentation
```

## Documentation

| Guide | Description |
|-------|-------------|
| [Getting Started](docs/getting-started.md) | Installation, requirements, Makefile usage |
| [Document Classes](docs/document-classes.md) | Class parameters, component toggles, output modes |
| [Slides](docs/slides.md) | Presentation themes and color palettes |
| [TODO](docs/TODO.md) | Roadmap and backlog |

## License

MIT
