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

(use-package nov
  :defer t
  :ensure t
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (setq-default nov-text-width 80)
  
  (defun my-nov-mode-hook ()
    (visual-line-mode 1)
    (display-line-numbers-mode -1)
    (setq-local header-line-format nil))
  
  (add-hook 'nov-mode-hook 'my-nov-mode-hook)
  
  (with-eval-after-load 'nov
    (define-key nov-mode-map (kbd "n") 'nov-next-document)
    (define-key nov-mode-map (kbd "p") 'nov-previous-document)
    (define-key nov-mode-map (kbd "t") 'nov-goto-toc)
    (define-key nov-mode-map (kbd "+") 'text-scale-increase)
    (define-key nov-mode-map (kbd "-") 'text-scale-decrease)
    (define-key nov-mode-map (kbd "0") 'text-scale-adjust)
    (define-key nov-mode-map (kbd "q") 'quit-window)))

(provide 'feature-apps)
