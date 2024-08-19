;; ################
;; # Eshell
;; ################


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
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt t
        eshell-prompt-function 'epe-theme-lambda))


;; ################
;; # Functions
;; ################


(defalias 'clear 'eshell/clear-scrollback)
(defalias 'cls 'eshell/clear-scrollback)
(defalias 'clr 'eshell/clear-scrollback)
(defalias 'ls 'eshell/ls)
