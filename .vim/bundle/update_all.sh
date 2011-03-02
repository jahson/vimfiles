#!/bin/sh
find ~/.vim/bundle -type d -name .git | xargs -n1 dirname | sort | while read line; do echo "\033[0;32m$line\033[0m" && cd $line && git pull; done
