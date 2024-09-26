for i in $(grep -rl "REDIRECT" ./content); do
	# get frontmatter of page
	frontmatter="$(cat "$i" | head -n$(grep '+++' -n "$i" | tail -n 1 | cut -d: -f1) | head -n-1)";
	# extract target page from MediaWiki REDIRECT thing,
	target_page="$(perl -0777 -pe 's,(?:.|\n)*REDIRECT(?:\s|\n)*(?:\[(?:[\s\S]*?)\])\((.*) "wikilink"\)(?:.|\n)*,\1,g' $i)"

	# rewrite page to be placeholder with BookHref for automatic redirect
	cat > "$i" << EOL
$frontmatter
BookHref = '../${target_page}'
+++

$target_page
EOL

	echo "Processed $i -> $target_page";
done;
