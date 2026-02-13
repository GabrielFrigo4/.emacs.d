;; ============================================================================
;;  MINIMIZE GARBAGE COLLECTION DURING STARTUP
;; ============================================================================


(defvar gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (expt 2 20))


;; ============================================================================
;;  DIRECTORY PATH
;; ============================================================================


(setq home-dir (expand-file-name "~/"))
(setq emacs-dir (expand-file-name user-emacs-directory))
(setq package-gnupghome-dir (expand-file-name "elpa/gnupg" emacs-dir))
(setq download-directory (expand-file-name "Downloads" home-dir))

(setq auth-sources
      (list (expand-file-name ".authinfo" home-dir)
            (expand-file-name ".authinfo.gpg" home-dir)
            (expand-file-name ".netrc" home-dir)))

(setq var-dir (expand-file-name "var/" emacs-dir))
(unless (file-exists-p var-dir)
  (make-directory var-dir t))

(setq backup-dir (expand-file-name "backup/" var-dir))
(unless (file-exists-p backup-dir)
  (make-directory backup-dir t))

(setq cache-dir (expand-file-name "cache/" var-dir))
(unless (file-exists-p cache-dir)
  (make-directory cache-dir t))

(setq lock-dir (expand-file-name "lock/" var-dir))
(unless (file-exists-p lock-dir)
  (make-directory lock-dir t))


;; ============================================================================
;;  CACHE FILES
;; ============================================================================


(setq ido-save-directory-list-file (expand-file-name "ido.last" cache-dir))
(setq tramp-persistency-file-name (expand-file-name "tramp" cache-dir))
(setq recentf-save-file (expand-file-name "recentf" cache-dir))
(setq mc/list-file (expand-file-name "mc-lists.el" cache-dir))


;; ============================================================================
;;  SYSTEM MACROS
;; ============================================================================


(defun system-is-unix-p ()
  "Return true if the system is generic Unix-like (Linux, BSD, Darwin/macOS)."
  (memq system-type '(gnu gnu/linux gnu/kfreebsd berkeley-unix darwin android)))

(defmacro when-system (type &rest body) (declare (indent defun)) `(when (eq system-type ',type) ,@body))
(defmacro when-gnu      (&rest body) `(when-system gnu ,@body))
(defmacro when-linux    (&rest body) `(when-system gnu/linux ,@body))
(defmacro when-kfreebsd (&rest body) `(when-system gnu/kfreebsd ,@body))
(defmacro when-darwin   (&rest body) `(when-system darwin ,@body))
(defmacro when-bsd      (&rest body) `(when-system berkeley-unix ,@body))
(defmacro when-unix     (&rest body) `(when (system-is-unix-p) ,@body))
(defmacro when-msdos    (&rest body) `(when-system ms-dos ,@body))
(defmacro when-windows  (&rest body) `(when-system windows-nt ,@body))
(defmacro when-cygwin   (&rest body) `(when-system cygwin ,@body))
(defmacro when-haiku    (&rest body) `(when-system haiku ,@body))
(defmacro when-android  (&rest body) `(when-system android ,@body))

(defmacro if-system (type &rest body) (declare (indent defun)) `(if (eq system-type ',type) ,@body))
(defmacro if-gnu      (&rest body) `(if-system gnu ,@body))
(defmacro if-linux    (&rest body) `(if-system gnu/linux ,@body))
(defmacro if-kfreebsd (&rest body) `(if-system gnu/kfreebsd ,@body))
(defmacro if-darwin   (&rest body) `(if-system darwin ,@body))
(defmacro if-bsd      (&rest body) `(if-system berkeley-unix ,@body))
(defmacro if-unix     (&rest body) `(if (system-is-unix-p) ,@body))
(defmacro if-msdos    (&rest body) `(if-system ms-dos ,@body))
(defmacro if-windows  (&rest body) `(if-system windows-nt ,@body))
(defmacro if-cygwin   (&rest body) `(if-system cygwin ,@body))
(defmacro if-haiku    (&rest body) `(if-system haiku ,@body))
(defmacro if-android  (&rest body) `(if-system android ,@body))


;; ============================================================================
;;  UTILITY FUNCTIONS
;; ============================================================================


(defun async-sleep (seconds)
  "Sleep for SECONDS without freezing Emacs."
  (interactive)
  (let ((end-time (+ (float-time) seconds)))
    (while (< (float-time) end-time)
      (accept-process-output nil (expt 10 -3)))))


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


(setq custom-file (expand-file-name "custom.el" emacs-dir))
(add-hook 'elpaca-after-init-hook (lambda () (load custom-file 'noerror)))
(load custom-file 'noerror)

(let ((default-directory (expand-file-name "#Emacs-Lisp/" emacs-dir)))
  (normal-top-level-add-subdirs-to-load-path))

(mapc 'load (directory-files (expand-file-name "#Emacs-Lisp/#1-Packages/" emacs-dir) t "\\.el$"))
(mapc 'load (directory-files (expand-file-name "#Emacs-Lisp/#2-Behaviour/" emacs-dir) t "\\.el$"))
(mapc 'load (directory-files (expand-file-name "#Emacs-Lisp/#3-Configuration/" emacs-dir) t "\\.el$"))
(mapc 'load (directory-files (expand-file-name "#Emacs-Lisp/#4-Modes/" emacs-dir) t "\\.el$"))


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
