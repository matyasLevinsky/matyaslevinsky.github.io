# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
quarto preview          # Local dev server with live reload
quarto render           # Build site to _site/
quarto publish gh-pages # Deploy to GitHub Pages
```

For pages with R code chunks, execution results are cached via `freeze: true` in `_quarto.yml`. Re-run R code by deleting the relevant `_freeze/` subdirectory before rendering.

## Architecture

This is a **Quarto website** (personal portfolio/research site), not Jekyll.

**Content structure:**
- Root-level `.qmd` files: `index.qmd`, `about.qmd`, `cv.qmd`, `projects.qmd`, `publications.qmd` (nav pages)
- `posts/projects/` — project write-ups (e.g. `SlerkaProjekt.qmd`, `AIHypeCycles.qmd`)
- `posts/publications/` — publication stub pages (9 files linking to PAQ Research)

**Key files:**
- `_quarto.yml` — site config: navbar, themes, bibliography paths, Google Analytics (`G-02CDV8B142`), output directory (`_site/`)
- `theme-brite.scss` — primary theme (Brite/Bootswatch); all custom styles go here
- `theme-dark.scss` — dark-mode overrides only
- `data/listing-categories.html` — JS snippet injected via `include-after-body`; adds `data-value` attributes to category tag elements so SCSS selectors can target them by name
- `data/` — bibliography files (`Website.bib`, `TheAIHypeCycle.bib`), citation style (`apa.csl`), R helper scripts

**Listing system:** `projects.qmd` and `publications.qmd` are pure listing pages pointing at their respective `posts/` subdirectories. `index.qmd` aggregates both into a single reverse-chronological feed under `#listing-recent`.

**Category tag system:** Quarto renders category tags as `.listing-category` (in listing cards) and `.quarto-category` (in article headers) but adds no `data-value` attribute natively. The JS in `data/listing-categories.html` backfills `data-value` from text content at page load. SCSS in `theme-brite.scss` uses `@mixin category-colors` to apply theme colors per tag. The `publication` and `project` type tags are hidden globally and revealed only inside `#listing-recent`.

**Multi-format output:** `cv.qmd` renders to both HTML and PDF. `AIHypeCycles.qmd` also produces a PDF — configured in the file's YAML frontmatter.

**R integration:** `posts/projects/SlerkaProjekt.qmd` contains executable R code chunks (web scraping, text analysis). Helper functions live in `data/helperCNNAnalysis.R`. Required system library: `libgsl-dev` (for `topicmodels` R package).

**Bibliography:** Citations use APA style (`data/apa.csl`). Add new `.bib` files to `data/` and register them in `_quarto.yml`.
