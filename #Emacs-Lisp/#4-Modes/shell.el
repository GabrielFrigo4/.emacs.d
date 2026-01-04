;; ################
;; # Shell
;; ################


;; Standard on Unix
(when-unix
 (setq-default explicit-shell-file-name "/bin/zsh")
 (setq-default shell-file-name "zsh")
 (setq-default shell-command-switch "-c"))

;; Standard on Windows
(when-windows
 (setq-default w32-quote-process-args t))
