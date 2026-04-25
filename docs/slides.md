# Slide Presentations

The template includes a presentation system built on the [Touying](https://github.com/touying-typ/touying) framework with custom themes.

## Usage

```typst
#import "template/libslides.typ": *

#show: presentation.with(
  title: "My Presentation",
  subtitle: "A Subtitle",
  author: "Author Name",
  institution: "University",
)
```

## Themes

Themes are stored in `themes/`:

- `stargazer.typ` — Default theme
- `aqua.typ` — Alternative theme

## Color Palettes

Change colors in `template/libslides.typ` → `config-colors(...)`.

### Classic Academic (Default)

```typst
config-colors(
  primary: rgb("#1454de"),
  primary-dark: rgb("#004078"),
  secondary: rgb("#ffffff"),
  tertiary: rgb("#8b3de5"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#1e1180"),
)
```

### Future Tech

```typst
config-colors(
  primary: rgb("#2d73be"),
  primary-dark: rgb("#0051A8"),
  secondary: rgb("#ffffff"),
  tertiary: rgb("#05807a"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#2c3e50"),
)
```

### Eco Smart

```typst
config-colors(
  primary: rgb("#009688"),
  primary-dark: rgb("#004D40"),
  secondary: rgb("#ffffff"),
  tertiary: rgb("#8BC34A"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#455A64"),
)
```

### Neural Network

Gemini-inspired gradient.

```typst
config-colors(
  primary: rgb("#6c0ef0"),
  primary-dark: rgb("#3700B3"),
  secondary: rgb("#ffffff"),
  tertiary: rgb("#e53087"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#1a1a1a"),
)
```

### Warm Amber

```typst
config-colors(
  primary: rgb("#1d7c92"),
  primary-dark: rgb("#093c48"),
  secondary: rgb("#FFE2AF"),
  tertiary: rgb("#FFE2AF"),
  neutral-lightest: rgb("#ffffff"),
  neutral-darkest: rgb("#023855"),
)
```
