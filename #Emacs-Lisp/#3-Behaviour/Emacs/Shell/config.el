;; ################
;; # Shell
;; ################


(if-windows
  (setq shell-file-name "cmd"))
(if-linux
  (setq shell-file-name "zsh"))