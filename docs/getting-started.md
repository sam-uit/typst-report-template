# Getting Started

## Quick Start

1. Clone or fork this repository.
2. Create a new branch for your project (e.g., `IE103-BTTH5`).
3. Edit `config/metadata.typ` to set your document metadata.
4. Edit `author/author.typ` to set author/team information.
5. Start writing content in `content/`.
6. Run `make watch` for live preview.

## Requirements

| Tool | Install |
|------|---------|
| [Typst](https://typst.app/) | `brew install typst` or download from website |
| [Pandoc](https://pandoc.org) | `brew install pandoc` (optional, for Markdown → Typst conversion) |
| `entr` | `brew install entr` (optional, for `make watch`) |
| `make` | Pre-installed on macOS/Linux |

## Fonts

Fonts are bundled in `template/fonts/`. See [`template/fonts.typ`](../template/fonts.typ) for the current configuration.

To compile with bundled fonts:

```bash
typst compile report.typ --font-path template/fonts
typst compile thesis.typ --font-path template/fonts
typst compile slides.typ --font-path template/fonts
```

## Makefile Targets

| Target | Description |
|--------|-------------|
| `make` | Compile all PDFs (report, thesis, slides) |
| `make report.pdf` | Compile report only |
| `make thesis.pdf` | Compile thesis only |
| `make slides.pdf` | Compile slides only |
| `make typ` | Convert all Markdown to Typst (no PDF) |
| `make watch` | Live reload — recompile on file changes |
| `make clean` | Remove generated PDF files |
