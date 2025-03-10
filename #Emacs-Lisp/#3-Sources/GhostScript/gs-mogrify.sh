#!/bin/zsh

# Get PNG Path and Run GhostScript
/usr/bin/rungs "$@"
path=$(echo "$1" | sed 's/-sOutputFile=\(.*\)/\1/' | sed 's/%d/*/')

# Command List
# [212;42] => 170
# [28;7] => 21
/usr/bin/mogrify -fuzz 0%% -fill "RGB(42,42,42)" -opaque "RGB(28,28,28)" -format png "$path"
/usr/bin/mogrify -fuzz 1%% -fill "RGB(93,93,93)" -opaque "RGB(22,22,22)" -format png "$path"
/usr/bin/mogrify -fuzz 2%% -fill "RGB(127,127,127)" -opaque "RGB(17,17,17)" -format png "$path"
/usr/bin/mogrify -fuzz 2%% -fill "RGB(144,144,144)" -opaque "RGB(15,15,15)" -format png "$path"
/usr/bin/mogrify -fuzz 2%% -fill "RGB(161,161,161)" -opaque "RGB(13,13,13)" -format png "$path"
/usr/bin/mogrify -fuzz 3%% -fill "RGB(178,178,178)" -opaque "RGB(11,11,11)" -format png "$path"
/usr/bin/mogrify -fuzz 3%% -fill "RGB(195,195,195)" -opaque "RGB(9,9,9)" -format png "$path"
/usr/bin/mogrify -fuzz 3%% -fill "RGB(212,212,212)" -opaque "RGB(7,7,7)" -format png "$path"
