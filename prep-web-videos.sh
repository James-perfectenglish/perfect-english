#!/usr/bin/env bash
# prep-web-videos.sh
# Normalise trimmed clips for the web: strip audio, cap at 960px wide,
# 30fps, H.264 crf 26, faststart — plus a poster JPG from the final frame.
#
# Usage (run from the perfect-english repo root):
#   ./prep-web-videos.sh /path/to/picks
#
# Output:
#   assets/video/<slug>.mp4
#   assets/posters/<slug>.jpg
#
# Filenames are slugified: "Spelling Bee.mp4" -> spelling-bee.mp4
# so name your picks naturally per PICK_LIST.md and the site will find them.

set -euo pipefail

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "ffmpeg not found. Install it first:  brew install ffmpeg"
  exit 1
fi

IN="${1:-picks}"
if [ ! -d "$IN" ]; then
  echo "Input folder not found: $IN"
  echo "Usage: ./prep-web-videos.sh /path/to/picks"
  exit 1
fi

OUT_V="assets/video"
OUT_P="assets/posters"
mkdir -p "$OUT_V" "$OUT_P"

shopt -s nullglob nocaseglob
count=0

for f in "$IN"/*.mp4 "$IN"/*.mov; do
  base=$(basename "$f")
  name="${base%.*}"
  slug=$(printf '%s' "$name" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[ _]+/-/g; s/[^a-z0-9-]//g; s/-+/-/g; s/^-+//; s/-+$//')

  echo "→ ${base}  →  ${slug}.mp4"

  ffmpeg -y -loglevel error -i "$f" -an \
    -vf "scale='min(960,iw)':-2:flags=lanczos,fps=30" \
    -c:v libx264 -crf 26 -preset slow -pix_fmt yuv420p \
    -movflags +faststart \
    "$OUT_V/$slug.mp4"

  # Poster = a frame just before the end (the payoff moment)
  ffmpeg -y -loglevel error -sseof -0.2 -i "$OUT_V/$slug.mp4" \
    -frames:v 1 -q:v 3 "$OUT_P/$slug.jpg"

  size=$(du -h "$OUT_V/$slug.mp4" | cut -f1)
  echo "   done (${size})"

  bytes=$(stat -f%z "$OUT_V/$slug.mp4" 2>/dev/null || stat -c%s "$OUT_V/$slug.mp4")
  if [ "$bytes" -gt 4000000 ]; then
    echo "   ⚠ over 4 MB — consider a shorter trim for this one"
  fi

  count=$((count+1))
done

if [ "$count" -eq 0 ]; then
  echo "No .mp4 or .mov files found in $IN"
  exit 1
fi

echo ""
echo "✔ ${count} clip(s) processed."
echo "  Videos:  $OUT_V/"
echo "  Posters: $OUT_P/"
