;; ################
;; # Packages
;; ################


;; Install Lang-Mode
(use-package nasm-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.nasm\\'" . nasm-mode))
  (add-to-list 'auto-mode-alist '("\\.ninc\\'" . nasm-mode))
  (add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
  (add-to-list 'auto-mode-alist '("\\.inc\\'" . nasm-mode)))
(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t))
(use-package lua-mode
  :ensure t)

;; Install NeoTree
(use-package all-the-icons
  :ensure t)
(use-package neotree
  :ensure t
  :init (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind ("C-\\" . 'neotree-toggle))

;; Install Treesit-Auto
(unless (package-installed-p 'treesit-auto)
  (package-install 'treesit-auto))
(use-package treesit-auto
  :custom
  (treesit-auto-install 't)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Emacs Tools
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
