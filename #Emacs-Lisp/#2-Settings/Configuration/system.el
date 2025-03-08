;; ################
;; # System
;; ################


;; Set Cursor Blink Time
(setq-default blink-cursor-interval 0.5)

;; Disable the Beep on Windows
(setq-default visible-bell t)

;; Remove Backup Files
(setq-default make-backup-files nil)

;; Remove Font Caches
(setq-default inhibit-compacting-font-caches t)

;; Disable White Space Mode
(global-whitespace-mode -1)

;; Enable End Line Wrap
(set-default 'truncate-lines nil)

;; On OSX, swap Meta and Super
;; For Better Keyboard Ergonomics
(if-darwin
 (setq-default mac-command-modifier 'meta)
 (setq-default mac-option-modifier 'super))


;; ################
;; # Coding
;; ################


;; Import *ob-async*
(require 'ob-async)

;; Def *set-coding-systems*
(setq-default setup-coding-systems
              (lambda ()
                (set-default-coding-systems 'utf-8)
                (setq-default coding-system-for-read 'utf-8)
                (setq-default coding-system-for-write 'utf-8)))

;; Setup Coding Systems
(funcall setup-coding-systems)

;; Add Hook *ob-async-pre-execute-src-block-hook*
(add-hook 'ob-async-pre-execute-src-block-hook setup-coding-systems)
