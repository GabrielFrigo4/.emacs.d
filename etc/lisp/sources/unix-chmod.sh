#!/usr/bin/sh

find "$HOME/.emacs.d/etc/lisp/sources/" -type f -name "*.sh" \
    -exec echo "Enable EXEC: \"{}\"" \; \
    -exec chmod +x {} \;
