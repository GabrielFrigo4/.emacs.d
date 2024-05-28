;; ################
;; # Emacs Lisp
;; ################

(setq static-elisp-keywords
	  '(("setq-default" . font-lock-keyword-face)
		("setq-local" . font-lock-keyword-face)
		("setq" . font-lock-keyword-face)

		("\\<\\(t\\|nil\\)\\>" . font-lock-variable-name-face)
		("gc-cons-threshold" . font-lock-variable-name-face)
		("most-positive-fixnum" . font-lock-variable-name-face)
		("initial-major-mode" . font-lock-variable-name-face)
		("fundamental-mode" . font-lock-variable-name-face)
		("initial-scratch-message" . font-lock-variable-name-face)
		("relative" . font-lock-variable-name-face)
		("package-enable-at-startup" . font-lock-variable-name-face)
		("package-archives" . font-lock-variable-name-face)
		("load-path" . font-lock-variable-name-face)

		("emacs-lisp-mode" . font-lock-variable-name-face)
		("c-mode" . font-lock-variable-name-face)
		("c\\+\\+-mode" . font-lock-variable-name-face)
		("asm-mode" . font-lock-variable-name-face)

		("\\<\\(concat\\|getenv\\|cons\\)\\>" . font-lock-function-name-face)
		("\\<\\(default\\|load\\|mapc\\|expt\\)\\>" . font-lock-function-name-face)
		("\\<\\(add-hook\\|add-to-list\\)\\>" . font-lock-function-name-face)
		("font-lock-add-keywords" . font-lock-function-name-face)
		("file-expand-wildcards" . font-lock-function-name-face)
		("byte-recompile-directory" . font-lock-function-name-face)
		("custom-set-variables" . font-lock-function-name-face)
		("custom-set-faces" . font-lock-function-name-face)
		("package-installed-p" . font-lock-function-name-face)
		("package-initialize" . font-lock-function-name-face)
		("package-install" . font-lock-function-name-face)
		("package-selected-packages" . font-lock-function-name-face)
		("package-resfresh-contents" . font-lock-function-name-face)
		("custom-enabled-themes" . font-lock-function-name-face)
		("expand-file-name" . font-lock-function-name-face)
		("column-number-mode" . font-lock-function-name-face)
		("display-battery-mode" . font-lock-function-name-face)
		("display-line-numbers-type" . font-lock-function-name-face)
		("display-time-mode" . font-lock-function-name-face)
		("global-display-line-numbers-mode" . font-lock-function-name-face)
		("inhibit-startup-screen" . font-lock-function-name-face)
		("size-indication-mode" . font-lock-function-name-face)
		("tool-bar-mode" . font-lock-function-name-face)
		("xterm-mouse-mode" . font-lock-function-name-face)))

(setq custom-elisp-keywords
	  '(("treesit-auto" . font-lock-function-name-face)
		("highlight-numbers-mode" . font-lock-function-name-face)))

(font-lock-add-keywords
 'emacs-lisp-mode
 static-elisp-keywords)

(font-lock-add-keywords
 'emacs-lisp-mode
 custom-elisp-keywords)
