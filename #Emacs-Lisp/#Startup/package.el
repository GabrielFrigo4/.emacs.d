;; ################
;; # Packages
;; ################


;; Install Emacs Libs
(use-package parent-mode
  :ensure t)

;; Install Numbers
(use-package highlight-numbers
  :ensure t)

;; Install Lang-Mode
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
  :bind ("C-\\" . 'neotree-toggle)
  :init
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq-default neo-show-hidden-files t)
    ))

;; Install Emacs Theme
(use-package dracula-theme
  :ensure t)

;; Install Emacs Auto-Completion
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :custom
  (company-idle-delay 0))
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :init
  (vertico-mode))

;; Install Emacs Tools
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
