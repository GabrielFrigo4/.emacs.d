;; ################
;; # Evil
;; ################


;; Import *evil*
(require 'evil)

;; Enable *evil-mode*
(evil-mode t)

;; Set *evil-default-state* as Emacs
(setq-default evil-default-state 'emacs)

;; Set *initial-state* to Emacs
(dolist (mode-list '(evil-motion-state-modes
                     evil-insert-state-modes
                     evil-normal-state-modes
                     evil-visual-state-modes
                     evil-replace-state-modes
                     evil-operator-state-modes))
  (setq-default evil-emacs-state-modes (append evil-emacs-state-modes (symbol-value mode-list))))
(setq-default evil-motion-state-modes '())
(setq-default evil-insert-state-modes '())
(setq-default evil-normal-state-modes '())
(setq-default evil-visual-state-modes '())
(setq-default evil-replace-state-modes '())
(setq-default evil-operator-state-modes '())
