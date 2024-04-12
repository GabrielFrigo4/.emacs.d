;;################
;; Shortcut
;;################

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
(global-set-key (kbd "<f7>") ctl-x-x-map)
(global-set-key (kbd "<f8>") ctl-x-r-map)
(global-set-key (kbd "<f9>") ctl-x-4-map)
(global-set-key (kbd "<f12>") ctl-x-5-map)
