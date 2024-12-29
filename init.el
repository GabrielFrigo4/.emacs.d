;; #############################################
;; # Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (expt 2 20))
;; #############################################


;; ################
;; # Macros
;; ################


;; Def *if-system*
(defmacro if-system (type &rest body)
  (declare (indent defun))
  `(if (eq system-type ',type) ,@body))

;; Def *if-gnu*
(defmacro if-gnu (&rest body)
  `(if-system gnu
     ,@body))

;; Def *if-linux*
(defmacro if-linux (&rest body)
  `(if-system gnu/linux
     ,@body))

;; Def *if-freebsd*
(defmacro if-freebsd (&rest body)
  `(if-system gnu/kfreebsd
     ,@body))

;; Def *if-darwin*
(defmacro if-darwin (&rest body)
  `(if-system darwin
     ,@body))

;; Def *if-msdos*
(defmacro if-msdos (&rest body)
  `(if-system ms-dos
     ,@body))

;; Def *if-windows*
(defmacro if-windows (&rest body)
  `(if-system windows-nt
     ,@body))

;; Def *if-cygwin*
(defmacro if-cygwin (&rest body)
  `(if-system cygwin
     ,@body))

;; Def *if-haiku*
(defmacro if-haiku (&rest body)
  `(if-system haiku
     ,@body))


;; ################
;; # Startup
;; ################


;; Set to "fundamental-mode"
(setq initial-major-mode 'fundamental-mode)

;; Set to "Interactively DO things” (IDO)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Remove default message
(setq initial-scratch-message 'nil)

;; Unique Buffer Names for Matching Files
(require 'uniquify)

;; Disable package.el at Startup
(require 'package)
(setq package-enable-at-startup nil)

;; Set *evil-undo-system* as *undo-redo*
(setq-default evil-undo-system 'undo-redo)


;; ################
;; # Settings
;; ################


;; For "RobotoMono Nerd Font", we need to separately specify the italic mode to work
(set-face-attribute 'italic nil :font "RobotoMono Nerd Font Mono" :foundry "pyrs" :slant 'italic)


;; ################
;; # Load Elisp
;; ################


;; Add load-path "#Emacs-Lisp/..."
(let ((default-directory (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/")))
  (normal-top-level-add-subdirs-to-load-path))

;; Load ".el" files in "#1-Packages"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#1-Packages/*.el")))

;; Load ".el" files in "#2-Settings"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#2-Settings/*/*.el")))

;; Load ".el" files in "#3-Behaviour"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#3-Behaviour/*/*/*.el")))

;; Load ".el" files in "#4-Mode"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#4-Mode/*/*.el")))

;; Set Custom File path to Elisp Code create by Emacs
(setq custom-file (concat (getenv "HOME") "/.emacs.d/custom.el"))
(load custom-file)


;; ################
;; # Server
;; ################


;; Use Emacs-Client to open files in an already-running Emacs-Process Server
(require 'server)
(unless (server-running-p) (server-start))


;; ##################################
;; # Default garbage collection
(setq gc-cons-threshold (expt 2 20))
;; ##################################
