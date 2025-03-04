;; ################
;; # Buffer
;; ################


;; Def *init-buffers*
(setq-default standard-buffers '("*scratch*" "*Messages*"))
(setq-default init-buffers '("*Warnings*" "*Shell Configuration*" "*quelpa-build-checkout*" "*straight-process*"))
(setq-default org-buffers '("*Async-native-compile-log*"))

;; Def *kill-all-buffers*
(defun kill-all-buffers ()
  "Kill all Buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; Def *kill-other-buffers*
(defun kill-other-buffers ()
  "Kill all other Buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; Def *kill-init-buffers*
(defun kill-init-buffers ()
  "Kill Initial Buffers after Initialization."
  (interactive)
  (dolist (buf init-buffers)
    (when (get-buffer buf)
      (kill-buffer buf))))

;; Def *kill-org-buffers*
(defun kill-org-buffers ()
  "Kill Org Mode Buffers after Setup."
  (interactive)
  (dolist (buf org-buffers)
    (when (get-buffer buf)
      (kill-buffer buf))))

;; Def *setup-buffer-eol*
(defun setup-buffer-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq-default buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(setup-buffer-eol)


;; ################
;; # Hook
;; ################


;; Kill Initial Buffers
(add-hook 'emacs-startup-hook #'kill-init-buffers)
(add-hook 'window-setup-hook #'kill-init-buffers)
(add-hook 'elpaca-after-init-hook #'kill-init-buffers)

;; Kill Org Mode Buffers
(add-hook 'org-load-hook #'kill-org-buffers)

;; Setup Buffer EOL
(add-hook 'after-init-hook #'setup-buffer-eol)
