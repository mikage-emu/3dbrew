#!/usr/bin/env bash

shopt -s globstar
for i in content/**/*.md
do
  echo $i

  # Table headers are wrapped in an unnecessary <p> tag
  sed -i -e 's,<th><p>,<th>,g' $i
  sed -i -e 's,</p></th>,</th>,g' $i
  sed -i -e 's,<td><p>,<td>,g' $i
  sed -i -e 's,</p></td>,</td>,g' $i
done
