;;################
;; Packages
;;################


;; Install Treesit-Auto
(unless (package-installed-p 'treesit-auto)
  (package-install 'treesit-auto))

;; Install Global Packages
(use-package nasm-mode
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package lua-mode
  :ensure t)
(use-package treesit-auto
  :custom
  (treesit-auto-install 't)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
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

;; Install Linux Packages
(when (eq system-type 'gnu/linux)
  (use-package all-the-icons
	:ensure t)
  (use-package neotree
    :ensure t
    :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    :bind ("C-\\" . 'neotree-toggle))
  )

;; Install Windows Packages
(when (eq system-type 'windows-nt)
  (use-package neotree
    :ensure t
    :config (setq neo-theme (if (display-graphic-p) 'arrow))
    :bind ("C-\\" . 'neotree-toggle))
)

;; Settings Packages
(setq-default neo-show-hidden-files t)
