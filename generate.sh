#!/usr/bin/env bash

set -euo pipefail

mkdir -p svgs

for theme in tmThemes/*; do
	theme_name=$(basename "$theme")
	out="svgs/${theme_name%.tmTheme}.svg"
	echo "Generating $theme_name..."
	typst compile --input theme="$theme" main.typ "$out"
done
