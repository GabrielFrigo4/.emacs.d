#!/usr/bin/sh

find "$HOME/.emacs.d/#Emacs-Lisp/#3-Sources/" -type f -name "*.sh" \
    -exec echo "Enable EXEC: \"{}\"" \; \
    -exec chmod +x {} \;