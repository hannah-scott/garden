#!/bin/sh
# grow the garden
mkdir -p static

find garden -name "*.md" | cut -d/ -f2- | while read l; do
	cat "garden/$l" | sed -E "s/\]\(garden/\]\(/g" > tmp.md
	sed -Ei "s/.md\)/.html\)/g" tmp.md

	file=$(echo "$l" | rev | cut -d. -f2- | rev)
	dir=$(echo "$l" | rev | cut -d/ -f2- | rev)
	mkdir -p "./static/$dir"
	pandoc -s tmp.md --lua-filter lazy.lua -o "./static/$file.html"
	rm tmp.md
done

find garden -name "*.png" | cut -d/ -f2- | while read l; do
	dir=$(echo "$l" | rev | cut -d/ -f2- | rev)
	mkdir -p "./static/$dir"
	cp "garden/$l" "./static/$l"
done

rm -r ./static/*.md
rm -r ./static/.*
rm -r ./static/private
