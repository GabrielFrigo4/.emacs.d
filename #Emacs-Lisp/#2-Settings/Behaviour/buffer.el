;; ################
;; # Buffer
;; ################


;; Set Buffer List
(setq-default standard-buffers '("*scratch*" "*Messages*" "*Warnings*"))
(setq-default pkg-buffers '("*quelpa-build-checkout*" "*straight-process*" "*Async-native-compile-log*"))
(setq-default shell-buffers '("*Shell Configuration*"))
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

;; Def *kill-pkg-buffers*
(defun kill-pkg-buffers ()
  "Kill Packages Buffers."
  (interactive)
  (dolist (buf pkg-buffers)
    (when (get-buffer buf)
      (kill-buffer buf))))

;; Def *kill-shell-buffers*
(defun kill-shell-buffers ()
  "Kill Shell Buffers."
  (interactive)
  (dolist (buf shell-buffers)
    (when (get-buffer buf)
      (kill-buffer buf))))

;; Def *kill-org-buffers*
(defun kill-org-buffers ()
  "Kill Org Mode Buffers."
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


;; Kill Packages Buffers
(add-hook 'elpaca-after-init-hook #'kill-pkg-buffers)

;; Kill Shell Buffers
(add-hook 'window-setup-hook #'kill-shell-buffers)

;; Kill Org Mode Buffers
(add-hook 'org-load-hook #'kill-org-buffers)

;; Setup Buffer EOL
(add-hook 'after-init-hook #'setup-buffer-eol)
