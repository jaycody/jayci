#!/bin/bash
# Turns each .mmd diagram here into a .png the README shows.
# GitHub's iOS app doesn't draw Mermaid, so the README uses images.
# Needs Node (npx). Run after editing a .mmd:  bash docs/diagrams/render.sh
#
# If Chrome isn't found, point Puppeteer at one:
#   PUPPETEER_EXECUTABLE_PATH=/path/to/chrome bash docs/diagrams/render.sh

cd "$(dirname "$0")" || exit 1

# Use the installed Chrome if Puppeteer hasn't downloaded its own (added 2026-11-09)
MAC_CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ -z "$PUPPETEER_EXECUTABLE_PATH" ] && [ -x "$MAC_CHROME" ]; then
    export PUPPETEER_EXECUTABLE_PATH="$MAC_CHROME"
fi
# 2026-11-10: one shared look for every diagram: theme.json (colors, font)
# and theme.css (hairlines, rounded corners), on ivory paper. Old lines in FOSSIL RECORD.
# Render one file:  bash docs/diagrams/render.sh a-the-chain.mmd
for src in ${@:-*.mmd}; do
    echo "rendering $src"
    npx -y @mermaid-js/mermaid-cli@11.4.2 \
        -i "$src" -o "${src%.mmd}.png" \
        -c theme.json -C theme.css \
        --scale 2 --backgroundColor '#FBF8F1' ${MMDC_ARGS} || exit 1
done



#===============================================================
###            >>> FOSSIL RECORD <<<
#===============================================================
# --- 2026-11-10 ---
# WHY: diagrams were drawn in mermaid's default theme on white. Now they
#      share theme.json + theme.css, and you can render just one file.
# for src in *.mmd; do
#     echo "rendering $src"
#     npx -y @mermaid-js/mermaid-cli@11.4.2 \
#         -i "$src" -o "${src%.mmd}.png" \
#         --scale 2 --backgroundColor white ${MMDC_ARGS} || exit 1
# done
#===============================================================
