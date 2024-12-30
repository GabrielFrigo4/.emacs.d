;; ################
;; # Shell
;; ################


;; Standard on Linux
(when-linux
 (setq-default explicit-shell-file-name "/bin/zsh")
 (setq-default shell-file-name "zsh")
 (setq-default shell-command-switch "-c"))

;; Standard on FreeBSD
(when-freebsd
 (setq-default explicit-shell-file-name "/bin/zsh")
 (setq-default shell-file-name "zsh")
 (setq-default shell-command-switch "-c"))

;; Standard on MacOS
(when-darwin
 (setq-default explicit-shell-file-name "/bin/zsh")
 (setq-default shell-file-name "zsh")
 (setq-default shell-command-switch "-c"))

;; Standard on Windows
(when-windows
 (setq-default w32-quote-process-args t))
