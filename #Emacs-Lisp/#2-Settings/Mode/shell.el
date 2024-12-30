;; ################
;; # Shell
;; ################


;; Default for Most OS
(setq-default shell-file-name "zsh")
(setq-default shell-command-switch "-c")

;; Standard on Windows
(when-windows
 (setq-default shell-file-name "cmd.exe")
 (setq-default shell-command-switch "/c")
 (setq-default w32-quote-process-args t))
