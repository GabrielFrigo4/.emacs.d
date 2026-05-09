;; ============================================================================
;;  LISP FEATURE
;; ============================================================================

(use-package slime
  :defer t
  :init
  (setq inferior-lisp-program "sbcl")
  :config
  (slime-setup '(slime-fancy)))

(provide 'feature-lisp)
