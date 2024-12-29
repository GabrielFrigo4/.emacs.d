;; ################
;; # System
;; ################


;; Set cursor blink time
(setq-default blink-cursor-interval 0.5)

;; Disable the beep on Windows
(setq-default visible-bell t)

;; Remove backup files
(setq-default make-backup-files nil)

;; Set default to UTF-8
(set-default-coding-systems 'utf-8)

;; On OSX, swap Meta and Super
;; For Better Keyboard Ergonomics
(if-darwin
 (setq-default mac-command-modifier 'meta)
 (setq-default mac-option-modifier 'super))
