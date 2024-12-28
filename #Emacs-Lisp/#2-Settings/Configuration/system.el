;; ################
;; # System
;; ################


;; Set cursor blink time
(setq blink-cursor-interval 0.5)

;; Disable the beep on Windows
(setq-default visible-bell t)

;; Remove backup files
(setq-default make-backup-files nil)

;; Set default to UTF-8 and UTF-16-LE
(if-windows
 (set-default-coding-systems 'utf-16-le)
 (set-default-coding-systems 'utf-8))

;; On OSX, swap Meta and Super
;; For Better Keyboard Ergonomics
(if-darwin
 (setq mac-command-modifier 'meta)
 (setq mac-option-modifier 'super))
