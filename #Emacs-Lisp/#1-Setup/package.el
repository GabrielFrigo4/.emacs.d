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
  :quelpa (abc-mode :fetcher github :repo "manateelazycat/aweshell"))
(if-linux
 (use-package vterm
   :ensure t))

;; Install Emacs Regex
(use-package visual-regexp
  :ensure)
(use-package visual-regexp-steroids
  :ensure)

;; Install Emacs Visual Studio
(use-package auto-scroll-bar
  :ensure t
  :config
  (auto-scroll-bar-mode t))

;; Install Which Key
(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-right-bottom)))

;; Install Ace Window
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

;; Install Multiple Cursors
(use-package multiple-cursors
  :ensure t)

;; Install Numbers
(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))

;; Install Delimiters
(use-package rainbow-delimiters
  :ensure
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Install Themes
(use-package dracula-theme
  :ensure t)
(use-package zenburn-theme
  :ensure t)
(use-package doom-themes
  :ensure t)
(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

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

;; Install Arduino IDE
(use-package arduino-cli-mode
  :ensure t
  :custom
  (arduino-cli-warnings 'all)
  (arduino-cli-verify t))

;; Install Slime IDE
(use-package slime
  :ensure t
  :config
  (setq inferior-lisp-program "sbcl"))