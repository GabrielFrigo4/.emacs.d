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


;; ################
;; # Settings
;; ################


;; For "RobotoMono Nerd Font", we need to separately specify the italic mode to work
(set-face-attribute 'italic nil :font "RobotoMono Nerd Font Mono" :foundry "pyrs" :slant 'italic)


;; ################
;; # ELPACA
;; ################


;; Disable package.el at Startup
(require 'package)
(setq package-enable-at-startup nil)

;; Setup Package Archives (ELPACA)
(defvar elpaca-installer-version 0.8)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Wait (ELPACA)
(elpaca-wait)

;; Install Use-Package (ELPACA)
(elpaca elpaca-use-package
  (elpaca-use-package-mode)
  (setq elpaca-use-package-by-default t))

;; Wait (ELPACA)
(elpaca-wait)


;; ################
;; # ELPA & MELPA
;; ################


;; Setup Package Archives (ELPA & MELPA)
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
;; # STRAIGHT
;; ################


;; Setup Package Archive (STRAIGHT)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;; ################
;; # Load Elisp
;; ################


;; Add load-path "#Emacs-Lisp/..."
(let ((default-directory (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/")))
  (normal-top-level-add-subdirs-to-load-path))

;; Load ".el" files in "#1-Packages"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#1-Packages/*.el")))

;; Load ".el" files in "#2-Settings"
(mapc 'load (file-expand-wildcards (concat (getenv "HOME") "/.emacs.d/#Emacs-Lisp/#2-Settings/*.el")))

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
