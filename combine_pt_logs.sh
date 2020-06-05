#!/bin/bash
# Combine many downloaded Papertrail .tsv.gz logs into one file, then clean up the format a bit.
# Usage:
# - Download logs from Papertrail to a new folder
# - cd to that folder
# - sh ~/Sites/personal/utilities/combine_pt_logs.sh
# - less -S cleaned.tsv

rm combined.tsv 2> /dev/null
rm cleaned.tsv 2> /dev/null
for f in *.tsv.gz; do gunzip $f 2> /dev/null; done
for f in *.tsv; do cat $f >> combined.tsv; done
cat combined.tsv \
  | sed -E $'s#^[0-9]+\t([0-9\-]+ [0-9\:]+)\t[0-9\-]+ [0-9\:]+\t[0-9]+\t[A-z\-]+\t([0-9\.]+)\t[A-z0-9]+\t[A-z]+\t([A-z0-9\/\.]+)\t#\\3\t\\1\t#g' \
  | sed -E 's#\\n$##g' \
  | grep -v "heroku/router" \
  | grep -v "app/heroku-postgres" \
  | grep -v "app/postgres." \
  > cleaned.tsv
