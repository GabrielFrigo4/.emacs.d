;; ################
;; # Shell
;; ################


(if-windows
 (setq-default shell-file-name "cmd")
 (setq-default shell-file-name "zsh"))
