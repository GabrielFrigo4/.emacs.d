;;################
;; Settings
;;################


;; Remove backup files
(setq-default make-backup-files nil)

;; Set default tab-width
(setq-default tab-width 4)

;; Set tab on cc-mode
(setq-default indent-tabs-mode t)
(setq-default c-ts-mode-indent-offset tab-width)
(setq-default c-basic-offset tab-width)
(setq-default c-default-style "linux")

;; Set tab on ruby-mode
(setq-default ruby-indent-tabs-mode t)
(setq-default ruby-indent-level tab-width)

;; Set tab on sgml-mode
(setq-default sgml-basic-offset tab-width)

;; Set tab on bash-mode
(setq-default sh-basic-offset tab-width)

;; Set tab on perl-mode
(setq-default cperl-indent-level tab-width)

;; Set tab on python-mode
(setq-default python-indent-guess-indent-offset t)
(setq-default python-indent-guess-indent-offset-verbose nil)
(setq-default python-indent-offset tab-width)
