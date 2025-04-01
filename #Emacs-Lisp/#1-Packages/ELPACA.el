;; ################
;; # ELPACA
;; ################


;; Set *elpaca-queue-limit*
(setq-default elpaca-queue-limit 16)

;; Setup Package Archives (ELPACA)
(defvar elpaca-installer-version 0.10)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Wait (ELPACA)
(elpaca-wait)

;; Install Use-Package (ELPACA)
(elpaca elpaca-use-package
  (elpaca-use-package-mode))

;; Wait (ELPACA)
(elpaca-wait)


;; ################
;; # Packages
;; ################


;; Wait (ELPACA)
(elpaca-wait)

;; Install Emacs Lib
(use-package compat
  :ensure (:type git :host github :repo "emacs-compat/compat"))
(use-package transient
  :ensure t)
(use-package parent-mode
  :ensure t)
(use-package goto-chg
  :ensure t)

;; Install Emacs Async
(use-package async
  :ensure t)
(use-package ob-async
  :ensure t)

;; Install Emacs Font
(use-package mixed-pitch
  :ensure t)

;; Install Emacs Mode
(use-package evil
  :ensure t)
(use-package magit
  :ensure t
  :after (transient))

;; Install Emacs Org
(use-package org-superstar
  :ensure (:type git :host github :repo "integral-dw/org-superstar-mode")
  :config
  (add-hook 'org-mode-hook 'org-superstar-mode))

;; Install Emacs Markdown
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

;; Install Emacs TeX / LaTeX
(use-package cdlatex
  :ensure t)
(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode . TeX-source-correlate-mode)
  :hook (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  :config
  (progn
    ;; Set TeX Settings
    (setq-default TeX-parse-self nil)
    (setq-default TeX-save-parse nil)
    (setq-default TeX-save-query nil)
    (setq-default TeX-auto-save nil)
    (setq-default TeX-master t)
    ;; Set TeX Output Files
    (setq-default TeX-output-dir (expand-file-name "emacs-tex-out" temporary-file-directory))
    ;; Enable PDF Mode by Default
    (setq-default TeX-PDF-mode t)
    (setq-default TeX-view-program-selection '((output-pdf "PDF Tools")))
    ;; Set Correlate Method for Search
    (setq-default TeX-source-correlate-method 'synctex)))

;; Install Emacs PDF
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  :hook
  (pdf-view-mode . (lambda ()
                     (display-line-numbers-mode -1)
                     (pdf-view-midnight-minor-mode t))))

;; Install Emacs Web
(use-package w3m
  :ensure t)

;; Install Emacs Tool
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))
(use-package multiple-cursors
  :ensure t)
(if-linux
 (use-package vterm
   :ensure t))

;; Install Emacs Edit
(use-package paredit
  :ensure t)
(use-package smartparens
  :ensure t
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))
(use-package dash
  :ensure t
  :config
  (global-dash-fontify-mode))

;; Install Emacs Regex
(use-package visual-regexp
  :ensure t)
(use-package visual-regexp-steroids
  :ensure t)

;; Install Emacs Syntax
(use-package highlight-numbers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Install Assembly Language
(use-package riscv-mode
  :ensure t)

;; Install Programing Language
(use-package rust-mode
  :ensure t
  :config
  (setq-default rust-mode-treesitter-derive t)
  :bind
  (("C-c r f" . rust-format-buffer)))
(use-package zig-mode
  :ensure t)
(use-package haskell-mode
  :ensure t)
(use-package lua-mode
  :ensure t)
(use-package elixir-mode
  :ensure t)
(use-package php-mode
  :ensure t)
(use-package vimrc-mode
  :ensure t)

;; Install Treesit Grammar
(use-package zig-ts-mode
  :ensure (:type git :host github :repo "Ziqi-Yang/zig-ts-mode"))
(use-package haskell-ts-mode
  :ensure t)

;; Install Slime (Lisp)
(use-package slime
  :ensure t
  :init
  (setq-default inferior-lisp-program "sbcl")
  :config
  (slime-setup '(slime-fancy)))

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
    (setq-default neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq-default neo-show-hidden-files t)))

;; Install Auto-Completion
(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :config
  (vertico-mode))
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (progn
    (setq-default company-minimum-prefix-length 3)
    (setq-default company-dabbrev-downcase 0)
    (setq-default company-idle-delay
                  (lambda ()
                    (if (company-in-string-or-comment)
                        nil
                      2.0)))))

;; Wait (ELPACA)
(elpaca-wait)
