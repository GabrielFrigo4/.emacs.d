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

;; Enable End Line Wrap
(setq-default truncate-lines nil)
(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'prog-mode-hook (lambda () (visual-line-mode -1)))

;; Enable Auto Revert Mode
(global-auto-revert-mode t)
(setq-default global-auto-revert-non-file-buffers t)

;; Disable White Space Mode
(global-whitespace-mode -1)

;; Enable Completion Preview
(global-completion-preview-mode t)

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


;; ################
;; # Images
;; ################


;; Enable to Load a Large Images (2^24 x 2^24 pixels)
(setq-default max-image-size (expt 2 24))

;; Image Cache Eviction Delay (2^8 seconds)
(setq-default image-cache-eviction-delay (expt 2 8))


;; ################
;; # Async
;; ################


(setq-default async-shell-command-buffer 'new-buffer)
