;; ################
;; # Buffer
;; ################


;; Def *init-buffers*
(setq-default init-buffers '("*Warnings*" "*Messages*" "*Shell Configuration*" "*Async-native-compile-log*" "*quelpa-build-checkout*"))

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

;; Kill Initial Buffers
(add-hook 'server-switch-hook #'kill-init-buffers)
(add-hook 'after-init-hook #'kill-init-buffers)
