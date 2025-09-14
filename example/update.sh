#!/bin/bash

NAME=example

# xgettext doesn't work if your code contains unbalanced `'` (like a `'Class`).
# We should add Ada support in xgettext, or write our own
xgettext --from-code=UTF-8 --keyword=Tr --keyword=Ctr:1c,2 --add-comments -C -o po/"$NAME.pot" src/"$NAME.adb"

# Only for french here
if test -f po/fr/"$NAME.po"; then
	msgmerge --update po/fr/"$NAME.po" po/"$NAME.pot"
	msgfmt --output-file=share/locale/fr/LC_MESSAGES/"$NAME.mo" po/fr/"$NAME.po"
else
	msginit --input=po/"$NAME.pot" --locale=fr --output=po/fr/"$NAME.po"
fi
