;; ============================================================================
;;  MARKDOWN FEATURE
;; ============================================================================

(use-package markdown-mode
  :ensure t
  :init (setq-default markdown-command "multimarkdown")
  :hook (markdown-mode . apheleia-mode)
  :config
  (setq-default markdown-enable-math t)
  (setq markdown-fontify-code-blocks-natively t)
  (add-to-list 'markdown-code-lang-modes '("mermaid" . mermaid-ts)))

(use-package markdown-ts-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-ts-mode)
  :hook (markdown-ts-mode . apheleia-mode)
  :bind (:map markdown-ts-mode-map ("C-c C-e" . markdown-do)))

;; ============================================================================
;;  MERMAID FEATURE
;; ============================================================================

(use-package mermaid-mode :ensure t :config (setq mermaid-output-format "png"))
(use-package mermaid-ts-mode :ensure t :mode ("\\.mermaid\\'" . mermaid-ts-mode))

(provide 'feature-markdown)
