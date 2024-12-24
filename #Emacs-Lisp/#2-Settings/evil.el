;; ################
;; # Evil
;; ################


;; Import *evil*
(require 'evil)

;; Enable *evil-mode*
(evil-mode t)

;; Set *evil-default-state* as *emacs*
(setq-default evil-default-state 'emacs)

;; Set *initial-state*
(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'shell-mode 'emacs)
(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'vterm-mode 'emacs)
