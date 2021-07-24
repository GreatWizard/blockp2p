#!/usr/bin/env sh

# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# Version 2, December 2004
#
# Copyright (C) 2020 glaszig <glaszig@gmail.com>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
# DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
# 0. You just DO WHAT THE FUCK YOU WANT TO.

# inspired by https://gist.github.com/johntyree/3331662#gistcomment-1968023
#
# usage:
#  UA="user agent string" mkp2pblocklist > /tmp/blockp2p.list
# or
#  UA="user agent string" mkp2pblocklist | gzip -9 > /tmp/blockp2p.list.gz

PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH"

if [ -z "$UA" ]; then
    echo "User Agent environment variable UA missing."
    echo "See, e.g., https://user-agents.net/browsers for examples."
    exit 1
fi

curl -A "$UA" -s https://www.iblocklist.com/lists.php |
    sed -n "s/.*value='\(http:.*=p2p.*\)'.*/\1/p" |
    xargs curl -A "$UA" -sLf |
    gunzip |
    egrep -v '^#' |
    uniq
