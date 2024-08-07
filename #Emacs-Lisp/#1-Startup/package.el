;; ################
;; # Packages
;; ################


;; Install Emacs Libs
(use-package parent-mode
  :ensure t)

;; Install Numbers
(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

;; Install Lang-Mode
(use-package rust-mode
  :ensure t
  :config
  (setq rust-mode-treesitter-derive t))
(use-package zig-mode
  :ensure t)
(use-package lua-mode
  :ensure t)
  (use-package nasm-mode
  :ensure t)
(use-package riscv-mode
  :ensure t)

;; Install SLIME IDE
(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl"))

;; Install NeoTree
(use-package all-the-icons
  :ensure t)
(use-package neotree
  :ensure t
  :bind ("C-," . 'neotree-toggle)
  :bind ("C-\\" . 'neotree-toggle)
  :bind ("M-[" . 'neotree-toggle)
  :init
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq-default neo-show-hidden-files t)
    ))

;; Install Emacs Theme
(use-package dracula-theme
  :ensure t)
(use-package zenburn-theme
  :ensure t)
(use-package doom-themes
  :ensure t)
(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

;; Install Emacs Auto-Completion
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (progn
    (setq company-minimum-prefix-length 3)
    (setq company-dabbrev-downcase 0)
    (setq company-idle-delay
      (lambda () (if (company-in-string-or-comment) nil 0.9)))
    ))
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
