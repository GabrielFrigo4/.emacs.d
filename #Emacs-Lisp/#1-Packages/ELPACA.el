;; ################
;; # ELPACA
;; ################


;; Set *elpaca-queue-limit*
(setq-default elpaca-queue-limit 16)

;; Setup Package Archives (ELPACA)
(defvar elpaca-installer-version 0.11)
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
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
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

;; Install Documentation
(use-package eldoc-box
  :ensure (:type git :host github :repo "emacsmirror/eldoc-box" :branch "master"))

;; Install Emacs Environment
(use-package elenv
  :ensure (:type git :host github :repo "jcs-elpa/elenv" :branch "master"))
(use-package msgu
  :ensure (:type git :host github :repo "jcs-elpa/msgu" :branch "master"))

;; Install Emacs Visual Studio
(use-package auto-scroll-bar
  :ensure (:type git :host github :repo "emacs-vs/auto-scroll-bar" :branch "master")
  :config
  (auto-scroll-bar-mode t))

;; Install Emacs Awesome
(use-package aweshell
  :ensure (:type git :host github :repo "GabrielFrigo4/aweshell" :branch "master"))
(use-package aweww
  :ensure (:type git :host github :repo "GabrielFrigo4/aweww" :branch "main"))

;; Install Emacs Lib
(use-package compat
  :ensure (:type git :host github :repo "emacsmirror/compat" :branch "master"))
(use-package transient
  :ensure (:type git :host github :repo "emacsmirror/transient" :branch "master"))
(use-package parent-mode
  :ensure (:type git :host github :repo "emacsmirror/parent-mode" :branch "master"))
(use-package goto-chg
  :ensure (:type git :host github :repo "emacsmirror/goto-chg" :branch "master"))
(use-package with-editor
  :ensure (:type git :host github :repo "emacsmirror/with-editor" :branch "master"))
(use-package cond-let
  :ensure (:type git :host github :repo "emacsmirror/cond-let" :branch "master"))

;; Install Emacs Async
(use-package async
  :ensure (:type git :host github :repo "emacsmirror/emacs-async" :branch "master"))
(use-package ob-async
  :ensure (:type git :host github :repo "emacsmirror/ob-async" :branch "master"))

;; Install Emacs Themes
(use-package doom-themes
  :ensure (:type git :host github :repo "doomemacs/themes" :branch "master"))

;; Install Emacs Font
(use-package mixed-pitch
  :ensure (:type git :host github :repo "emacsmirror/mixed-pitch" :branch "master"))

;; Install Environment
(use-package pyvenv
  :ensure (:type git :host github :repo "emacsmirror/pyvenv" :branch "master")
  :config
  (pyvenv-mode 1))

;; Install Magit
(use-package magit
  :ensure (:type git :host github :repo "emacsmirror/magit" :branch "master")
  :after (transient)
  :config
  (progn
    (setq-default magit-git-executable "git")
    (setq-default magit-debug-git-executable "git")))

;; Install Evil
(use-package evil
  :ensure (:type git :host github :repo "emacsmirror/evil" :branch "master"))
(use-package evil-tutor
  :ensure (:type git :host github :repo "emacsmirror/evil-tutor" :branch "master"))

;; Install Org
(use-package org-modern
  :ensure (:type git :host github :repo "emacs-straight/org-modern" :branch "master")
  :hook (org-mode . org-modern-mode)
  :init
  (setq-default org-modern-fold-stars '(("▶" . "▼") ("▷" . "▽") ("►" . "◆") ("▻" . "◇") ("▸" . "▾") ("▹" . "▿"))))
(use-package org-superstar
  :ensure (:type git :host github :repo "emacsmirror/org-superstar" :branch "master")
  :hook (org-mode . org-superstar-mode))

;; Install Markdown
(use-package markdown-mode
  :ensure (:type git :host github :repo "emacsmirror/markdown-mode" :branch "master")
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq-default markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

;; Install Jupyter
(use-package jupyter
  :ensure (:type git :host github :repo "emacsmirror/jupyter" :branch "master"))

;; Install TeX / LaTeX
(use-package cdlatex
  :ensure (:type git :host github :repo "emacsmirror/cdlatex" :branch "master"))
(use-package auctex
  :ensure (:type git :host github :repo "emacsmirror/auctex" :branch "master")
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
    ;; Setup Preview PDF
    (setq-default TeX-PDF-mode nil)
    (setq-default TeX-view-program-selection
                  '((output-pdf "PDF Tools")))
    ;; Set Correlate Method for Search
    (setq-default TeX-source-correlate-method 'synctex)))

;; Install Book
(use-package nov
  :ensure (:type git :host github :repo "emacsmirror/nov" :branch "master"))

;; Install PDF
(use-package pdf-tools
  :ensure (:type git :host github :repo "emacsmirror/pdf-tools" :branch "master")
  :config
  (progn
    (pdf-tools-install)
    (setq-default pdf-tools-msys2-directory (concat home-dir "/scoop/apps/msys2/current/"))
    (setq-default pdf-view-use-scaling nil)
    (setq-default pdf-view-image-relief 2)
    (setq-default pdf-view-use-imagemagick t)
    (defadvice pdf-cache--prefetch-start (around suppress-timer activate)
      "Suppress the pdf-cache prefetching timer."
      (cancel-function-timers 'pdf-cache--prefetch-start)))
  :hook
  (pdf-view-mode . (lambda ()
                     (display-line-numbers-mode -1)
                     (pdf-view-midnight-minor-mode t))))

;; Install Web
(use-package shr-tag-pre-highlight
  :ensure (:type git :host github :repo "emacsmirror/shr-tag-pre-highlight" :branch "master"))
(use-package shrface
  :ensure (:type git :host github :repo "emacsmirror/shrface" :branch "master")
  :config
  (progn
    (setq-default shrface-toggle-bullets nil)
    (setq-default shrface-href-versatile t)
    (shrface-basic)))
(use-package w3m
  :ensure (:type git :host github :repo "emacsmirror/w3m" :branch "master")
  :config
  (w3m-display-mode 'plain))

;; Install LLM
(use-package llm
  :ensure (:type git :host github :repo "emacsmirror/llm" :branch "master")
  :config
  (progn
    (setq-default llm-openai-api-key (auth-source-pick-first-password :host "api.openai.com"))
    (setq-default llm-deepseek-api-key (auth-source-pick-first-password :host "api.deepseek.com"))
    (setq-default llm-google-api-key (auth-source-pick-first-password :host "generativelanguage.googleapis.com"))
    (setq-default llm-google-model "gemini-2.5-flash-lite")))
(use-package org-ai
  :ensure (:type git :host github :repo "rksm/org-ai" :branch "master")
  :after (org llm)
  :hook (org-mode . org-ai-mode)
  :config
  (progn
    (setq-default org-ai-default-chat-system-prompt "Act like a wizard that can only generate raw text. Your response should not contain any Markdown formatting. I need to copy and paste your output into a plain text editor without losing any information.")
    (setq-default org-ai-default-inject-sys-prompt-for-all-messages t)
    (setq-default org-ai-default-chat-model llm-google-model)))
(use-package gptel
  :ensure (:type git :host github :repo "emacsmirror/gptel" :branch "master")
  :config
  (progn
    (setq-default chatgpt-backend (gptel-make-openai "ChatGPT"
                                    :stream t
                                    :key llm-openai-api-key))
    (setq-default deepseek-backend (gptel-make-deepseek "DeepSeek"
                                     :stream t
                                     :key llm-deepseek-api-key))
    (setq-default gemini-backend (gptel-make-gemini "Gemini"
                                   :stream t
                                   :key llm-google-api-key))
    (setq-default gptel-model llm-google-model)
    (setq-default gptel-backend gemini-backend)

    (defvar gptel-models
      '("gemini-2.5-pro"
        "gemini-2.5-flash"
        "gemini-2.5-flash-lite")
      "Models List for GPTEL")

    (defun gptel-select-model ()
      "Interactively select a model to use with GPTEL"
      (interactive)
      (let ((selected-model (completing-read "Select the Model: "
                                             gptel-models
                                             nil t nil nil
                                             (symbol-name gptel-model))))
        (if (and selected-model (not (string-empty-p selected-model)))
            (progn
              (setq gptel-model (intern selected-model))
              (message "gptel-model defined as: %s" gptel-model))
          (message "Model selection canceled."))))

    (global-set-key (kbd "C-c g") #'gptel)
    (global-set-key (kbd "C-c m") #'gptel-select-model)))

;; Install Edit
(use-package paredit
  :ensure (:type git :host github :repo "emacsmirror/paredit" :branch "master"))
(use-package smartparens
  :ensure (:type git :host github :repo "emacsmirror/smartparens" :branch "master")
  :hook (prog-mode . smartparens-mode)
  :config
  (progn
    (require 'smartparens-config)
    (setq-default sp-show-pair-from-inside t)
    (setq-default sp-autoskip-closing-pair t)
    (setq-default sp-highlight-pair-overlay nil)))
(use-package dash
  :ensure (:type git :host github :repo "emacsmirror/dash" :branch "master")
  :config
  (global-dash-fontify-mode))

;; Install Window
(use-package ace-window
  :ensure (:type git :host github :repo "emacsmirror/ace-window" :branch "master")
  :bind (("M-o" . ace-window)))

;; Install Cursor
(use-package multiple-cursors
  :ensure (:type git :host github :repo "emacsmirror/multiple-cursors" :branch "master"))

;; Install Terminal
(if-linux
 (use-package vterm
   :ensure (:type git :host github :repo "emacsmirror/vterm" :branch "master")))

;; Install Regex
(use-package visual-regexp
  :ensure (:type git :host github :repo "emacsmirror/visual-regexp" :branch "master"))
(use-package visual-regexp-steroids
  :ensure (:type git :host github :repo "emacsmirror/visual-regexp-steroids" :branch "master"))

;; Install Syntax
(use-package highlight-numbers
  :ensure (:type git :host github :repo "emacsmirror/highlight-numbers" :branch "master")
  :hook (prog-mode . highlight-numbers-mode))
(use-package rainbow-delimiters
  :ensure (:type git :host github :repo "emacsmirror/rainbow-delimiters" :branch "master")
  :hook (prog-mode . rainbow-delimiters-mode))

;; Install Assembly Language
(use-package fasm-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/fasm-mode" :branch "main"))
(use-package nasm-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/nasm-mode" :branch "master"))
(use-package riscv-mode
  :ensure (:type git :host github :repo "emacsmirror/riscv-mode" :branch "master"))

;; Install Programing Language
(use-package rust-mode
  :ensure (:type git :host github :repo "emacsmirror/rust-mode" :branch "master")
  :config
  (setq-default rust-mode-treesitter-derive t)
  :bind
  (("C-c r f" . rust-format-buffer)))
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

;; Install GPU Language
(use-package cuda-mode
  :ensure (:type git :host github :repo "emacsmirror/cuda-mode" :branch "master"))
(use-package opencl-c-mode
  :ensure (:type git :host github :repo "emacsmirror/opencl-c-mode" :branch "master"))
(use-package glsl-mode
  :ensure (:type git :host github :repo "emacsmirror/glsl-mode" :branch "master"))

;; Install Markup Language
(use-package json-mode
  :ensure (:type git :host github :repo "emacsmirror/json-mode" :branch "master"))
(use-package yaml-mode
  :ensure (:type git :host github :repo "emacsmirror/yaml-mode" :branch "master"))

;; Install Build System Language
(use-package dockerfile-mode
  :ensure (:type git :host github :repo "emacsmirror/dockerfile-mode" :branch "master"))
(use-package cmake-mode
  :ensure (:type git :host github :repo "emacsmirror/cmake-mode" :branch "master"))

;; Install Configuration Language
(use-package vimrc-mode
  :ensure (:type git :host github :repo "emacsmirror/vimrc-mode" :branch "master"))

;; Install Treesit Grammar
(use-package emacs-lisp-ts-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/emacs-lisp-ts-mode" :branch "main"))
(use-package common-lisp-ts-mode
  :ensure (:type git :host github :repo "GabrielFrigo4/common-lisp-ts-mode" :branch "main"))
(use-package zig-ts-mode
  :ensure (:type git :host github :repo "emacsmirror/zig-ts-mode" :branch "master"))
(use-package haskell-ts-mode
  :ensure (:type git :host github :repo "emacsmirror/haskell-ts-mode" :branch "master"))

;; Install PlatformIO
(use-package platformio-mode
  :ensure (:type git :host github :repo "emacsmirror/platformio-mode" :branch "master"))

;; Install Slime (Lisp)
(use-package slime
  :ensure (:type git :host github :repo "emacsmirror/slime" :branch "master")
  :init
  (setq-default inferior-lisp-program "sbcl")
  :config
  (slime-setup '(slime-fancy)))

;; Install Consult
(use-package consult
  :ensure (:type git :host github :repo "emacsmirror/consult" :branch "master")
  :bind ("C-c h" .
         (lambda ()
           (interactive)
           (consult-fd default-directory)))
  :bind ("C-c f" . 'consult-fd))

;; Install NeoTree
(use-package all-the-icons
  :ensure (:type git :host github :repo "emacsmirror/all-the-icons" :branch "master"))
(use-package neotree
  :ensure (:type git :host github :repo "emacsmirror/neotree" :branch "master")
  :bind ("C-," . 'neotree-toggle)
  :bind ("C-\\" . 'neotree-toggle)
  :bind ("M-[" . 'neotree-toggle)
  :config
  (progn
    (setq-default neo-theme (if (display-graphic-p) 'icons 'arrow))
    (setq-default neo-show-hidden-files t)))

;; Install Auto-Completion
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
