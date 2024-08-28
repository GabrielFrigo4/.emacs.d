;; ################
;; # Eshell
;; ################


(advice-add 'epe-git-p :override
                    (lambda (&rest args)
                      nil))

(with-eval-after-load 'esh-mode
  (add-hook 'eshell-mode-hook
            (lambda () (progn
                         (setq xterm-color-preserve-properties t)
                         (setenv "TERM" "xterm-256color"))))
  (add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
  (setq eshell-output-filter-functions
        (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
  )

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-multiline-with-status "eshell-prompt-extras")
  (setq eshell-highlight-prompt t
        eshell-prompt-function 'epe-theme-multiline-with-status
        epe-git-dirty-char "*")
  )

(setq eshell-last-dir-ring-size 500)
(setq eshell-cp-interactive-query t
       eshell-ln-interactive-query t
       eshell-mv-interactive-query t
       eshell-rm-interactive-query t
       eshell-mv-overwrite-files nil)

;; ################
;; # Functions
;; ################


(defalias 'clear-scrollback 'eshell/clear-scrollback)
(defalias 'clear 'eshell/clear-scrollback)
(defalias 'cls 'eshell/clear-scrollback)
(defalias 'clr 'eshell/clear-scrollback)
(defalias 'echo 'eshell/echo)
(defalias 'rm 'eshell/rm)
(defalias 'ls 'eshell/ls)
(defalias 'x 'eshell/exit)
