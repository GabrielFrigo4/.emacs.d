;; ################
;; # ELPA
;; ################


;; Setup Package Archives (ELPA & MELPA)
(setq-default package-archives
              '(
                ("gnu" . "https://elpa.gnu.org/packages/")
                ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                ("melpa" . "https://melpa.org/packages/")
                ("melpa-stable" . "https://stable.melpa.org/packages/")
                ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
                ))
(setq-default package-archive-priorities
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
;; # Packages
;; ################


;; Install Emacs Visual Studio
(use-package auto-scroll-bar
  :ensure t
  :config
  (auto-scroll-bar-mode t))

;; Install Themes
(use-package doom-themes
  :ensure t)
