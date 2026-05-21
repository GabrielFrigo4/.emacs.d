;; ============================================================================
;;  GARBAGE COLLECTION
;; ============================================================================

(defvar gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (expt 2 20))

;; ============================================================================
;;  DIRECTORY PATH
;; ============================================================================

(setq home-dir (expand-file-name "~/"))
(setq emacs-dir (expand-file-name user-emacs-directory))

(setq etc-dir (expand-file-name "etc/" emacs-dir))
(setq var-dir (expand-file-name "var/" emacs-dir))
(setq opt-dir (expand-file-name "opt/" emacs-dir))
(setq lib-dir (expand-file-name "lib/" emacs-dir))
(setq tmp-dir (expand-file-name "tmp/" emacs-dir))
(setq usr-dir (expand-file-name "usr/" emacs-dir))
(setq temporary-file-directory tmp-dir)

(setq eshell-directory-name (expand-file-name "eshell/" var-dir))
(setq eshell-aliases-file (expand-file-name "eshell/alias" usr-dir))

(setq package-gnupghome-dir (expand-file-name "lib/elpa/gnupg" var-dir))
(setq download-directory (expand-file-name "Downloads" home-dir))

(setq auth-sources
      (list (expand-file-name ".authinfo" home-dir)
            (expand-file-name ".authinfo.gpg" home-dir)
            (expand-file-name ".netrc" home-dir)))

(setq backup-dir (expand-file-name "cache/backup/" var-dir))
(setq cache-dir  (expand-file-name "cache/" var-dir))
(setq lock-dir   (expand-file-name "run/lock/" var-dir))

(unless (file-exists-p var-dir) (make-directory var-dir t))
(unless (file-exists-p cache-dir) (make-directory cache-dir t))
(unless (file-exists-p backup-dir) (make-directory backup-dir t))
(unless (file-exists-p lock-dir) (make-directory lock-dir t))
(unless (file-exists-p tmp-dir) (make-directory tmp-dir t))
(unless (file-exists-p usr-dir) (make-directory usr-dir t))
(unless (file-exists-p (file-name-directory eshell-aliases-file))
  (make-directory (file-name-directory eshell-aliases-file) t))

;; Clear temporary directory on startup
(when (file-directory-p tmp-dir)
  (dolist (file (directory-files tmp-dir t "^[^.]"))
    (condition-case nil
        (if (file-directory-p file)
            (delete-directory file t)
          (delete-file file))
      (error nil))))

(setq treesit-extra-load-path (list (expand-file-name "lib/tree-sitter/" var-dir)))

;; ============================================================================
;;  CACHE FILES
;; ============================================================================

(setq ido-save-directory-list-file (expand-file-name "ido.last" cache-dir))
(setq tramp-persistency-file-name (expand-file-name "tramp" cache-dir))
(setq recentf-save-file (expand-file-name "recentf" cache-dir))
(setq mc/list-file (expand-file-name "mc-lists.el" cache-dir))

;; ============================================================================
;;  FEATURE TOGGLES
;; ============================================================================

(setq scroll/enable t)
(setq tressit/enable nil)
(setq minuet/enable nil)
(setq ia/enable nil)

;; ============================================================================
;;  CORE LIBRARIES
;; ============================================================================

(add-to-list 'load-path lib-dir)
(require 'core)

;; ============================================================================
;;  WARNINGS CONFIGURATION
;; ============================================================================

(setq warning-minimum-level :warning)

;; ============================================================================
;;  STARTUP SETTINGS
;; ============================================================================


(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(when (fboundp 'which-key-mode)
  (which-key-mode 1))

(require 'uniquify)

(setq evil-undo-system 'undo-redo)

;; ============================================================================
;;  LOAD ELISP FILES
;; ============================================================================

(setq custom-file (expand-file-name "custom.el" etc-dir))
(add-hook 'elpaca-after-init-hook (lambda () (load custom-file 'noerror)))

;; ============================================================================
;;  MODULAR CONFIGURATION
;; ============================================================================

(defun load-directory-recursive (directory)
  "Load all .el files in DIRECTORY and its sub-directories."
  (when (file-directory-p directory)
    (let ((files (directory-files-recursively directory "\\.el$")))
      (dolist (file files)
        (condition-case err
            (load file)
          (error (message "ERROR loading %s: %s" file (error-message-string err))))))))

;; ----------------------------------------------------------------------------
;;  CORE INITIALIZATION
;; ----------------------------------------------------------------------------
(mapc (lambda (file) (load (expand-file-name (format "init/%s" file) etc-dir)))
      '("packages" "interface" "settings" "keybindings"))

;; ----------------------------------------------------------------------------
;;  FEATURE MODULES
;; ----------------------------------------------------------------------------
(dolist (feature '("apps" "editor" "lang" "tools"))
  (load-directory-recursive (expand-file-name feature etc-dir)))

;; ----------------------------------------------------------------------------
;;  USER / LOCAL CONFIGURATION
;; ----------------------------------------------------------------------------
(load-directory-recursive usr-dir)

;; ============================================================================
;;  EMACS SERVER
;; ============================================================================

(require 'server)
(unless (server-running-p)
  (server-start))

;; ============================================================================
;;  RESTORE GARBAGE COLLECTION DEFAULTS
;; ============================================================================

(setq gc-cons-threshold gc-cons-threshold-original)
