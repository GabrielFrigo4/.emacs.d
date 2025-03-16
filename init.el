;; #############################################
;; # Minimize Garbage Collection During Startup
(setq-default gc-cons-threshold most-positive-fixnum)
(setq-default read-process-output-max (expt 2 20))
;; #############################################


;; ################
;; # Macro *When*
;; ################


;; Def *when-system*
(defmacro when-system (type &rest body)
  (declare (indent defun))
  `(when (eq system-type ',type) ,@body))

;; Def *when-gnu*
(defmacro when-gnu (&rest body)
  `(when-system gnu ,@body))

;; Def *when-linux*
(defmacro when-linux (&rest body)
  `(when-system gnu/linux ,@body))

;; Def *when-freebsd*
(defmacro when-freebsd (&rest body)
  `(when-system gnu/kfreebsd ,@body))

;; Def *when-darwin*
(defmacro when-darwin (&rest body)
  `(when-system darwin ,@body))

;; Def *when-msdos*
(defmacro when-msdos (&rest body)
  `(when-system ms-dos ,@body))

;; Def *when-windows*
(defmacro when-windows (&rest body)
  `(when-system windows-nt ,@body))

;; Def *when-cygwin*
(defmacro when-cygwin (&rest body)
  `(when-system cygwin ,@body))

;; Def *when-haiku*
(defmacro when-haiku (&rest body)
  `(when-system haiku ,@body))


;; ################
;; # Macro *If*
;; ################


;; Def *if-system*
(defmacro if-system (type &rest body)
  (declare (indent defun))
  `(if (eq system-type ',type) ,@body))

;; Def *if-gnu*
(defmacro if-gnu (&rest body)
  `(if-system gnu ,@body))

;; Def *if-linux*
(defmacro if-linux (&rest body)
  `(if-system gnu/linux ,@body))

;; Def *if-freebsd*
(defmacro if-freebsd (&rest body)
  `(if-system gnu/kfreebsd ,@body))

;; Def *if-darwin*
(defmacro if-darwin (&rest body)
  `(if-system darwin ,@body))

;; Def *if-msdos*
(defmacro if-msdos (&rest body)
  `(if-system ms-dos ,@body))

;; Def *if-windows*
(defmacro if-windows (&rest body)
  `(if-system windows-nt ,@body))

;; Def *if-cygwin*
(defmacro if-cygwin (&rest body)
  `(if-system cygwin ,@body))

;; Def *if-haiku*
(defmacro if-haiku (&rest body)
  `(if-system haiku ,@body))


;; ################
;; # Dir / Path
;; ################


;; $HOME
(setq-default home-dir (getenv "HOME"))
(setq-default home-dir (replace-regexp-in-string "\\\\" "/" home-dir))

;; $HOME/.emacs.d
(setq-default emacs-dir (concat home-dir "/.emacs.d"))


;; ################
;; # Startup
;; ################


;; Set to "fundamental-mode"
(setq-default initial-major-mode 'fundamental-mode)

;; Set to "Interactively DO things” (IDO)
(setq-default ido-enable-flex-matching t)
(setq-default ido-everywhere t)
(ido-mode t)

;; Set to "Which Key" in shortcut
(which-key-mode t)

;; Remove Default Message
(setq-default initial-scratch-message 'nil)

;; Unique Buffer Names for Matching Files
(require 'uniquify)

;; Disable package.el at Startup
(require 'package)
(setq-default package-enable-at-startup nil)

;; Set *evil-undo-system* as *undo-redo*
(setq-default evil-undo-system 'undo-redo)


;; ################
;; # Load Elisp
;; ################


;; Add load-path "#Emacs-Lisp/..."
(let ((default-directory (concat emacs-dir "/#Emacs-Lisp/")))
  (normal-top-level-add-subdirs-to-load-path))

;; Load ".el" files in "#1-Packages"
(mapc 'load (file-expand-wildcards (concat emacs-dir "/#Emacs-Lisp/#1-Packages/*.el")))

;; Load ".el" files in "#2-Settings"
(mapc 'load (file-expand-wildcards (concat emacs-dir "/#Emacs-Lisp/#2-Settings/*/*.el")))

;; Set Custom File path to Elisp Code Create by Emacs
(setq-default custom-file (concat emacs-dir "/custom.el"))
(add-hook 'elpaca-after-init-hook (lambda () (load custom-file 'noerror)))


;; ################
;; # Server
;; ################


;; Use Emacs-Client to Open Files in an Already-Running Emacs-Process Server
(require 'server)
(unless (server-running-p) (server-start))


;; ##################################
;; # Default Garbage Collection
(setq-default gc-cons-threshold (expt 2 20))
;; ##################################
