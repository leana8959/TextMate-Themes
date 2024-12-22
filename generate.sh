#!/usr/bin/env bash

set -euo pipefail

mkdir -p svgs

markdown=$(mktemp)

for theme in tmThemes/*; do
	theme_name=$(basename "$theme")
	out="${theme_name%.tmTheme}.svg"
	echo "Generating $theme_name..."
	echo "![$theme_name]($out)" >> "$markdown"
	typst compile --input theme="$theme" main.typ "svgs/$out"
done

mv "$markdown" svgs/README.md
