;; ################
;; # Terminal
;; ################


(defun term-other-window (sh)
  "Open a `term' in a new window."
  (interactive)
  (let ((buf (term sh)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(defun zsh-other-window ()
  "Open a `zsh' in a new window."
  (interactive)
  (term-other-window "zsh"))

(defun bash-other-window ()
  "Open a `bash' in a new window."
  (interactive)
  (term-other-window "bash"))

(defun sh-other-window ()
  "Open a `sh' in a new window."
  (interactive)
  (term-other-window "sh"))

(defun cmd-other-window ()
  "Open a `cmd' in a new window."
  (interactive)
  (term-other-window "cmd"))

(defun pwsh-other-window ()
  "Open a `pwsh' in a new window."
  (interactive)
  (term-other-window "pwsh"))

(defun default-term-other-window ()
  "Open a `pwsh' in a new window."
  (interactive)
  (if (eq system-type 'windows-nt)
      (pwsh-other-window)
    (zsh-other-window)))


;; ################
;; # Shell
;; ################


(defun shell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (shell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))


;; ################
;; # Eshell
;; ################


(defun eshell-other-window ()
  "Open a `eshell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))


;; ################
;; # Shortcut
;; ################


;; Terminal
(global-set-key (kbd "C-c t") 'term)
(global-set-key (kbd "C-c C-t") 'default-term-other-window)

;; VTerminal
(global-set-key (kbd "C-c v") 'vterm)
(global-set-key (kbd "C-c C-v") 'vterm-other-window)

;; Shell
(global-set-key (kbd "C-c s") 'shell)
(global-set-key (kbd "C-c C-s") 'shell-other-window)
(global-set-key (kbd "C-c C-c") 'shell-command)

;; Eshell
(global-set-key (kbd "C-c e") 'eshell)
(global-set-key (kbd "C-c C-e") 'eshell-other-window)
