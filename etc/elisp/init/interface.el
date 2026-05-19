;; ============================================================================
;;  USER INTERFACE CONFIGURATION
;; ============================================================================

;; ----------------------------------------------------------------------------
;;  ICONS
;; ----------------------------------------------------------------------------

(use-package nerd-icons
  :ensure (:type git :host github :repo "emacsmirror/nerd-icons" :branch "master")
  :custom (nerd-icons-scale-factor 1.2))

;; ----------------------------------------------------------------------------
;;  THEMES
;; ----------------------------------------------------------------------------

(use-package doom-themes
  :ensure (:type git :host github :repo "doomemacs/themes" :branch "master")
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-dark+ t)
  (add-hook 'org-mode-hook #'doom-themes-org-config))

(use-package doom-modeline
  :ensure (:type git :host github :repo "emacsmirror/doom-modeline" :branch "master")
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-icon t)
  (doom-modeline-height 32)
  (doom-modeline-bar-width 4)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (doom-modeline-env-version t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-indent-info nil)
  (doom-modeline-minor-modes nil))

(use-package dashboard
  :ensure (:type git :host github :repo "emacsmirror/dashboard" :branch "master")
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)))
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner 'logo)
  (add-hook 'dashboard-mode-hook
            (lambda ()
              (setq-local display-line-numbers nil)
              (setq-local display-line-numbers-type nil)
              (display-line-numbers-mode -1))))

;; ----------------------------------------------------------------------------
;;  FRAME MANAGEMENT
;; ----------------------------------------------------------------------------

(defun set-frame-center-screen (&optional frame)
  "Center Frame (or the Current Frame) on the Screen."
  (interactive)
  (let* ((frame (or frame (selected-frame)))
         (frame-width (frame-pixel-width frame))
         (frame-height (frame-pixel-height frame))
         (display-width (display-pixel-width))
         (display-height (display-pixel-height))
         (pos-x (/ (- display-width frame-width) 2))
         (pos-y (/ (- display-height frame-height) 2)))
    (set-frame-position frame pos-x pos-y)))

(defun new-frame-setup (frame)
  (select-frame frame)
  (set-frame-size frame 87 29)
  (if-windows
   (sleep-for 0.036)
   (sleep-for 0.032))
  (set-frame-center-screen frame))

(dolist (frame (frame-list))
  (new-frame-setup frame))

(add-hook 'after-make-frame-functions 'new-frame-setup)

;; ----------------------------------------------------------------------------
;;  BUFFER MANAGEMENT
;; ----------------------------------------------------------------------------

(setq-default standard-buffers '("*scratch*" "*Messages*" "*Warnings*"))
(setq-default pkg-buffers '("*elpaca-log*" "*elpaca-info*" "*Async-native-compile-log*"))
(setq-default shell-buffers '("*Shell Configuration*"))
(setq-default org-buffers '())

(defun eaf-buffer-p (buffer)
  "Return t if BUFFER is related to EAF (checks Major Mode or Name Prefix)."
  (let ((name (buffer-name buffer)))
    (or (with-current-buffer buffer (eq major-mode 'eaf-mode))
        (string-prefix-p "*eaf" name))))

(defun kill-all-buffers ()
  "Kill all Buffers. Kills EAF even with active processes, but protects other processes."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buffer (buffer-list))
    (unless (and (get-buffer-process buffer) (not (eaf-buffer-p buffer)))
      (ignore-errors (kill-buffer buffer)))))

(defun kill-all-other-buffers ()
  "Kill all other Buffers. Kills EAF even with active processes, but protects other processes."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buffer (delq (current-buffer) (buffer-list)))
    (unless (and (get-buffer-process buffer) (not (eaf-buffer-p buffer)))
      (ignore-errors (kill-buffer buffer)))))

(defun kill-nstd-buffers ()
  "Kill Non-Standard Buffers. PROTECTS EAF if it has active processes."
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (unless (or (member name standard-buffers) (get-buffer-process buffer))
        (ignore-errors (kill-buffer buffer))))))

(defun kill-nstd-other-buffers ()
  "Kill Non-Standard Buffers (except current). PROTECTS EAF if it has active processes."
  (interactive)
  (dolist (buffer (delq (current-buffer) (buffer-list)))
    (let ((name (buffer-name buffer)))
      (unless (or (member name standard-buffers) (get-buffer-process buffer))
        (ignore-errors (kill-buffer buffer))))))

(defun kill-eaf-buffers ()
  "Kill ALL EAF related buffers (App, EPC, Monitor, etc), regardless of process."
  (interactive)
  (async-sleep (expt 2 -8))
  (dolist (buffer (buffer-list))
    (when (eaf-buffer-p buffer)
      (ignore-errors (kill-buffer buffer)))))

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

(defun setup-buffer-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

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

;; ----------------------------------------------------------------------------
;;  SERVER CONFIGURATION
;; ----------------------------------------------------------------------------

(setq server-socket-dir (expand-file-name "var/server/auth/" emacs-dir))
(setq server-name "server")

(provide 'init-interface)
