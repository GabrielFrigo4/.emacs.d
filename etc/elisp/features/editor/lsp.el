;; ============================================================================
;;  LSP FEATURE
;; ============================================================================

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package lsp-mode
  :ensure (:type git :host github :repo "emacs-lsp/lsp-mode" :branch "master")
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)
         (c-ts-mode . lsp-deferred)
         (c++-ts-mode . lsp-deferred)
         (c-or-c++-mode . lsp-deferred)
         (c-or-c++-ts-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (go-ts-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :custom
  (lsp-keymap-prefix "C-c l")
  (lsp-diagnostics-provider :flymake)
  (lsp-clients-clangd-args '("-j=4" "--background-index" "--clang-tidy"))
  :config
  (add-to-list 'lsp-disabled-clients 'semgrep-ls)
  (with-eval-after-load 'flymake
    (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake))

  (defun lsp/go-install-save-hooks ()
    (setq-local apheleia-inhibit t)
    (add-hook 'before-save-hook #'lsp-organize-imports nil t)
    (add-hook 'before-save-hook #'lsp-format-buffer nil t))
  (add-hook 'go-mode-hook #'lsp/go-install-save-hooks)
  (add-hook 'go-ts-mode-hook #'lsp/go-install-save-hooks))

(use-package lsp-ui
  :ensure (:type git :host github :repo "emacs-lsp/lsp-ui" :branch "master")
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure (:type git :host github :repo "emacsmirror/lsp-treemacs" :branch "master")
  :after (lsp-mode treemacs)
  :config (lsp-treemacs-sync-mode 1))

(provide 'feature-lsp)
