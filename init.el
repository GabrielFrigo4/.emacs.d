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
  `(when (eq system-type ',type) ,@body))

;; Def *if-gnu*
(defmacro if-gnu (&rest body)
  `(if-system gnu
     (progn ,@body)))

;; Def *if-linux*
(defmacro if-linux (&rest body)
  `(if-system gnu/linux
     (progn ,@body)))

;; Def *if-freebsd*
(defmacro if-freebsd (&rest body)
  `(if-system gnu/kfreebsd
     (progn ,@body)))

;; Def *if-darwin*
(defmacro if-darwin (&rest body)
  `(if-system darwin
     (progn ,@body)))

;; Def *if-msdos*
(defmacro if-msdos (&rest body)
  `(if-system ms-dos
     (progn ,@body)))

;; Def *if-windows*
(defmacro if-windows (&rest body)
  `(if-system windows-nt
     (progn ,@body)))

;; Def *if-cygwin*
(defmacro if-cygwin (&rest body)
  `(if-system cygwin
     (progn ,@body)))

;; Def *if-haiku*
(defmacro if-haiku (&rest body)
  `(if-system haiku
     (progn ,@body)))

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

;; Use Emacs-Client to open files in an already-running Emacs-Process Server
(require 'server)
(unless (server-running-p) (server-start))

;; Set Custom File path to Elisp Code create by Emacs
(setq custom-file (concat (getenv "HOME") "/.emacs.d/custom.el"))
(load custom-file)


;; ################
;; # Settings
;; ################


;; For "RobotoMono Nerd Font", we need to separately specify the italic mode to work
(set-face-attribute 'italic nil :font "RobotoMono Nerd Font Mono" :foundry "pyrs" :slant 'italic)


;; ################
;; # ELPA & MELPA
;; ################


;; Setup Package Archives (ELPA & MELPA)
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
        ))
(setq package-archive-priorities
      '(
        ("gnu" . 20)
        ("nongnu" . 15)
        ("melpa" . 10)
        ("melpa-stable" . 5)
        ("jcs-elpa" . 0)
        ))

;; Install Use-Package (ELPA & MELPA)
(unless (package-installed-p 'use-package)
  (package-resfresh-contents)
  (package-install 'use-package))


;; ################
;; # QUELPA
;; ################


;; Setup Package Archive (QUELPA)
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))
(package-initialize)

;; Install Use-Package (QUELPA)
(quelpa
 '(quelpa-use-package
   :fetcher git
   :url "https://github.com/quelpa/quelpa-use-package.git"))
(require 'quelpa-use-package)


;; ################
;; # Load Elisp
;; ################


;; Add load-path "#Emacs-Lisp/..."
(let ((default-directory (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/")))
  (normal-top-level-add-subdirs-to-load-path))

;; Load ".el" files in "#1-Setup"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#1-Setup/*.el")))

;; Load ".el" files in "#2-Settings"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#2-Settings/*.el")))

;; Load ".el" files in "#3-Behaviour"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#3-Behaviour/*/*/*.el")))

;; Load ".el" files in "#4-Mode"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#4-Mode/*/*.el")))


;; ##################################
;; # Default garbage collection
(setq gc-cons-threshold (expt 2 20))
;; ##################################
