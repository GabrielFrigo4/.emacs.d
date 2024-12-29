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
(add-to-list 'auto-mode-alist '("\\.fasm\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.finc\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.masm\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.minc\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.x86\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.x64\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.xinc\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.arm\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.ainc\\'" . asm-mode))

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


;; Def *config-prog-mode-hook*
(defun config-prog-mode-hook ()
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode t)
  (highlight-numbers-mode)
  )

;; Add Hook *prog-mode-hook*
(add-hook 'prog-mode-hook 'superword-mode)
(add-hook 'prog-mode-hook #'config-prog-mode-hook)
