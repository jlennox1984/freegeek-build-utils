#!/bin/sh

set -e

rm -f po/basiccheck.pot
ruby -r yaml -e "YAML::load(File.read('basicchecks.yml'))['tests'].values.map{|x| [:title, :success, :failure, :pretest, :explanation].map{|y| x[y.to_s]}}.flatten.select{|x| !x.nil?}.uniq.each{|x| puts \"a = _(#{x.inspect})\"}" > po/tmpfile.rb
rgettext basiccheck po/tmpfile.rb -o po/basiccheck.pot
rm -f po/tmpfile.rb
for FILE in po/*.po; do
    msgmerge -U $FILE po/basiccheck.pot
done



