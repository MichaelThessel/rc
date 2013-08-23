#!/bin/bash
# use ./ctags projectName path
exec ctags-exuberant -f ~/.vim/mytags/$1 \
-h \".php\" -R \
--exclude=\"\.svn\" \
--totals=yes \
--tag-relative=yes $2/* \
--PHP-kinds=+cf \
--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
--regex-PHP='/interface ([^ ]*)/\1/c/' \
--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
