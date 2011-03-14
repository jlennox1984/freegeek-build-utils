#!/bin/sh

ssh ryan52@llama.freegeek.org mv public_html/mac/printme public_html/mac/printme.old
{ head -1 ../freegeek-extras/scripts/printme; cat ../rubytui/lib/rubytui.rb ../freegeek-extras/lib/printme.rb ../freegeek-extras/scripts/printme; } | sed -e '/require.*printme/ d' -e '/require.*rubytui/ d' | ssh ryan52@llama.freegeek.org sudo sponge public_html/mac/printme
