#!/bin/sh
# grow the garden
mkdir -p docs
rm -r docs/*

find garden -name "*.md" | cut -d/ -f2- | while read l; do
	cat "garden/$l" | sed -E "s/\]\(garden/\]\(/g" > tmp.md
	sed -Ei "s/.md\)/.html\)/g" tmp.md

	file=$(echo "$l" | rev | cut -d. -f2- | rev)
	dir=$(echo "$l" | rev | cut -d/ -f2- | rev)
	mkdir -p "./docs/$dir"
	pandoc -s tmp.md --lua-filter lazy.lua -o "./docs/$file.html"
	rm tmp.md
done

find garden -name "*.png" | cut -d/ -f2- | while read l; do
	dir=$(echo "$l" | rev | cut -d/ -f2- | rev)
	mkdir -p "./docs/$dir"
	cp "garden/$l" "./docs/$l"
done

rm -r ./docs/*.md
rm -r ./docs/.*
rm -r ./docs/private
