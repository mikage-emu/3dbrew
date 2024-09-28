#!/usr/bin/env bash
shopt -s globstar

for i in content/**/*.md
do
  echo "Processing $i"

  # Replace "<a href=..." with the href template, to make them more consistent with links processed from markdown.
  # Notably, links to non-existing targets get formatted accordingly.
  cat $i | grep -oP 'href="(?!https?:)(?!#)(.*?)"' | grep -oP '(?<=").*(?=")' | sort | uniq | while read -r match; do
    BROKEN=""
    WITHOUTHASH=`echo -n $match | sed 's/#.*//'`

    # Perform a case-insensitive lookup and fix the link if needed
    DIR=`dirname $WITHOUTHASH`
    NAME=`basename $WITHOUTHASH`
    LOOKUP=`(cd content/News && find $DIR -maxdepth 1 -iname $NAME.md)`
    if [ ! -n "$LOOKUP" ]
    then
      LOOKUP=$match.md
      BROKEN='"broken" '
      echo `dirname "$i"`/News/$WITHOUTHASH".md"
    fi

    MATCHSUB="{{% href \"${LOOKUP::-3}\" $BROKEN%}}"
    echo -e "  Replacing " $match "\t=>\t" $MATCHSUB

    # Replace all mentions of this particular link
    sed -i "s<href=\"$match\"<$MATCHSUB<g" "$i"
  done
done
