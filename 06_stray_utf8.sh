#!/usr/bin/env bash

shopt -s globstar
for i in content/**/*.md
do
  echo $i

  # Fix leftover UTF-8 garbage from broken wikicode
  sed -i -e 's/\xe2\x80\x8e//g' $i
done
