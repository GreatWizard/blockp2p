#!/usr/bin/env sh

find ./mirrors -name "*.gz" -print0 | xargs -0 gunzip -f
find ./mirrors -type f -print0 | xargs -0 sed -i 's/#.*$//g'
find ./mirrors -type f -print0 | xargs -0 sed -i '/^[[:space:]]*$/d'
