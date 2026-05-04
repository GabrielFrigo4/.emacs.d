# Using Custom GhostScript
 If I Need to Custom Images for Preview
 ```elisp
 ;; Use sources for GhostScript
  (setq-default preview-gs-command (concat emacs-dir "/etc/lisp/sources/ghostscript/gs-mogrify.cmd"))
  (setq-default preview-gs-command (concat emacs-dir "/etc/lisp/sources/ghostscript/gs-mogrify.sh")))
 ```
