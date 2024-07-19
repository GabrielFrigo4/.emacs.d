;; ################
;; # Eshell
;; ################


(setq eshell-prompt-function (lambda () "] "))


;; ################
;; # Functions
;; ################


(defalias 'clear 'eshell/clear-scrollback)
(defalias 'cls 'eshell/clear-scrollback)
(defalias 'clr 'eshell/clear-scrollback)
