;;################
;; Settings
;;################

;; Remove backup files
(setq make-backup-files nil)

;; Set default tab-wight
(setq-default tab-width 4)

;; Set tab on cc-mode
(setq-default indent-tabs-mode t)
(defvaralias 'c-basic-offset 'tab-width)

;; Set tab on ruby-mode
(setq ruby-indent-tabs-mode t)
(defvaralias 'ruby-indent-level 'tab-width)

;; Set tab on sgml-mode
(defvaralias 'sgml-basic-offset 'tab-width)
