#!/usr/bin/env bash
# Use this if your editor calls pdflatex without quoting paths that contain spaces.
set -euo pipefail
cd "$(dirname "$0")"
MAIN='EE-330L Project 1.tex'

if [[ "${1:-}" == '--clean-aux' ]]; then
  shift
  rm -f "${MAIN%.tex}.aux" "${MAIN%.tex}.out" "${MAIN%.tex}.nav" "${MAIN%.tex}.toc" \
        "${MAIN%.tex}.snm" "${MAIN%.tex}.vrb" "${MAIN%.tex}.synctex.gz"
fi

exec pdflatex -interaction=nonstopmode -synctex=1 "$MAIN" "$@"
