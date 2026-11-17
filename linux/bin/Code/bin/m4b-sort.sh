#!/usr/bin/env bash
#
# organize_m4b.sh - Organize audiobooks into Author/Title/Author - Title.m4b
#
# Usage:
#   ./organize_m4b.sh [-n] [source_dir] [dest_dir]
#
#   -n   dry run (show what would happen, don't move anything)
#
# Defaults: source_dir = current directory, dest_dir = source_dir

set -euo pipefail

DRY_RUN=0
if [[ "${1:-}" == "-n" ]]; then
  DRY_RUN=1
  shift
fi

SRC="${1:-.}"
DEST="${2:-$SRC}"

shopt -s nullglob

moved=0
skipped=0

for file in "$SRC"/*.m4b; do
  filename="$(basename "$file")"
  name="${filename%.m4b}"

  # Must contain " - " separator
  if [[ "$name" != *" - "* ]]; then
    echo "SKIP (no ' - ' found): $filename"
    ((skipped++)) || true
    continue
  fi

  # Split on the FIRST " - " (author is before, title is everything after)
  author="${name%% - *}"
  title="${name#* - }"

  # Trim leading/trailing whitespace
  author="$(echo "$author" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
  title="$(echo "$title" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

  if [[ -z "$author" || -z "$title" ]]; then
    echo "SKIP (empty author or title): $filename"
    ((skipped++)) || true
    continue
  fi

  target_dir="$DEST/$author/$title"
  target_file="$target_dir/$filename"

  if [[ -e "$target_file" ]]; then
    echo "SKIP (already exists): $target_file"
    ((skipped++)) || true
    continue
  fi

  if ((DRY_RUN)); then
    echo "[dry run] $filename -> $author/$title/"
  else
    mkdir -p "$target_dir"
    mv -- "$file" "$target_file"
    echo "Moved: $filename -> $author/$title/"
  fi
  ((moved++)) || true
done

echo
if ((DRY_RUN)); then
  echo "Dry run complete: $moved would be moved, $skipped skipped."
else
  echo "Done: $moved moved, $skipped skipped."
fi
