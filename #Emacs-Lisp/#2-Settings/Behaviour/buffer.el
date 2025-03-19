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
  (async-sleep 0.16)
  (dolist (buffer (buffer-list))
    (kill-buffer buffer)))

;; Def *kill-other-buffers*
(defun kill-other-buffers ()
  "Kill all other Buffers."
  (interactive)
  (async-sleep 0.16)
  (dolist (buffer (delq (current-buffer) (buffer-list)))
    (kill-buffer buffer)))

;; Def *kill-pkg-buffers*
(defun kill-pkg-buffers ()
  "Kill Packages Buffers."
  (interactive)
  (async-sleep 0.16)
  (dolist (buf pkg-buffers)
    (when (get-buffer buf)
      (kill-buffer buf))))

;; Def *kill-shell-buffers*
(defun kill-shell-buffers ()
  "Kill Shell Buffers."
  (interactive)
  (async-sleep 0.16)
  (dolist (buf shell-buffers)
    (when (get-buffer buf)
      (kill-buffer buf))))

;; Def *kill-org-buffers*
(defun kill-org-buffers ()
  "Kill Org Mode Buffers."
  (interactive)
  (async-sleep 0.16)
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
(add-hook 'elpaca-after-init-hook
          (lambda ()
            (if-windows
             (run-at-time "2.4 sec" nil #'kill-pkg-buffers)
             (run-at-time "1.6 sec" nil #'kill-pkg-buffers))))

;; Kill Shell Buffers
(add-hook 'window-setup-hook
          (lambda ()
            (if-windows
             (run-at-time "2.4 sec" nil #'kill-shell-buffers)
             (run-at-time "1.6 sec" nil #'kill-shell-buffers))))

;; Kill Org Mode Buffers
(add-hook 'org-load-hook
          (lambda ()
            (if-windows
             (run-at-time "2.4 sec" nil #'kill-org-buffers)
             (run-at-time "1.6 sec" nil #'kill-org-buffers))))

;; Setup Buffer EOL
(add-hook 'after-init-hook #'setup-buffer-eol)
