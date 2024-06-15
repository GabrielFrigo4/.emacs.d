;; ################
;; # Shortcut
;; ################


;; Quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Window
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)

;; Buffer
(global-set-key (kbd "C-c b") 'kill-current-buffer)
(global-set-key (kbd "C-c w") 'kill-buffer-and-window)

;; Command
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "<menu>") 'execute-extended-command)

;; Function keys (not used by default)
(global-set-key (kbd "<f5>") 'find-file)
(global-set-key (kbd "<f6>") 'dired)
(global-set-key (kbd "<f7>") 'execute-extended-command)
(global-set-key (kbd "<f8>") ctl-x-map)
(global-set-key (kbd "<f9>") ctl-x-x-map)
(global-set-key (kbd "<f12>") 'eval-buffer)

;; Rust Buffer
(global-set-key (kbd "C-c r f") 'rust-format-buffer)


;; ################
;; # Org-Mode
;; ################


(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
