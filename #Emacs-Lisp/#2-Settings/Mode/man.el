;; ################
;; # Manual
;; ################


;; Set Manual Program
(if-windows
 (setq-default manual-program (concat emacs-dir "/#Emacs-Lisp/#3-Sources/Manual/wsl-man.cmd"))
 (setq-default manual-program "/usr/bin/man"))
