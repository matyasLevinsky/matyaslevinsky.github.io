# matyaslevinsky.github.io

Personal portfolio and research site built with [Quarto](https://quarto.org/), deployed to GitHub Pages.

## Commands

```bash
quarto preview          # Local dev server with live reload
quarto render           # Build site to _site/
quarto publish gh-pages # Deploy to GitHub Pages
```

## Performance notes

### Search
Site search is disabled (`search: false` in `_quarto.yml`). Quarto's search bundle (fuse.min.js + autocomplete + quarto-search) adds ~41 KiB and significant CPU overhead on every page load. With fewer than ~100 posts the search bar sees negligible use.

Re-enable by removing the `search: false` line from the `website:` section of `_quarto.yml` once the post count grows past ~100.

### MathJax
MathJax is disabled globally (`html-math-method: plain`). No page on this site currently uses LaTeX math. If a future post needs it, add `html-math-method: mathjax` to that page's YAML frontmatter — Quarto will then load MathJax only for that page.
