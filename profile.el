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
(global-set-key (kbd "C-c b") 'kill-current-buffer)
(global-set-key (kbd "C-c w") 'kill-buffer-and-window)

;; Command
(global-set-key (kbd "<apps>") 'execute-extended-command)
(global-set-key (kbd "<menu>") 'execute-extended-command)

;; Function Keys (not used by default)
(global-set-key (kbd "<f5>") 'find-file)
(global-set-key (kbd "<f6>") 'dired)
(global-set-key (kbd "<f7>") ctl-x-x-map)
(global-set-key (kbd "<f8>") ctl-x-r-map)
(global-set-key (kbd "<f9>") ctl-x-4-map)
(global-set-key (kbd "<f12>") ctl-x-5-map)
