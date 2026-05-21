;; ============================================================================
;;  LIBRARIES FEATURE
;; ============================================================================

(use-package compat :ensure t)
(use-package transient :ensure t)
(use-package eldoc-box :ensure t)
(use-package elenv :ensure (:host github :repo "jcs-elpa/elenv"))
(use-package msgu :ensure (:host github :repo "jcs-elpa/msgu"))
(use-package dash :ensure t :config (global-dash-fontify-mode))
(use-package auto-scroll-bar :hook (prog-mode . auto-scroll-bar-mode) :ensure (:host github :repo "emacs-vs/auto-scroll-bar"))
(use-package mixed-pitch :ensure t)
(use-package goto-chg :ensure t :bind ("C-." . goto-last-change))

(provide 'feature-tools)
