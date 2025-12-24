# A Typst Template for UIT Students

## Out Come

- A consolidated lib/template for both REPORT, THESIS and PRESENTATION.
- Separated lib files for each of document type above.

## Formatting

### REPORT

- A cover page:
    - Page number: Roman (i)
- Common Sections: Table of Contents, List of Figures, List of Tables, List of Code Blocks, List of TODO, etc.
    - Heading level 1.
    - Start right after the cover with a `pagebreak()`.
    - Page number: Roman (ii, ...)
    - Come together without a `pagebreak()`.
- Contents Sections:
    - Heading level 1.
    - Start right after the Common Sections with a `pagebreak()`.
    - Page number: Arabic (1, 2, ...)
    - Come with a `pagebreak()` if there is a following content section.
- Appendix Sections:
    - Heading level 1.
    - Start right after the Contents Sections with a `pagebreak()`.
    - Page number: Arabic (1, 2, ...)
    - Come with a `pagebreak()` if there is a following section.
- Bibliography:
    - Heading level 1.
    - Start right after the Appendix Sections with a `pagebreak()`.
    - Page number: Arabic (1, 2, ...)
    - Come with a `pagebreak()` if there is a following section.

### THESIS

### PRESENTATION

## TODO:

- [ ] Pandoc: Include the import statement in every converted file: `#import "../template/lib.typ": *`
- [ ] Code Block spans across pages.
- [ ] Pandoc: code block with '```' to figure (with or without caption).
- [ ] Pandoc: table with caption.
