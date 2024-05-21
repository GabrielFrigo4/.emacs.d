;; ################
;; # Settings
;; ################


;; Remove backup files
(setq-default make-backup-files nil)

;; Set default tab-width
(setq-default tab-width 4)

;; Set *cc-mode*
(setq-default indent-tabs-mode t)
(setq-default c-ts-mode-indent-offset tab-width)
(setq-default c-ts-mode-indent-style "linux")
(setq-default c-basic-offset tab-width)
(setq-default c-default-style "linux")

;; Set *ruby-mode*
(setq-default ruby-indent-tabs-mode t)
(setq-default ruby-indent-level tab-width)

;; Set *sgml-mode*
(setq-default sgml-basic-offset tab-width)

;; Set *bash-mode*
(setq-default sh-basic-offset tab-width)

;; Set *perl-mode*
(setq-default cperl-indent-level tab-width)

;; Set *rust-mode*
(setq-default rust-ident-offset tab-width)
(setq-default rust-format-on-save t)
(add-hook 'rust-mode-hook 
  (lambda () (setq indent-tabs-mode t)))

;; Set *python-mode*
(setq-default python-indent-guess-indent-offset t)
(setq-default python-indent-guess-indent-offset-verbose nil)
(setq-default python-indent-offset tab-width)
(add-hook 'python-mode-hook
  (lambda () (setq indent-tabs-mode t)))
