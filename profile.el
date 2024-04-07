;;################
;; Settings
;;################

;; Remove Backup Files
(setq make-backup-files nil)

;;################
;; Packages
;;################

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
(use-package nasm-mode
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package lua-mode
  :ensure t)
(use-package neotree
  :ensure t
  :config (setq neo-theme (if (display-graphic-p) 'arrow))
  :bind ("C-\\" . 'neotree-toggle))
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))
(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-right-bottom)
    ))
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

;; Settings Packages
(setq-default neo-show-hidden-files t)

;;################
;; Shortcut
;;################

;; Window
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-M-<up>") 'enlarge-window)
(global-set-key (kbd "C-M-<down>") 'shrink-window)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)

;; Buffer
(global-set-key (kbd "C-x c") 'kill-current-buffer)

;; Command
(global-set-key (kbd "<apps>") 'execute-extended-command)

;; Function Keys (not used by default)
(global-set-key (kbd "<f5>") ctl-x-map)
(global-set-key (kbd "<f6>") ctl-x-map)
(global-set-key (kbd "<f7>") ctl-x-map)
(global-set-key (kbd "<f8>") ctl-x-map)
(global-set-key (kbd "<f9>") ctl-x-map)
(global-set-key (kbd "<f12>") ctl-x-map)
