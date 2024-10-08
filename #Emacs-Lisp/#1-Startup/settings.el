;; ################
;; # Settings
;; ################


;; Set cursor blink time
(setq blink-cursor-interval 0.5)

;; Disable the beep on Windows
(setq-default visible-bell t)

;; Remove backup files
(setq-default make-backup-files nil)

;; Set default tab-width
(setq-default tab-width 4)

;; Set font-lock to maximun decoration
(setq-default font-lock-maximum-decoration '((c++-mode . 2) (t . t)))

;; Set default to UTF-8 and UTF-16-LE
(if-windows
 (set-default-coding-systems 'utf-16-le)
 (set-default-coding-systems 'utf-8))

;; On OSX, swap Meta and Super
;; For Better Keyboard Ergonomics
(if-darwin
 (setq mac-command-modifier 'meta)
 (setq mac-option-modifier 'super))


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
;; # Org-Mode
;; ################


;; Shift Selection
(setq-default org-support-shift-select t)

;; Fontify Code in Code Blocks
(setq-default org-src-fontify-natively t)

;; Set Org-Mode Indentation
(setq-default org-src-preserve-indentation t)
