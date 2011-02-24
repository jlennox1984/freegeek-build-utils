#!/bin/sh

set -e

for FILE in po/*.po; do
    BASENAME=$(basename $FILE)
    LANG=$(echo $BASENAME | cut -d '.' -f 1)
    DIR=locale/$LANG/LC_MESSAGES/
    mkdir -p $DIR
    rmsgfmt $FILE -o $DIR/basiccheck.mo
done
