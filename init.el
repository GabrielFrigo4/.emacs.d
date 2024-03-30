;; Remove Backup Files
(setq make-backup-files nil)

;; Setup Packages (MELPA)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-resfresh-contents)
  (package-install 'use-package))

;; Install Packages
(use-package try
  :ensure t)
(use-package )
(use-package nasm-mode)
(use-package rust-mode)
(use-package lua-mode)

;; EMACS Options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(tsdh-dark))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(try))
 '(show-paren-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "RobotoMono Nerd Font Mono" :foundry "outline" :slant normal :weight regular :height 108 :width normal)))))
