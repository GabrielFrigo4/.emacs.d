;; ============================================================================
;;  APPLICATIONS FEATURE
;; ============================================================================

(use-package w3m :defer t :ensure t :config (w3m-display-mode 'plain))
(use-package nov :defer t :ensure t :mode ("\\.epub\\'" . nov-mode))

(provide 'feature-apps)
