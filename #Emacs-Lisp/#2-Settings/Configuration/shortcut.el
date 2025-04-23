;; ################
;; # Shortcut
;; ################


;; Window
(global-set-key (kbd "M-]") 'other-window)
(global-set-key (kbd "C-;") 'other-window)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "<backtab>") 'other-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)

;; Buffer
(global-set-key (kbd "C-c b e") 'eval-buffer)
(global-set-key (kbd "C-c b k") 'kill-current-buffer)
(global-set-key (kbd "C-c w k") 'kill-buffer-and-window)

;; Command
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "<menu>") 'execute-extended-command)

;; Insert
(global-set-key (kbd "C-c i") 'insert-char)

;; String
(global-set-key (kbd "M-s q") 'replace-regexp)
(global-set-key (kbd "M-s r") 'replace-string)


;; ################
;; # System
;; ################


;; Backspace
(global-set-key (kbd "<backspace>") 'backward-delete-char)
(global-set-key (kbd "S-<backspace>") 'backward-delete-char-untabify)

;; Delete
(global-set-key (kbd "<del>") 'backward-delete-char)
(global-set-key (kbd "S-<del>") 'backward-delete-char-untabify)

;; Quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Kill Process
(global-set-key (kbd "C-c k") 'kill-process)
(global-set-key (kbd "C-c C-k") 'eshell-kill-process)
(global-set-key (kbd "C-c M-k") 'eaf-kill-process)


;; ################
;; # Terminal
;; ################


;; Terminal
(global-set-key (kbd "C-c t") 'term)

;; VTerminal
(global-set-key (kbd "C-c v") 'vterm)

;; Shell
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c C-s") 'shell-command)

;; Eshell
(global-set-key (kbd "C-c e") 'eshell)

;; Aweshell
;; (global-set-key (kbd "") 'aweshell-new)
;; (global-set-key (kbd "") 'aweshell-next)
;; (global-set-key (kbd "") 'aweshell-prev)
(global-set-key (kbd "C-c C-a") 'aweshell-toggle)
;; (global-set-key (kbd "") 'aweshell-sudo-toggle)
;; (global-set-key (kbd "") 'aweshell-autosuggest)
;; (global-set-key (kbd "") 'aweshell-clear-buffer)
;; (global-set-key (kbd "") 'aweshell-switch-buffer)
;; (global-set-key (kbd "") 'aweshell-search-history)
;; (global-set-key (kbd "") 'aweshell-dedicated-open)
;; (global-set-key (kbd "") 'aweshell-dedicated-close)
(global-set-key (kbd "C-c C-d") 'aweshell-dedicated-toggle)


;; ################
;; # Cursors
;; ################


;; Multiple Cursors
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-a") 'mc/mark-all-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)


;; ################
;; # Org-Mode
;; ################


;; Org-Mode
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Babel
(global-set-key (kbd "C-c o e") #'org-babel-execute-buffer)
(global-set-key (kbd "C-c o s") #'org-babel-execute-src-block)
(global-set-key (kbd "C-c o m") #'org-babel-execute-maybe)
(global-set-key (kbd "C-c o t") #'org-babel-execute-subtree)


;; ################
;; # LaTeX / TeX
;; ################


;; Preview
(global-set-key (kbd "C-c p") #'preview-latex)
