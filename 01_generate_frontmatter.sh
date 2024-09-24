#!/usr/bin/env bash
set -e
shopt -s globstar
for i in content/**/*.md
do
  # Find category markers in content
  # TODO: Remove old tag
  CATEGORIES=`cat $i | tr '\n' ' ' | sed -E 's/\[Category:((\w|\s|:)+)\]/\nIMPORTCATEGORY\t"\1"\n/g' | grep IMPORTCATEGORY | cut -f2- | tr '\n' ',' | head -c -1`

  # Generate archetype to inject using hugo new content
  cat >archetypes/temp.md << EOL
+++
title = '{{ replaceRE "[-_]" " " .File.ContentBaseName | title }}'
EOL
  if [ -n "$CATEGORIES" ]
  then
    echo "categories = [${CATEGORIES}]" >> archetypes/temp.md;
  fi
  echo "+++" >> archetypes/temp.md
  echo "" >> archetypes/temp.md

  mv "$i" "$i.old"
  hugo new content --kind=temp "$i"
  cat "$i" "$i.old" > "$i.new"
  mv "$i.new" "$i"
  rm "$i.old"
done

rm -f archetypes/temp.md
