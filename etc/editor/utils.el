;; ============================================================================
;;  UTILITIES FEATURE
;; ============================================================================

(use-package treemacs
  :ensure t :defer t :bind (("C-\\" . treemacs) ("M-\\" . treemacs) ("C-c t" . treemacs))
  :config (treemacs-follow-mode 1) (treemacs-filewatch-mode 1))

(use-package ace-window :ensure t :bind ("M-o" . ace-window))
(use-package highlight-numbers :ensure t :hook (prog-mode . highlight-numbers-mode))
(use-package rainbow-delimiters :ensure t :hook (prog-mode . rainbow-delimiters-mode))

(provide 'feature-utils)
