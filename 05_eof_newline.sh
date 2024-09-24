#!/usr/bin/env bash

shopt -s globstar
for i in content/**/*.md
do
  echo $i

  # Make sure each file ends with a newline
  vi -escwq $i
done
