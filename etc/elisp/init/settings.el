;; ============================================================================
;;  GENERAL SETTINGS
;; ============================================================================

;; ----------------------------------------------------------------------------
;;  ENVIRONMENT
;; ----------------------------------------------------------------------------

(use-package no-littering
  :ensure (:type git :host github :repo "emacsmirror/no-littering" :branch "master")
  :config
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

;; ----------------------------------------------------------------------------
;;  PERFORMANCE
;; ----------------------------------------------------------------------------

(global-font-lock-mode 1)
(setq-default blink-cursor-interval 0.5)
(setq-default visible-bell t)
(setq-default inhibit-compacting-font-caches t)
(setq-default truncate-lines nil)
(setq-default make-backup-files nil)
(setq-default create-lockfiles nil)
(setq-default max-image-size (expt 2 24))
(setq-default image-cache-eviction-delay (expt 2 8))
(setq-default async-shell-command-buffer 'new-buffer)

(global-auto-revert-mode 1)
(setq-default global-auto-revert-non-file-buffers t)

(if-darwin
 (setq-default mac-command-modifier 'meta
               mac-option-modifier 'super))

(when (fboundp 'global-completion-preview-mode)
  (global-completion-preview-mode 1))

;; ----------------------------------------------------------------------------
;;  PROGRAMMING
;; ----------------------------------------------------------------------------

(defun my-prog-mode-setup ()
  "Settings applicable to all programming modes."
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode 1)
  (setq-local truncate-lines t)
  (superword-mode 1)
  (when (fboundp 'highlight-numbers-mode)
    (highlight-numbers-mode 1))
  (visual-line-mode -1))

(add-hook 'prog-mode-hook #'my-prog-mode-setup)

(add-hook 'emacs-lisp-mode-hook (lambda () (setq-local tab-width 2 indent-tabs-mode -1)))
(add-hook 'emacs-lisp-ts-mode-hook (lambda () (setq-local tab-width 2 indent-tabs-mode -1)))

(add-hook 'asm-mode-hook
          (lambda ()
            (setq-local comment-start "; ")
            (modify-syntax-entry ?\; "< b" asm-mode-syntax-table)
            (modify-syntax-entry ?# "< b" asm-mode-syntax-table)
            (modify-syntax-entry ?\n "> b" asm-mode-syntax-table)))

(add-hook 'nasm-mode-hook (lambda () (setq-local comment-start "; ")))
(add-hook 'fasm-mode-hook (lambda () (setq-local comment-start "; ")))

(provide 'init-settings)
