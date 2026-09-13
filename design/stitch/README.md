# Stitch Design References

- `DESIGN.md`: canonical Stitch design system exported with the screens.
- `assets/`: logo SVG and preview.
- `screens/S01...S38/`: normalized screen exports. Each folder contains `code.html`, `screen.png`, and `metadata.json`.
- `source-archives/`: original uploaded Stitch ZIP archives, preserved without modification.

## Integration rule

Do **not** paste `code.html` directly into Angular production code. Treat it as a high-fidelity reference for layout, content hierarchy, colors, spacing and states. Build reusable Angular components/tokens first and then port the screens.
