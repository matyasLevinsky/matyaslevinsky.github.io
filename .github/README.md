# matyasLevinsky.github.io

Personal website of **Matyáš Levínský** — Data Analyst at [PAQ Research](https://www.paqresearch.cz/) and sociology student at Charles University in Prague. Research interests include Czech regional disparities, municipal finance, electoral geography, housing policy, and the sociology of AI.

Live at **[matyaslevinsky.github.io](https://matyaslevinsky.github.io/)**.

---

## Built with

- **[Quarto](https://quarto.org/)** — static site generator with R/Python notebook support
- **[Brite](https://bootswatch.com/brite/)** (Bootswatch) — Bootstrap theme, customised via `theme-brite.scss` and `theme-dark.scss`
- **R** — data analysis and web scraping in project pages (`rvest`, `tidytext`, `topicmodels`, etc.)

## Content

| Section | Description |
|---|---|
| Home | Reverse-chronological feed of all publications and projects |
| Publications | PAQ Research studies and analyses |
| Projects | Personal data/research projects |
| CV | Full curriculum vitae (HTML + PDF) |

## Local development

Requires [Quarto CLI](https://quarto.org/docs/get-started/) and R (for pages with code chunks).

```bash
quarto preview   # dev server with live reload at localhost:4242
quarto render    # full build to _site/
```

R code chunks are frozen (`freeze: true`) — results are cached in `_freeze/`. To re-execute a page, delete its `_freeze/` subdirectory before rendering.

## Deploy

```bash
quarto publish gh-pages
```

Publishes the built site to the `gh-pages` branch, which GitHub Pages serves.
