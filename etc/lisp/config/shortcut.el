;; ============================================================================
;;  WINDOW MANAGEMENT
;; ============================================================================


(global-set-key (kbd "M-]")          'other-window)
(global-set-key (kbd "C-;")          'other-window)
(global-set-key (kbd "C-<tab>")      'other-window)
(global-set-key (kbd "<backtab>")    'other-window)

(global-set-key (kbd "C-M-<up>")     'enlarge-window)
(global-set-key (kbd "C-M-<down>")   'shrink-window)
(global-set-key (kbd "C-M-<right>")  'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<left>")   'shrink-window-horizontally)


;; ============================================================================
;;  BUFFER MANAGEMENT
;; ============================================================================


(global-set-key (kbd "C-c b e")  'eval-buffer)
(global-set-key (kbd "C-c b k")  'kill-current-buffer)
(global-set-key (kbd "C-c w k")  'kill-buffer-and-window)
(global-set-key (kbd "C-c n")    'kill-nstd-other-buffers)


;; ============================================================================
;;  SYSTEM / EDITING
;; ============================================================================


(global-set-key (kbd "<apps>")   'execute-extended-command)
(global-set-key (kbd "<menu>")   'execute-extended-command)
(global-set-key (kbd "C-c i")    'insert-char)
(global-set-key (kbd "M-s q")    'replace-regexp)
(global-set-key (kbd "M-s r")    'replace-string)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; ============================================================================
;;  BACKSPACE HACKS
;; ============================================================================


(global-set-key (kbd "<backspace>")    'backward-delete-char)
(global-set-key (kbd "S-<backspace>")  'backward-delete-char-untabify)
(global-set-key (kbd "<del>")          'backward-delete-char)
(global-set-key (kbd "S-<del>")        'backward-delete-char-untabify)
(global-set-key (kbd "C-?")            'backward-delete-char)
(global-set-key (kbd "S-C-?")          'backward-delete-char-untabify)


;; ============================================================================
;;  TERMINALS
;; ============================================================================


(global-set-key (kbd "C-c M-t")  'term)
(global-set-key (kbd "C-c M-v")  'vterm)
(global-set-key (kbd "C-c e")    'eshell)
(global-set-key (kbd "C-c C-s")  'shell-command)


;; ============================================================================
;;  AWESHELL
;; ============================================================================


(global-set-key (kbd "C-c C-a")  'aweshell-toggle)


;; ============================================================================
;;  MULTIPLE CURSORS
;; ============================================================================


(global-unset-key (kbd "M-<down-mouse-1>"))

(global-set-key (kbd "M-<mouse-1>")    'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-<mouse-1>")  'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-c")          'mc/edit-lines)
(global-set-key (kbd "C-S-a")          'mc/mark-all-like-this)
(global-set-key (kbd "C->")            'mc/mark-next-like-this)


;; ============================================================================
;;  ORG MODE
;; ============================================================================


(global-set-key (kbd "C-c l")  #'org-store-link)
(global-set-key (kbd "C-c a")  #'org-agenda)
(global-set-key (kbd "C-c c")  #'org-capture)


;; ============================================================================
;;  LATEX
;; ============================================================================


(global-set-key (kbd "C-c v")  #'view-latex)
(global-set-key (kbd "C-c p")  #'preview-latex)
