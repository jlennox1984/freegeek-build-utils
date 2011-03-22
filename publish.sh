#!/bin/sh

test_for_file() {
if [ ! -e "$1" ]; then
    echo "ERROR: Couldn't find input file: $1"
    exit 1
fi
}

test_for_file ../rubytui/lib/rubytui.rb
test_for_file ../freegeek-extras/lib/printme.rb
test_for_file ../freegeek-extras/scripts/printme

set -e

ssh llama.freegeek.org sudo mv /home/ryan52/public_html/mac/printme /home/ryan52/public_html/mac/printme.old
{ head -1 ../freegeek-extras/scripts/printme; cat ../rubytui/lib/rubytui.rb ../freegeek-extras/lib/printme.rb ../freegeek-extras/scripts/printme; } | sed -e '/require.*printme/ d' -e '/require.*rubytui/ d' | ssh llama.freegeek.org sudo sponge /home/ryan52/public_html/mac/printme
