;; ################
;; # Shortcut
;; ################


;; Quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Copy
(global-set-key (kbd "C-<apps> c") 'kill-ring-save)
(global-set-key (kbd "C-<menu> c") 'kill-ring-save)

;; Past
(global-set-key (kbd "C-<apps> v") 'yank)
(global-set-key (kbd "C-<menu> v") 'yank)

;; Cut
(global-set-key (kbd "C-<apps> x") 'kill-region)
(global-set-key (kbd "C-<menu> x") 'kill-region)

;; Select
(global-set-key (kbd "C-<apps> a") 'mark-whole-buffer)
(global-set-key (kbd "C-<menu> a") 'mark-whole-buffer)

;; Undo
(global-set-key (kbd "C-<apps> z") 'undo)
(global-set-key (kbd "C-<menu> z") 'undo)

;; Window
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)

;; Terminal
(global-set-key (kbd "C-c t") 'term)
(global-set-key (kbd "C-c C-t") 'default-term-other-window)

;; Shell
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c C-s") 'shell-other-window)
(global-set-key (kbd "C-c C-c") 'shell-command)

;; Eshell
(global-set-key (kbd "C-c e") 'eshell)
(global-set-key (kbd "C-c C-e") 'eshell-other-window)

;; Buffer
(global-set-key (kbd "C-c b e") 'eval-buffer)
(global-set-key (kbd "C-c b k") 'kill-current-buffer)
(global-set-key (kbd "C-c w k") 'kill-buffer-and-window)

;; Command
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "<menu>") 'execute-extended-command)

;; Function Keys
;; Not used by Default: f5, f6, f7, f8, f9, f12
;; Used by Default: f1, f2, f3, f4, f10, f11
(global-set-key (kbd "<f1>") 'kill-ring-save)
(global-set-key (kbd "<f2>") 'yank)
(global-set-key (kbd "<f3>") 'kill-region)
(global-set-key (kbd "<f4>") 'mark-whole-buffer)
(global-set-key (kbd "<f5>") 'undo)
(global-set-key (kbd "<f6>") 'undo-redo)
(global-set-key (kbd "<f7>") 'list-buffers)
(global-set-key (kbd "<f8>") 'switch-to-buffer)
(global-set-key (kbd "<f9>") 'find-file)
(global-set-key (kbd "<f10>") 'dired)
(global-set-key (kbd "<f11>") 'execute-extended-command)
(global-set-key (kbd "<f12>") 'eval-buffer)

;; Numpad Keys
(global-set-key (kbd "C-0") 'eval-buffer)
(global-set-key (kbd "C-1") 'kill-ring-save)
(global-set-key (kbd "C-2") 'yank)
(global-set-key (kbd "C-3") 'kill-region)
(global-set-key (kbd "C-4") 'undo)
(global-set-key (kbd "C-5") 'undo-redo)
(global-set-key (kbd "C-6") 'mark-whole-buffer)
(global-set-key (kbd "C-7") 'find-file)
(global-set-key (kbd "C-8") 'dired)
(global-set-key (kbd "C-9") 'execute-extended-command)

;; String
(global-set-key (kbd "M-s q") 'replace-regexp)
(global-set-key (kbd "M-s r") 'replace-string)


;; ################
;; # Languages
;; ################


;; Rust Buffer
(global-set-key (kbd "C-c r f") 'rust-format-buffer)


;; ################
;; # Org-Mode
;; ################


(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
