#!/usr/bin/env bash
shopt -s globstar

function replace_anchor () {
	match=$1
	delim=$2

    # 1. Convert anchor to lowercase
    # 2. Filter out MediaWiki's escape sequences like ".22"
    # 3. Filter out ".", ":", '&', '<', and '>'
    MATCHSUB=`echo $match | tr '[:upper:]' '[:lower:]' | sed 's/\.[23][0-9a-fA-F]//g' | sed 's/[\.:&<>]//g'`

    # If the match contains both "-" and "_", convert all underscores to "-" as a heuristic
    if [[ $match =~ "-" && $match =~ "_" ]]
    then
      MATCHSUB=`echo $MATCHSUB | sed 's/_/-'/g`
    fi

    # Hardcode some special cases
    if [[ "$MATCHSUB" == "pdn-lgr-cpu-cnt0-3" ]]
    then
      MATCHSUB="pdn_lgr_cpu_cnt0-3"
    fi
    if [[ "$MATCHSUB" == "file-12-char-id" ]]
    then
      MATCHSUB="file-_12-char-id"
    fi

    echo -e "  Replacing " $match "\t=>\t" $MATCHSUB

    # Replace all mentions of this particular anchor
    sed -i "s/#$match$delim/#$MATCHSUB$delim/g" "$i"
}

for i in content/**/*.md
do
  echo "Processing $i"
  # Find all markdown anchor links, select only the actual anchor text, filter out duplicates, then run the body with the anchor id stored in $match
  # NOTE: Some links are broken across lines, so instead of "[" allow the start of line (^) as the left delimiter, too
  cat $i | grep -oP '[\]^](.*?)\((.*?)#.*?(?="wikilink"\))' | grep -oP '(?<=\#).*' | sort | uniq | while read -r match; do
    replace_anchor $match " "
  done

  # Find all HTML anchor links (excluding external ones, starting with http), select only the actual anchor text, filter out duplicates, then run the body with the anchor id stored in $match
  cat $i | grep -oP 'href="(?!http)(.*?)#.*?(?=")' | grep -oP '(?<=\#).*' | sort | uniq | while read -r match; do
    replace_anchor $match "\""
  done
done
