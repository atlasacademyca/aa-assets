#!/usr/bin/env bash
# Build the tri-fold brochure PDFs with headless Microsoft Edge.
#   ./build.sh            -> proofs with pink PLACEHOLDER tags visible (dist/*_PROOF.pdf)
#   ./build.sh final      -> print files with placeholder tags hidden (dist/*.pdf)
# Each PDF has 2 pages: page 1 = outside (flap | back | cover), page 2 = inside.
set -euo pipefail
cd "$(dirname "$0")"
EDGE="${EDGE:-/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe}"
MODE="${1:-proof}"
mkdir -p dist
for name in ${ONLY:-resume software 3dma}; do
  case $name in
    resume)   out=Brochure_Resume_Tri-Fold_A4_Dark ;;
    software) out=Brochure_WHYSE_Tri-Fold_A4_Dark ;;
    3dma)     out=Brochure_WHY3DAM_Tri-Fold_A4_Dark ;;
  esac
  src="$name.html"
  if [ "$MODE" = final ]; then
    sed 's/<body>/<body class="final">/' "$src" > ".$name.final.html"; src=".$name.final.html"
  else
    out="${out}_PROOF"
  fi
  url="file:///$(cygpath -m "$PWD/$src")"
  "$EDGE" --headless=new --disable-gpu --no-pdf-header-footer --virtual-time-budget=8000 \
          --print-to-pdf="$(cygpath -w "$PWD/dist/$out.pdf")" "$url" 2>/dev/null
  rm -f ".$name.final.html"
  echo "built dist/$out.pdf"
done
