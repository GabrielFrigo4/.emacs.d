;; ============================================================================
;;  BUFFER LISTS
;; ============================================================================


(setq-default standard-buffers
              '("*scratch*" "*Messages*" "*Warnings*"))

(setq-default pkg-buffers
              '("*elpaca-log*" "*elpaca-info*" "*Async-native-compile-log*"))

(setq-default shell-buffers
              '("*Shell Configuration*"))

(setq-default org-buffers
              '())


;; ============================================================================
;;  HELPER FUNCTIONS
;; ============================================================================


(defun eaf-buffer-p (buffer)
  "Return t if BUFFER is related to EAF (checks Major Mode or Name Prefix)."
  (let ((name (buffer-name buffer)))
    (or (with-current-buffer buffer
          (eq major-mode 'eaf-mode))
        (string-prefix-p "*eaf" name))))


;; ============================================================================
;;  CLEANUP FUNCTIONS
;; ============================================================================


(defun kill-all-buffers ()
  "Kill all Buffers. Kills EAF even with active processes, but protects other processes."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buffer (buffer-list))
    (unless (and (get-buffer-process buffer)
                 (not (eaf-buffer-p buffer)))
      (ignore-errors
        (kill-buffer buffer)))))

(defun kill-all-other-buffers ()
  "Kill all other Buffers. Kills EAF even with active processes, but protects other processes."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buffer (delq (current-buffer) (buffer-list)))
    (unless (and (get-buffer-process buffer)
                 (not (eaf-buffer-p buffer)))
      (ignore-errors
        (kill-buffer buffer)))))

(defun kill-nstd-buffers ()
  "Kill Non-Standard Buffers. PROTECTS EAF if it has active processes."
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (unless (or (member name standard-buffers)
                  (get-buffer-process buffer))
        (ignore-errors
          (kill-buffer buffer))))))

(defun kill-nstd-other-buffers ()
  "Kill Non-Standard Buffers (except current). PROTECTS EAF if it has active processes."
  (interactive)
  (dolist (buffer (delq (current-buffer) (buffer-list)))
    (let ((name (buffer-name buffer)))
      (unless (or (member name standard-buffers)
                  (get-buffer-process buffer))
        (ignore-errors
          (kill-buffer buffer))))))

(defun kill-eaf-buffers ()
  "Kill ALL EAF related buffers (App, EPC, Monitor, etc), regardless of process."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buffer (buffer-list))
    (when (eaf-buffer-p buffer)
      (ignore-errors
        (kill-buffer buffer)))))

(defun kill-pkg-buffers ()
  "Kill Package Manager Buffers ONLY if no process is running."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buf pkg-buffers)
    (let ((buffer (get-buffer buf)))
      (when (and buffer (not (get-buffer-process buffer)))
        (kill-buffer buffer)))))

(defun kill-shell-buffers ()
  "Kill Shell Configuration Buffers ONLY if no process is running."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buf shell-buffers)
    (let ((buffer (get-buffer buf)))
      (when (and buffer (not (get-buffer-process buffer)))
        (kill-buffer buffer)))))

(defun kill-org-buffers ()
  "Kill Org Mode Specific Buffers ONLY if no process is running."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buf org-buffers)
    (let ((buffer (get-buffer buf)))
      (when (and buffer (not (get-buffer-process buffer)))
        (kill-buffer buffer)))))


;; ============================================================================
;;  VISUAL TWEAKS
;; ============================================================================


(defun setup-buffer-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))


;; ============================================================================
;;  HOOKS
;; ============================================================================


(add-hook 'after-init-hook #'setup-buffer-eol)

(add-hook 'window-setup-hook
          (lambda ()
            (let ((delay (if (eq system-type 'windows-nt)
                             "2.4 sec"
                           "1.6 sec")))
              (run-at-time delay nil #'kill-shell-buffers)
              (run-at-time delay nil #'kill-org-buffers)
              (run-at-time delay nil #'kill-pkg-buffers)
              (run-at-time delay nil #'kill-eaf-buffers))))
