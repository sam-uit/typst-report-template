# A Typst Template for UIT Students

## Out Come

- A consolidated lib/template for both REPORT, THESIS and PRESENTATION.
- Separated lib files for each of document type above.

## Formatting

### REPORT

- Style: 1 page document.
- A cover page:
    - Page number: Roman (i)
- Common Sections: Table of Contents, List of Figures, List of Tables, List of Code Blocks, List of TODO, etc.
    - Heading level 1.
    - Heading number: None
    - Start right after the cover with a `pagebreak()`.
    - Page number: Roman (ii, ...)
    - Come together without a `pagebreak()`.
- Contents Sections:
    - Heading level 1.
    - Heading number: Yes
    - Heading name: None.
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

- Style: 2 pages document.
- Common Components:
    - Empty Page: "This page is intentionally left blank."
- A cover pages:
    - Two pages: Hard cover; Soft cover.
    - Separated with an Empty Page.
    - Followed by an Empty Page to make the Common Sections starting on an odd page number.
    - Page number: None
- Common Sections: Forewords, Acknowledgments, Table of Contents, List of Figures, List of Tables, List of Code Blocks, List of TODO, etc.
    - Heading level 1.
    - Heading number: None
    - Heading name: None, or respects to 'Table of Contents', 'List of Figures', etc.
    - Start after the cover pages' Empty Page.
    - Must start on an odd page number.
    - Page number: Roman (ii, ...)
    - (May/May not) followed by an Empty Page: each section must start on an odd page number.
- Contents Sections:
    - Heading level 1.
    - Heading number: Yes
    - Heading name: 'Chapter' (English); 'Chương' (Vietnamese), etc.
    - Start after the Common Sections' Empty Page (may or may not exist).
    - Start on an odd page number.
    - Page number: Arabic (1, 2, ...)
    - (May/May not) followed by an Empty Page: each section must start on an odd page number.
- Appendix Sections:
    - Heading level 1.
    - Heading number: Yes
    - Heading name: 'Appendix' (English); 'Phụ Lục' (Vietnamese), etc.
    - Start after the Contents Sections' Empty Page (may or may not exist).
    - Start on an odd page number.
    - Page number: Arabic (1, 2, ...)
    - (May/May not) followed by an Empty Page: each section must start on an odd page number.
- Bibliography:
    - Heading level 1.
    - Heading number: Yes
    - Heading name: 'Bibliography' (English); 'Tài Liệu Tham Khảo' (Vietnamese), etc.
    - Start after the Appendix Sections' Empty Page (may or may not exist).
    - Start on an odd page number.
    - Page number: Arabic (1, 2, ...)
    - (May/May not) followed by an Empty Page: each section must start on an odd page number.

### PRESENTATION

## TODO:

- [ ] Pandoc: Include the import statement in every converted file: `#import "../template/lib.typ": *`
- [ ] Code Block spans across pages.
- [ ] Pandoc: code block with '```' to figure (with or without caption).
- [ ] Pandoc: table with caption.
