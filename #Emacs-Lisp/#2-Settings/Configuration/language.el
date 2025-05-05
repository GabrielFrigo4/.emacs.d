;; ################
;; # Language
;; ################


;; Set *font-lock* to Maximun Decoration
(setq-default font-lock-maximum-decoration 't)

;; Set *prog-mode*
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)

;; Set *cc-mode*
(setq-default c-ts-mode-indent-offset tab-width)
(setq-default c-ts-mode-indent-style 'bsd)
(setq-default c-basic-offset tab-width)
(setq-default c-default-style "bsd")

;; Set *ruby-mode*
(setq-default ruby-indent-tabs-mode t)
(setq-default ruby-indent-level tab-width)

;; Set *sgml-mode*
(setq-default sgml-basic-offset tab-width)

;; Set *bash-mode*
(setq-default sh-basic-offset tab-width)

;; Set *perl-mode*
(setq-default cperl-indent-level tab-width)

;; Set *rust-mode*
(setq-default rust-ident-offset tab-width)
(setq-default rust-format-on-save t)

;; Set *go-mode*
(add-to-list 'auto-mode-alist '("\\go.mod\\'" . go-mod-ts-mode))

;; Set *asm-mode*
(add-to-list 'auto-mode-alist '("\\.s\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.i\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.S\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.I\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.masm\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.minc\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.x86\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.x64\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.xinc\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.arm\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.ainc\\'" . asm-mode))

;; Set *fasm-mode*
(setq-default fasm-basic-offset tab-width)
(add-to-list 'auto-mode-alist '("\\.fasm\\'" . fasm-mode))
(add-to-list 'auto-mode-alist '("\\.finc\'" . fasm-mode))

;; Set *nasm-mode*
(setq-default nasm-basic-offset tab-width)
(add-to-list 'auto-mode-alist '("\\.nasm\\'" . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.ninc\\'" . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . nasm-mode))

;; Set *riscv-mode*
(add-to-list 'auto-mode-alist '("\\.riscv\\'" . riscv-mode))
(add-to-list 'auto-mode-alist '("\\.rinc\\'" . riscv-mode))

;; Set *python-mode*
(setq-default python-indent-guess-indent-offset t)
(setq-default python-indent-guess-indent-offset-verbose nil)
(setq-default python-indent-offset tab-width)


;; ################
;; # Prog Mode
;; ################


;; Add Hook *prog-mode-hook*
(add-hook 'prog-mode-hook 'superword-mode)
(add-hook 'prog-mode-hook
          (lambda ()
            (setq-local tab-width 4)
            (setq-local indent-tabs-mode t)
            (set-default 'truncate-lines t)
            (highlight-numbers-mode t)))


;; ################
;; # Lang Modes
;; ################


;; Add Hook *python-mode-hook*
(add-hook 'python-mode-hook
          (lambda ()
            (setq-local tab-width 4)
            (setq-local indent-tabs-mode t)
            (setq-local python-indent-offset tab-width)))

;; Add Hook *lua-mode-hook*
(add-hook 'lua-mode-hook
          (lambda ()
            (setq-local tab-width 4)
            (setq-local indent-tabs-mode t)
            (setq-local lua-indent-level tab-width)))

;; Add Hook *emacs-lisp-mode-hook*
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq-local tab-width 2)
            (setq-local indent-tabs-mode nil)))

;; Add Hook *asm-mode-hook*
(add-hook 'asm-mode-hook
          (lambda ()
            "Add support for multiple comment styles in `asm-mode`."
            ;; Add line comment characters ; and #
            (modify-syntax-entry ?; "< b" asm-mode-syntax-table)
            (modify-syntax-entry ?# "< b" asm-mode-syntax-table)
            (modify-syntax-entry ?\n "> b" asm-mode-syntax-table)

            ;; Setup block comment delimiters /* ... */
            (modify-syntax-entry ?/ ". 124b" asm-mode-syntax-table)
            (modify-syntax-entry ?* ". 23" asm-mode-syntax-table)

            ;; Use syntax-propertize-function to recognize //
            (setq-local syntax-propertize-function
                        (syntax-propertize-rules
                         ("\\(//\\)" (1 "< b"))))

            ;; Set comment vars so M-; works
            (setq-local comment-start "; ")
            (setq-local comment-end "")
            (setq-local comment-start-skip "\\(?:/\\*+\\|//+\\|;+\\|#+\\)[ \t]*")))


;; ################
;; # Treesit Modes
;; ################


;; Add Hook *python-mode-hook*
(add-hook 'python-ts-mode-hook
          (lambda ()
            (setq-local tab-width 4)
            (setq-local indent-tabs-mode t)
            (setq-local python-indent-offset tab-width)))

;; Add Hook *lua-mode-hook*
(add-hook 'lua-ts-mode-hook
          (lambda ()
            (setq-local tab-width 4)
            (setq-local indent-tabs-mode t)
            (setq-local lua-indent-level tab-width)))

;; Add Hook *emacs-lisp-mode-hook*
(add-hook 'emacs-lisp-ts-mode-hook
          (lambda ()
            (setq-local tab-width 2)
            (setq-local indent-tabs-mode nil)))


;; ################
;; # Alias
;; ################


;; conf-toml-mode
(defalias 'toml-mode 'conf-toml-mode)

;; sh-mode
(defalias 'bash-mode 'sh-mode)
(defalias 'zsh-mode 'sh-mode)
