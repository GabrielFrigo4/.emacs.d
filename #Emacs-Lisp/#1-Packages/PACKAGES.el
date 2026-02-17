;; ============================================================================
;;  ELPACA BOOTSTRAP
;; ============================================================================


(setq-default elpaca-queue-limit 5)
(setq-default elpaca-log-level 'error)
(setq-default elpaca-lock-file (expand-file-name "elpaca.lock" lock-dir))

(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))

(defvar elpaca-order
  '(elpaca :repo "https://github.com/progfolio/elpaca.git"
           :ref nil
           :depth 1
           :inherit ignore
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
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))

(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode))

(elpaca-wait)


;; ============================================================================
;;  CORE DEPENDENCIES
;; ============================================================================


(use-package compat
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/compat" :branch "master"))

(use-package transient
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/transient" :branch "master"))

(use-package eldoc-box
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/eldoc-box" :branch "master"))

(use-package elenv
  :defer t
  :ensure (:type git :host github :repo "jcs-elpa/elenv" :branch "master"))

(use-package msgu
  :defer t
  :ensure (:type git :host github :repo "jcs-elpa/msgu" :branch "master"))

(use-package dash
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/dash" :branch "master")
  :config
  (global-dash-fontify-mode))

(elpaca-wait)


;; ============================================================================
;;  USER ENVIRONMENT
;; ============================================================================


(use-package no-littering
  :ensure (:type git :host github :repo "emacsmirror/no-littering" :branch "master")
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))


;; ============================================================================
;;  USER INTERFACE
;; ============================================================================


(use-package nerd-icons
  :ensure (:type git :host github :repo "emacsmirror/nerd-icons" :branch "master")
  :custom (nerd-icons-scale-factor 1.2))

(use-package doom-themes
  :ensure (:type git :host github :repo "doomemacs/themes" :branch "master")
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-dark+ t)
  (add-hook 'org-mode-hook #'doom-themes-org-config))

(use-package doom-modeline
  :ensure (:type git :host github :repo "emacsmirror/doom-modeline" :branch "master")
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-icon t)
  (doom-modeline-height 32)
  (doom-modeline-bar-width 4)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (doom-modeline-env-version t)
  (doom-modeline-buffer-encoding t)
  (doom-modeline-indent-info nil)
  (doom-modeline-minor-modes nil))

(use-package dashboard
  :ensure (:type git :host github :repo "emacsmirror/dashboard" :branch "master")
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)))
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner 'logo)
  (add-hook 'dashboard-mode-hook
            (lambda ()
              (setq-local display-line-numbers nil)
              (setq-local display-line-numbers-type nil)
              (display-line-numbers-mode -1))))

(use-package auto-scroll-bar
  :defer t
  :ensure (:type git :host github :repo "emacs-vs/auto-scroll-bar" :branch "master")
  :hook (prog-mode . auto-scroll-bar-mode))

(use-package mixed-pitch
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/mixed-pitch" :branch "master"))

(use-package aweshell
  :defer t
  :commands (aweshell-new aweshell-toggle)
  :ensure (:type git :host github :repo "GabrielFrigo4/aweshell" :branch "master"))

(use-package aweww
  :defer t
  :commands (aweww)
  :ensure (:type git :host github :repo "GabrielFrigo4/aweww" :branch "main"))


;; ============================================================================
;;  TEXT/CODE EDITING
;; ============================================================================


(use-package evil
  :ensure (:type git :host github :repo "emacsmirror/evil" :branch "master")
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-tutor
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/evil-tutor" :branch "master"))

(use-package smartparens
  :ensure (:type git :host github :repo "emacsmirror/smartparens" :branch "master")
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config)
  (setq-default sp-show-pair-from-inside t)
  (setq-default sp-autoskip-closing-pair t)
  (setq-default sp-highlight-pair-overlay nil))

(use-package multiple-cursors
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/multiple-cursors" :branch "master"))


;; ============================================================================
;;  TEXT/CODE HIGHLIGHT
;; ============================================================================


(use-package highlight-numbers
  :ensure (:type git :host github :repo "emacsmirror/highlight-numbers" :branch "master")
  :hook (prog-mode . highlight-numbers-mode))

(use-package rainbow-delimiters
  :ensure (:type git :host github :repo "emacsmirror/rainbow-delimiters" :branch "master")
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package visual-regexp
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/visual-regexp" :branch "master"))

(use-package visual-regexp-steroids
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/visual-regexp-steroids" :branch "master"))


;; ============================================================================
;;  TEXT/CODE NAVIGATION
;; ============================================================================


(use-package goto-chg
  :defer t
  :bind ("C-." . goto-last-change)
  :ensure (:type git :host github :repo "emacsmirror/goto-chg" :branch "master"))

(use-package ace-window
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/ace-window" :branch "master")
  :bind (("M-o" . ace-window)))


;; ============================================================================
;;  TEXT COMPLETION
;; ============================================================================


(use-package vertico
  :ensure (:type git :host github :repo "emacs-straight/vertico" :branch "master")
  :custom
  (vertico-cycle t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-styles '(basic substring partial-completion flex))
  :config
  (vertico-mode))

(use-package company
  :ensure (:type git :host github :repo "emacs-straight/company" :branch "master")
  :hook (after-init . global-company-mode)
  :config
  (setq-default company-minimum-prefix-length 3)
  (setq-default company-dabbrev-downcase 0)
  (setq-default company-idle-delay
                (lambda ()
                  (if (company-in-string-or-comment) nil 2.0))))

(use-package consult
  :ensure (:type git :host github :repo "emacsmirror/consult" :branch "master")
  :defer t
  :bind
  (("C-c f" . consult-fd)
   ("C-c h" . (lambda () (interactive) (consult-fd default-directory)))))


;; ============================================================================
;;  FILE MANAGEMENT
;; ============================================================================


(use-package dired
  :ensure nil
  :defer t
  :custom
  (dired-listing-switches "-agho --group-directories-first")
  :config
  (with-eval-after-load 'evil
    (evil-define-key 'normal dired-mode-map
      (kbd "h") 'dired-up-directory
      (kbd "l") 'dired-find-file)))

(use-package treemacs-nerd-icons
  :ensure (:type git :host github :repo "emacsmirror/treemacs-nerd-icons" :branch "master"))

(use-package lsp-treemacs
  :ensure (:type git :host github :repo "emacsmirror/lsp-treemacs" :branch "master")
  :after (lsp-mode treemacs)
  :config
  (lsp-treemacs-sync-mode 1))

(use-package treemacs
  :ensure (:type git :host github :repo "emacsmirror/treemacs" :branch "master")
  :defer t
  :bind
  (("C-\\" . treemacs)
   ("M-\\" . treemacs)
   ("C-c t" . treemacs))
  :config
  (treemacs-follow-mode 1)
  (treemacs-filewatch-mode 1)
  (treemacs-fringe-indicator-mode 'always))

(use-package treemacs-evil
  :ensure (:type git :host github :repo "emacsmirror/treemacs" :branch "master")
  :after (treemacs evil))

(use-package treemacs-icons-dired
  :ensure (:type git :host github :repo "emacsmirror/treemacs" :branch "master")
  :hook (dired-mode . treemacs-icons-dired-mode))

(use-package treemacs-magit
  :ensure (:type git :host github :repo "emacsmirror/treemacs" :branch "master")
  :after (treemacs magit))


;; ============================================================================
;;  DEVELOPMENT TOOLS
;; ============================================================================


(use-package magit
  :ensure (:type git :host github :repo "emacsmirror/magit" :branch "master")
  :defer t
  :bind ("C-x g" . magit-status)
  :config
  (setq-default magit-git-executable "git")
  (setq-default magit-debug-git-executable "git"))

(use-package pyvenv
  :ensure (:type git :host github :repo "emacsmirror/pyvenv" :branch "master")
  :defer t
  :hook (python-mode . pyvenv-mode))

(use-package jupyter
  :ensure (:type git :host github :repo "emacsmirror/jupyter" :branch "master")
  :defer t)

(use-package ob-async
  :ensure (:type git :host github :repo "emacsmirror/ob-async" :branch "master")
  :defer t)

(when-linux
 (use-package vterm
   :ensure (:type git :host github :repo "emacsmirror/vterm" :branch "master")
   :defer t
   :bind ("C-c v" . vterm)))


;; ============================================================================
;;  ORG MODE
;; ============================================================================


(use-package org
  :ensure nil)

(use-package org-modern
  :ensure (:type git :host github :repo "emacs-straight/org-modern" :branch "master")
  :hook (org-mode . org-modern-mode)
  :init
  (setq-default org-modern-fold-stars
                '(("▶" . "▼") ("▷" . "▽") ("►" . "◆") ("▻" . "◇") ("▸" . "▾") ("▹" . "▿"))))

(use-package org-superstar
  :ensure (:type git :host github :repo "emacsmirror/org-superstar" :branch "master")
  :hook (org-mode . org-superstar-mode))

(use-package ob-mermaid
  :ensure (:type git :host github :repo "emacsmirror/ob-mermaid" :branch "master")
  :after org
  :config
  (setq ob-mermaid-cli-path "mmdc"))

(use-package org-ai
  :ensure (:type git :host github :repo "rksm/org-ai" :branch "master")
  :after (org llm)
  :hook (org-mode . org-ai-mode)
  :config
  (setq-default org-ai-default-chat-system-prompt
                "Act like a wizard that can only generate raw text. Your response should not contain any Markdown formatting. I need to copy and paste your output into a plain text editor without losing any information.")
  (setq-default org-ai-default-inject-sys-prompt-for-all-messages t)
  (setq-default org-ai-default-chat-model llm-google-model))


;; ============================================================================
;;  MARKDOWN MODE
;; ============================================================================


(use-package markdown-mode
  :ensure (:type git :host github :repo "emacsmirror/markdown-mode" :branch "master")
  :init
  (setq-default markdown-command "multimarkdown")
  :config
  (setq-default markdown-enable-math t)
  (setq markdown-fontify-code-blocks-natively t)
  (add-to-list 'markdown-code-lang-modes '("mermaid" . mermaid-ts)))

(use-package markdown-ts-mode
  :ensure (:type git :host github :repo "emacsmirror/markdown-ts-mode" :branch "master")
  :mode ("README\\.md\\'" . markdown-ts-mode)
  :mode ("\\.md\\'" . markdown-ts-mode)
  :bind (:map markdown-ts-mode-map
              ("C-c C-e" . markdown-do)))


;; ============================================================================
;;  MERMAID MODE
;; ============================================================================


(use-package markdown-mermaid
  :ensure (:type git :host github :repo "emacsmirror/markdown-mermaid" :branch "master")
  :after markdown-mode
  :bind (:map markdown-mode-map
              ("C-c C-c m" . markdown-mermaid)
              :map markdown-ts-mode-map
              ("C-c C-c m" . markdown-mermaid))
  :config
  (setq markdown-mermaid-command "mmdc"))

(use-package mermaid-mode
  :ensure (:type git :host github :repo "emacsmirror/mermaid-mode" :branch "master")
  :defer t
  :config
  (setq mermaid-mmdc-location "mmdc")
  (setq mermaid-output-format "png"))

(use-package mermaid-ts-mode
  :ensure (:type git :host github :repo "emacsmirror/mermaid-ts-mode" :branch "master")
  :mode ("\\.mermaid\\'" . mermaid-ts-mode)
  :mode ("\\.mmd\\'" . mermaid-ts-mode)
  :config
  (setq mermaid-mmdc-location "mmdc")
  (setq mermaid-output-format "png"))


;; ============================================================================
;;  LLM-AI MODE
;; ============================================================================


(use-package llm
  :ensure (:type git :host github :repo "emacsmirror/llm" :branch "master")
  :defer t
  :config
  (setq-default llm-openai-api-key (auth-source-pick-first-password :host "api.openai.com"))
  (setq-default llm-deepseek-api-key (auth-source-pick-first-password :host "api.deepseek.com"))
  (setq-default llm-google-api-key (auth-source-pick-first-password :host "generativelanguage.googleapis.com"))
  (setq-default llm-google-model "gemini-2.5-flash-lite"))

(use-package gptel
  :ensure (:type git :host github :repo "emacsmirror/gptel" :branch "master")
  :defer t
  :bind
  (("C-c g" . gptel)
   ("C-c RET" . gptel-send)
   ("C-c m" . gptel-select-model))
  :config
  (setq-default chatgpt-backend (gptel-make-openai "ChatGPT" :stream t :key llm-openai-api-key))
  (setq-default deepseek-backend (gptel-make-deepseek "DeepSeek" :stream t :key llm-deepseek-api-key))
  (setq-default gemini-backend (gptel-make-gemini "Gemini" :stream t :key llm-google-api-key))

  (setq-default gptel-model llm-google-model)
  (setq-default gptel-backend gemini-backend)

  (defvar gptel-models '("gemini-2.5-pro" "gemini-2.5-flash" "gemini-2.5-flash-lite")
    "Models List for GPTEL")

  (defun gptel-select-model ()
    "Interactively select a model to use with GPTEL"
    (interactive)
    (let ((selected-model (completing-read "Select the Model: " gptel-models nil t nil nil (symbol-name gptel-model))))
      (if (and selected-model (not (string-empty-p selected-model)))
          (progn
            (setq gptel-model (intern selected-model))
            (message "gptel-model defined as: %s" gptel-model))
        (message "Model selection canceled.")))))


;; ============================================================================
;;  PROGRAMMING LANGUAGES
;; ============================================================================


(use-package rust-mode
  :ensure (:type git :host github :repo "emacsmirror/rust-mode" :branch "master")
  :config (setq-default rust-mode-treesitter-derive t)
  :bind (("C-c r f" . rust-format-buffer)))

(use-package zig-mode
  :ensure (:type git :host github :repo "emacsmirror/zig-mode" :branch "master"))

(use-package haskell-mode
  :ensure (:type git :host github :repo "emacsmirror/haskell-mode" :branch "master"))

(use-package ada-mode
  :ensure (:type git :host github :repo "emacsmirror/ada-mode" :branch "master"))

(use-package lua-mode
  :ensure (:type git :host github :repo "emacsmirror/lua-mode" :branch "master"))

(use-package elixir-mode
  :ensure (:type git :host github :repo "emacsmirror/elixir-mode" :branch "master"))

(use-package js2-mode
  :ensure (:type git :host github :repo "emacsmirror/js2-mode" :branch "master"))

(use-package typescript-mode
  :ensure (:type git :host github :repo "emacsmirror/typescript-mode" :branch "master"))

(use-package php-mode
  :ensure (:type git :host github :repo "emacsmirror/php-mode" :branch "master"))

(use-package fasm-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/fasm-mode" :branch "main"))

(use-package nasm-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/nasm-mode" :branch "master"))

(use-package riscv-mode
  :ensure (:type git :host github :repo "emacsmirror/riscv-mode" :branch "master"))

(use-package cuda-mode
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/cuda-mode" :branch "master"))

(use-package opencl-c-mode
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/opencl-c-mode" :branch "master"))

(use-package glsl-mode
  :ensure (:type git :host github :repo "emacsmirror/glsl-mode" :branch "master")
  :config
	(require 'treesit)
	(require 'c-ts-mode))

(use-package json-mode
  :ensure (:type git :host github :repo "emacsmirror/json-mode" :branch "master"))

(use-package yaml-mode
  :ensure (:type git :host github :repo "emacsmirror/yaml-mode" :branch "master"))

(use-package dockerfile-mode
  :ensure (:type git :host github :repo "emacsmirror/dockerfile-mode" :branch "master"))

(use-package vimrc-mode
  :ensure (:type git :host github :repo "emacsmirror/vimrc-mode" :branch "master"))

(use-package emacs-lisp-ts-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/emacs-lisp-ts-mode" :branch "main"))

(use-package common-lisp-ts-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/common-lisp-ts-mode" :branch "main"))

(use-package zig-ts-mode
  :ensure (:type git :host github :repo "emacsmirror/zig-ts-mode" :branch "master"))

(use-package haskell-ts-mode
  :ensure (:type git :host github :repo "emacsmirror/haskell-ts-mode" :branch "master"))


;; ============================================================================
;;  PROGRAMMING FRAMEWORKS
;; ============================================================================


(use-package slime
  :defer t
  :ensure (:type git :host github :repo "slime/slime" :branch "master")
  :init
  (setq-default inferior-lisp-program "sbcl")
  :config
  (slime-setup '(slime-fancy)))


;; ============================================================================
;;  APPLICATIONS (WEB, PDF, LATEX)
;; ============================================================================


(use-package shr-tag-pre-highlight
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/shr-tag-pre-highlight" :branch "master"))

(use-package shrface
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/shrface" :branch "master")
  :config
  (setq-default shrface-toggle-bullets nil)
  (setq-default shrface-href-versatile t)
  (shrface-basic))

(use-package w3m
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/w3m" :branch "master")
  :config
  (w3m-display-mode 'plain))

(use-package nov
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/nov" :branch "master")
  :mode ("\\.epub\\'" . nov-mode))

(use-package cdlatex
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/cdlatex" :branch "master"))

(use-package auctex
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/auctex" :branch "master")
  :hook (LaTeX-mode . TeX-source-correlate-mode)
  :hook (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
  :config
  (setq-default TeX-parse-self nil)
  (setq-default TeX-save-parse nil)
  (setq-default TeX-save-query nil)
  (setq-default TeX-auto-save nil)
  (setq-default TeX-master t)
  (setq-default TeX-output-dir (expand-file-name "emacs-tex-out" temporary-file-directory))
  (setq-default TeX-PDF-mode -1)
  (setq-default TeX-view-program-selection '((output-pdf "PDF Tools")))
  (setq-default TeX-source-correlate-method 'synctex))

(use-package pdf-tools
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/pdf-tools" :branch "master")
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (when-windows
   (setq-default pdf-tools-msys2-directory "C:/msys64"))
  (setq-default pdf-view-use-scaling nil)
  (setq-default pdf-view-image-relief 2)
  (setq-default pdf-view-use-imagemagick t)
  (defadvice pdf-cache--prefetch-start (around suppress-timer activate)
    (cancel-function-timers 'pdf-cache--prefetch-start))
  :hook
  (pdf-view-mode . (lambda ()
                     (display-line-numbers-mode -1)
                     (pdf-view-midnight-minor-mode 1))))


;; ============================================================================
;;  FINALIZATION
;; ============================================================================


(elpaca-wait)

(unless (file-exists-p elpaca-lock-file)
  (elpaca-write-lock-file elpaca-lock-file))
