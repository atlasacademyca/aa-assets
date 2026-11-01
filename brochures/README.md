# Tri-fold brochures

Rebuilt from the Figma exports in `../pdfs/` (the originals are left untouched there).

- `resume.html`, `software.html`, `3dma.html` hold one brochure each, with ALL of its text: page 1 is the outside (flap | back | cover), page 2 is the inside.
- Panels that repeat across brochures (About Atlas, Why families choose us, QR box, Contact, level ladders, team photo, Miguel block) are copied into each file and marked with a `<!-- name (was shared; edit in each brochure) -->` comment. Change them in every file that has them.
- `shared.js` is no longer used and can be deleted.
- `brochure.css` holds the styles: navy/gold palette, 10pt minimum body text, one gold block per side, identical panel margins.
- `assets/` holds resized copies of `../images/original`, plus `logo-light.png`, the official mark recoloured to the logo cyan for dark backgrounds.

## Build
    ./build.sh          # proofs with pink PLACEHOLDER markers -> dist/*_PROOF.pdf
    ./build.sh final    # placeholder image tags hidden        -> dist/*.pdf

Pink text placeholders (founders line, Level 6 title, 3DMA levels, Miguel's quote) are real text, so replace them in the source before sending to print.
