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


;; Install Aweshell
(use-package aweshell
  :quelpa (aweshell :fetcher github :repo "GabrielFrigo4/aweshell"))

;; Install FASM
(use-package fasm-mode
  :quelpa (fasm-mode :fetcher github :repo "GabrielFrigo4/fasm-mode"))

;; Install NASM
(use-package nasm-mode
  :quelpa (nasm-mode :fetcher github :repo "GabrielFrigo4/nasm-mode"))
