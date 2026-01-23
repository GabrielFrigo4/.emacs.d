;; ============================================================================
;;  UNIX CONFIGURATION
;; ============================================================================


(when-unix
 (setq-default explicit-shell-file-name "/bin/zsh")
 (setq-default shell-file-name "zsh")
 (setq-default shell-command-switch "-c"))


;; ============================================================================
;;  WINDOWS CONFIGURATION
;; ============================================================================


(when-windows
 (setq-default w32-quote-process-args t))
