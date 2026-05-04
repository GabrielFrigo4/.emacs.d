;; ============================================================================
;;  INDENTATION DEFAULTS
;; ============================================================================


(setq-default tab-width 4)
(setq-default indent-tabs-mode 1)

(setq-default c-basic-offset 4)
(setq-default c-default-style "bsd")

(setq-default ruby-indent-level 4)
(setq-default sgml-basic-offset 4)
(setq-default sh-basic-offset 4)
(setq-default cperl-indent-level 4)

(setq-default js-indent-level 4)
(setq-default js2-basic-offset 4)
(setq-default typescript-indent-level 4)

(setq-default rust-indent-offset 4)
(setq-default rust-format-on-save t)

(setq-default python-indent-offset 4)
(setq-default lua-indent-level 4)


;; ============================================================================
;;  TREESITTER SPECIFICS
;; ============================================================================


(setq-default c-ts-mode-indent-offset 4)
(setq-default c-ts-mode-indent-style 'bsd)
(setq-default python-indent-guess-indent-offset t)


;; ============================================================================
;;  FILE ASSOCIATIONS
;; ============================================================================


(dolist (ext '("\\.s\\'" "\\.i\\'" "\\.S\\'" "\\.I\\'" "\\.masm\\'" 
               "\\.minc\\'" "\\.x86\\'" "\\.x64\\'" "\\.xinc\\'" 
               "\\.arm\\'" "\\.ainc\\'"))
  (add-to-list 'auto-mode-alist (cons ext 'asm-mode)))

(add-to-list 'auto-mode-alist '("\\.fasm\\'"  . fasm-mode))
(add-to-list 'auto-mode-alist '("\\.finc\\'"  . fasm-mode))
(add-to-list 'auto-mode-alist '("\\.nasm\\'"  . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.asm\\'"   . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'"   . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.riscv\\'" . riscv-mode))

(add-to-list 'auto-mode-alist '("\\go.mod\\'" . go-mod-ts-mode))


;; ============================================================================
;;  LANGUAGE COMMON HOOKS
;; ============================================================================


(defun my-prog-mode-setup ()
  "Settings applicable to all programming modes."
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode 1)
  (setq-local truncate-lines t)
  (superword-mode 1)
  (when (fboundp 'highlight-numbers-mode)
    (highlight-numbers-mode 1)))

(add-hook 'prog-mode-hook #'my-prog-mode-setup)


;; ============================================================================
;;  LANGUAGE SPECIFIC HOOKS
;; ============================================================================


(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq-local tab-width 2
                        indent-tabs-mode -1)))

(add-hook 'emacs-lisp-ts-mode-hook
          (lambda ()
            (setq-local tab-width 2
                        indent-tabs-mode -1)))

(add-hook 'asm-mode-hook
          (lambda ()
            (setq-local comment-start "; ")
            (modify-syntax-entry ?\; "< b" asm-mode-syntax-table)
            (modify-syntax-entry ?# "< b" asm-mode-syntax-table)
            (modify-syntax-entry ?\n "> b" asm-mode-syntax-table)))

(add-hook 'nasm-mode-hook
          (lambda ()
            (setq-local comment-start "; ")))

(add-hook 'fasm-mode-hook
          (lambda ()
            (setq-local comment-start "; ")))


;; ============================================================================
;;  ALIASES
;; ============================================================================


(defalias 'toml-mode 'conf-toml-mode)
(defalias 'bash-mode 'sh-mode)
(defalias 'zsh-mode  'sh-mode)
