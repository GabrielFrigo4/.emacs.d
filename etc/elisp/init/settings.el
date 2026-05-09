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

(defalias 'toml-mode 'conf-toml-mode)
(defalias 'bash-mode 'sh-mode)
(defalias 'zsh-mode  'sh-mode)

;; ----------------------------------------------------------------------------
;;  KEYBINDINGS
;; ----------------------------------------------------------------------------

;; Window Management
(global-set-key (kbd "M-]")          'other-window)
(global-set-key (kbd "C-;")          'other-window)
(global-set-key (kbd "C-<tab>")      'other-window)
(global-set-key (kbd "<backtab>")    'other-window)
(global-set-key (kbd "C-M-<up>")     'enlarge-window)
(global-set-key (kbd "C-M-<down>")   'shrink-window)
(global-set-key (kbd "C-M-<right>")  'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<left>")   'shrink-window-horizontally)

;; Buffer Management
(global-set-key (kbd "C-c b e")  'eval-buffer)
(global-set-key (kbd "C-c b k")  'kill-current-buffer)
(global-set-key (kbd "C-c w k")  'kill-buffer-and-window)
(global-set-key (kbd "C-c n")    'kill-nstd-other-buffers)

;; System / Editing
(global-set-key (kbd "<apps>")   'execute-extended-command)
(global-set-key (kbd "<menu>")   'execute-extended-command)
(global-set-key (kbd "C-c i")    'insert-char)
(global-set-key (kbd "M-s q")    'replace-regexp)
(global-set-key (kbd "M-s r")    'replace-string)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Backspace / Delete
(global-set-key (kbd "<backspace>")    'backward-delete-char)
(global-set-key (kbd "S-<backspace>")  'backward-delete-char-untabify)
(global-set-key (kbd "<del>")          'backward-delete-char)
(global-set-key (kbd "S-<del>")        'backward-delete-char-untabify)
(global-set-key (kbd "C-?")            'backward-delete-char)
(global-set-key (kbd "S-C-?")          'backward-delete-char-untabify)

;; Terminals
(global-set-key (kbd "C-c M-t")  'term)
(global-set-key (kbd "C-c M-v")  'vterm)
(global-set-key (kbd "C-c e")    'eshell)
(global-set-key (kbd "C-c C-s")  'shell-command)
(global-set-key (kbd "C-c C-a")  'aweshell-toggle)

;; Multiple Cursors
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>")    'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-<mouse-1>")  'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-c")          'mc/edit-lines)
(global-set-key (kbd "C-S-a")          'mc/mark-all-like-this)
(global-set-key (kbd "C->")            'mc/mark-next-like-this)

(provide 'init-settings)
