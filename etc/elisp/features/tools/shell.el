;; ============================================================================
;;  SHELL FEATURE
;; ============================================================================

(use-package vterm
  :when (eq system-type 'gnu/linux)
  :ensure (:type git :host github :repo "emacsmirror/vterm" :branch "master")
  :defer t
  :bind ("C-c v" . vterm))

(use-package aweshell
  :defer t
  :commands (aweshell-new aweshell-toggle)
  :ensure (:type git :host github :repo "GabrielFrigo4/aweshell" :branch "master")
  :config
  (setq-default aweshell-validate-executable nil)
  (setq-default aweshell-auto-suggestion-p t)
  (if-windows
      (setq-default aweshell-validate-delay (expt 2 -0.5))
    (setq-default aweshell-validate-delay (expt 2 -1))))

;; Shell Configuration
(when-unix
  (setq-default explicit-shell-file-name "/bin/zsh")
  (setq-default shell-file-name "zsh")
  (setq-default shell-command-switch "-c"))

(when-windows
  (setq-default w3 w32-quote-process-args t))

;; ============================================================================
;;  TERMINAL FEATURE
;; ============================================================================

;; Eshell Configuration
(use-package eshell
  :ensure nil
  :config
  (setq-default epe-git-enable nil)
  (setq-default eshell-bad-command-tolerance (expt 2 64))
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-multiline-with-status "eshell-prompt-extras")
    (setq-default eshell-highlight-prompt t
                  eshell-prompt-function 'epe-theme-multiline-with-status
                  epe-git-dirty-char "*"))

  (defun eshell/clear () (let ((inhibit-read-only t)) (erase-buffer)))
  (defalias 'eshell/clear 'eshell/clear-scrollback)
  (defalias 'eshell/cls   'eshell/clear-scrollback)
  (defalias 'eshell/clr   'eshell/clear-scrollback)
  (defalias 'eshell/where 'eshell/which)
  (defalias 'eshell/wh    'eshell/which)
  (defalias 'eshell/close 'eshell/exit)
  (defalias 'eshell/ex    'eshell/exit)
  (defalias 'eshell/open-file 'find-file)
  (defalias 'eshell/open      'find-file)
  (defalias 'eshell/op        'find-file)
  (defalias 'eshell/buff 'switch-to-buffer)
  (defalias 'eshell/s2b  'switch-to-buffer)
  (defalias 'eshell/sb   'switch-to-buffer))

(provide 'feature-shell)
