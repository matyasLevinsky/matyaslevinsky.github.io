#!/bin/bash
# Post-render: convert R-generated PNG figures to WebP.
# Quarto runs this automatically from the project root after every render.

command -v cwebp >/dev/null 2>&1 || { echo "WARNING: cwebp not found — R figures will NOT be converted to WebP. Install the 'webp' package to enable this." >&2; exit 0; }

find _site -path "*/figure-html/*.png" | while IFS= read -r png; do
  webp="${png%.png}.webp"
  if cwebp -q 90 -quiet "$png" -o "$webp" 2>/dev/null; then
    png_base=$(basename "$png")
    webp_base=$(basename "$webp")
    # HTML page lives two levels above figure-html/
    # e.g. _site/posts/projects/SlerkaProjekt_files/figure-html/foo.png
    #   -> _site/posts/projects/SlerkaProjekt.html
    html_dir=$(dirname "$(dirname "$(dirname "$png")")")
    find "$html_dir" -maxdepth 1 -name "*.html" \
      -exec sed -i "s/${png_base}/${webp_base}/g" {} \;
    rm "$png"
  fi
done

echo "WebP figure conversion done"
