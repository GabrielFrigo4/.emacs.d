;; ################
;; # Packages
;; ################


;; Install Emacs Libs
(use-package parent-mode
  :ensure t)

;; Install Emacs Term
(use-package xterm-color
  :ensure t)
(use-package eshell-up
  :ensure t)
(use-package eshell-prompt-extras
  :ensure t)
(use-package aweshell
  :elpaca nil
  :ensure t
  :quelpa (abc-mode :fetcher github :repo "manateelazycat/aweshell"))
(if-linux
 (use-package vterm
   :ensure t))

;; Install Emacs Regex
(use-package visual-regexp
  :ensure t)
(use-package visual-regexp-steroids
  :ensure t)

;; Install Emacs Visual Studio
(unless (package-installed-p 'auto-scroll-bar)
  (package-install 'auto-scroll-bar))
(auto-scroll-bar-mode t)

;; Install Emacs Tools
(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-right-bottom)))
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))
(use-package multiple-cursors
  :ensure t)
(elpaca-wait)

;; Install Emacs Syntax
(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Install Themes
(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

;; Install Languages
(use-package rust-mode
  :ensure t
  :config
  (setq rust-mode-treesitter-derive t)
  :bind
  (("C-c r f" . rust-format-buffer)))
(use-package zig-mode
  :ensure t)
(use-package lua-mode
  :ensure t)
(use-package nasm-mode
  :ensure t)
(use-package riscv-mode
  :ensure t)
(use-package vimrc-mode
  :ensure t)
(use-package modern-cpp-font-lock
  :ensure t
  :hook (c++-mode . modern-c++-font-lock-mode))

;; Install Treesit Grammar
(use-package zig-ts-mode
  :ensure t)
(elpaca-wait)

;; Install NeoTree
(use-package all-the-icons
  :ensure t)
(use-package neotree
  :ensure t
  :bind ("C-," . 'neotree-toggle)
  :bind ("C-\\" . 'neotree-toggle)
  :bind ("M-[" . 'neotree-toggle)
  :config
  (progn
    (setq neo-theme 'icons)
    (setq-default neo-show-hidden-files t)))

;; Install Auto-Completion
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (progn
    (setq company-minimum-prefix-length 3)
    (setq company-dabbrev-downcase 0)
    (setq company-idle-delay
          (lambda () (if (company-in-string-or-comment) nil 0.9)))))
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :config
  (vertico-mode))
(elpaca-wait)