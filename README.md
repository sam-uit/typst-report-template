# University Assignment Template

This is a Typst template for university assignments, refactored to a modular, professional book-like structure.

## Example

*   Please take a look at the example: [main.pdf](main.pdf).

## Usage

1.  **Clone/Copy** this directory.
2.  **Edit Metadata**: Open `metadata.typ` and key in your report's details (University, Course, Author, Assignment).
3.  **Edit Content**:
    *   Add your chapters/sections in the `content/` directory.
    *   You can use `.typ` files directly or `.md` files (which `make` will convert for you).
4.  **Edit Main**:
    *   Open `main.typ`.
    *   Include your new content files from the `content/` folder.
5.  **Compile**:
    *   Run `make` to build `main.pdf`.
    *   Run `make watch` to watch for changes and rebuild automatically.

## Structure

```
.
├── main.typ                # Entry point (edit this to assemble the report)
├── metadata.typ            # Project metadata (formerly data.typ) - Edit this first!
├── assets/                 # Global assets (images, logos)
├── content/                # Content chapters/sections
│   ├── author.typ          # Author information
│   ├── quiz1.typ
│   └── ...
└── template/               # The template logic (formerly libs)
    ├── lib.typ             # Main template entry point & layout definition
    ├── fonts.typ           # Font definitions
    ├── utils.typ           # Helper functions (unheading, etc.)
    └── components/         # UI Components
        ├── callout.typ     # Callout boxes (Note, Warning, etc.)
        ├── table.typ       # Rounded table wrappers
        └── todo.typ        # TODO box component
```

## Features

*   **Modular Design**: Content, metadata, and styling are separated.
*   **Professional Layout**: Rounded tables, clean typography, code blocks with line numbers and vertical separators.
*   **Automated Elements**: auto-generated Table of Contents, List of Figures, List of Tables.
*   **Makefile Support**:
    *   `make`: Compiles the project.
    *   `make watch`: Live updates.
    *   `make clean`: Cleans up generated files.
    *   (Optional) Auto-converts `content/*.md` to `.typ` if you prefer writing Markdown.
