;; ============================================================================
;;  APPLICATIONS FEATURE
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

(use-package w3m :defer t :ensure t :config (w3m-display-mode 'plain))
(use-package nov :defer t :ensure t :mode ("\\.epub\\'" . nov-mode))

(provide 'feature-apps)
