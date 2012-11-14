#!/bin/sh

test_for_file() {
if [ ! -e "$1" ]; then
    echo "ERROR: Couldn't find input file: $1"
    exit 1
fi
}

test_for_file ../rubytui/lib/rubytui.rb
test_for_file ../freegeek-build-utils/lib/printme.rb
test_for_file ../freegeek-build-utils/scripts/printme

set -e

ssh llama.freegeek.org sudo mv /home/ryan52/public_html/mac/printme /home/ryan52/public_html/mac/printme.old
{ echo "#!/usr/bin/ruby"; cat ../rubytui/lib/rubytui.rb ../freegeek-build-utils/lib/printme.rb ../freegeek-build-utils/scripts/printme; } | sed -e '/require.*printme/ d' -e '/require.*rubytui/ d' | ssh llama.freegeek.org sudo sponge /home/ryan52/public_html/mac/printme
