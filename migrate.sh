#!/usr/bin/env bash

find content -name '*.md' -print0 |
while IFS= read -r -d '' file; do
    target="org/${file#content/}"
    target="${target%.md}.org"
    mkdir -p "$(dirname "$target")"
    pandoc "$file" -f markdown -t org -o "$target"
done

find content -type f \
    ! -name '*.md' \
    -exec sh -c '
        for file do
            target="org/${file#content/}"
            mkdir -p "$(dirname "$target")"
            cp "$file" "$target"
        done
    ' sh {} +

