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
;; # Packages
;; ################


;; Install Awesome Emacs
(use-package aweshell
  :quelpa (aweshell :fetcher github :repo "GabrielFrigo4/aweshell"))
(use-package aweww
  :quelpa (aweww :fetcher github :repo "GabrielFrigo4/aweww"))

;; Install Assembly Language
(use-package fasm-mode
  :quelpa (fasm-mode :fetcher github :repo "GabrielFrigo4/fasm-mode"))
(use-package nasm-mode
  :quelpa (nasm-mode :fetcher github :repo "GabrielFrigo4/nasm-mode"))

;; Install Treesit Grammar
(use-package emacs-lisp-ts-mode
  :quelpa (emacs-lisp-ts-mode :fetcher github :repo "GabrielFrigo4/emacs-lisp-ts-mode"))
(use-package common-lisp-ts-mode
  :quelpa (common-lisp-ts-mode :fetcher github :repo "GabrielFrigo4/common-lisp-ts-mode"))
