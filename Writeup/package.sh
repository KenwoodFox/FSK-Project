#!/bin/bash

# Output File
ZIPFILE="EE-330L Project 1.zip"

# List of known LaTeX build artifacts to exclude
EXCLUDE_EXTENSIONS="*.aux *.log *.synctex.gz *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk *.lof *.lot *.nav *.snm *.vrb"

# Generate list of files to include
find . -type f > all_files.txt

# Generate exclude list based on LaTeX build files
touch exclude_list.txt
for ext in $EXCLUDE_EXTENSIONS; do
    find . -type f -name "$ext" >> exclude_list.txt
done

# Find PDFs that match a .tex filename and exclude them
while read -r texfile; do
    base="${texfile%.tex}"
    if [ -f "$base.pdf" ]; then
        echo "$base.pdf" >> exclude_list.txt
    fi
done < <(find . -type f -name "*.tex")

# Create the final list of files to include by filtering out excluded files
grep -vxFf exclude_list.txt all_files.txt > include_list.txt

# Create the zip archive
zip -@ "$ZIPFILE" < include_list.txt

# Clean up temporary files
rm -f all_files.txt include_list.txt exclude_list.txt

echo "Packaged files into $ZIPFILE"
