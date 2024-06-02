;; ################
;; # Settings
;; ################


;; Remove backup files
(setq-default make-backup-files nil)

;; Set default tab-width
(setq-default tab-width 4)

;; Set font-lock to maximun decoration
(setq-default font-lock-maximum-decoration t)

;; Set default to UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)


;; ################
;; # Languages
;; ################


;; Set *cc-mode*
(setq-default indent-tabs-mode t)
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
(add-to-list 'auto-mode-alist '("\\.riscv\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.rinc\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.arm\\'" . asm-mode))
(add-to-list 'auto-mode-alist '("\\.ainc\\'" . asm-mode))

;; Set *nasm-mode*
(setq-default nasm-basic-offset tab-width)
(add-to-list 'auto-mode-alist '("\\.nasm\\'" . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.ninc\\'" . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.asm\\'" . nasm-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . nasm-mode))

;; Set *python-mode*
(setq-default python-indent-guess-indent-offset t)
(setq-default python-indent-guess-indent-offset-verbose nil)
(setq-default python-indent-offset tab-width)


;; ################
;; # Org-Mode
;; ################


;; Shift Selection
(setq-default org-support-shift-select t)

;; Fontify Code in Code Blocks
(setq-default org-src-fontify-natively t)

;; Set Org-Mode Indentation
(setq-default org-src-preserve-indentation t)

;; Org-Mode Theme Definitions
(defface org-block-begin-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the begin of source blocks.")
(defface org-block
  '((t (:background "#3A3938" :extend t)))
  "Face used for the source block background.")
(defface org-block-end-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the end of source blocks.")
