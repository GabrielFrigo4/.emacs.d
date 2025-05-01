# Using Custom GhostScript
 If I Need to Custom Images for Preview
 ```elisp
 ;; Use #3-Sources for GhostScript
 (if-windows
  (setq-default preview-gs-command (concat emacs-dir "/#Emacs-Lisp/#3-Sources/GhostScript/gs-mogrify.cmd"))
  (setq-default preview-gs-command (concat emacs-dir "/#Emacs-Lisp/#3-Sources/GhostScript/gs-mogrify.sh")))
 ```
