#!/usr/bin/env bash

shopt -s globstar
for i in content/**/*.md
do
  echo $i

  # Merge code lines (single `) into multiblock code (triple ```)
  perl -0777 -i -pe 's/^((`(?!`).*`$)(\n`.*`)*)/```\n\1\n```/gm' $i
  perl -0777 -i -pe 's/^`(?!`)(.*)`$/\1/gm' $i
done
