;; ################
;; # Emacs Lisp
;; ################

(setq static-elisp-keywords
	  '(;; Keywords
		("setq-default" . font-lock-keyword-face)
		("setq-local" . font-lock-keyword-face)
		("setq" . font-lock-keyword-face)

		;; Emacs Variables
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
		("tab-width" . font-lock-variable-name-face)
		("python-indent" . font-lock-variable-name-face)
		("indent-tabs-mode" . font-lock-variable-name-face)

		;; Emacs Style Variables
		("font-lock-keyword-face" . font-lock-variable-name-face)
		("font-lock-variable-name-face" . font-lock-variable-name-face)
		("font-lock-function-name-face" . font-lock-variable-name-face)
		("font-lock-constant-face" . font-lock-variable-name-face)
		("font-lock-type-face" . font-lock-variable-name-face)

		;; Emacs Functions

		;; Emacs Mode
		("emacs-lisp-mode" . font-lock-variable-name-face)
		("c-mode" . font-lock-variable-name-face)
		("c\\+\\+-mode" . font-lock-variable-name-face)
		("asm-mode" . font-lock-variable-name-face)

		;; Emacs Mode Hook
		("prog-mode-hook" . font-lock-variable-name-face)
		("python-mode-hook" . font-lock-variable-name-face)

	    ;; Basic Functions
		("\\<\\(concat\\|getenv\\|cons\\)\\>" . font-lock-function-name-face)
		("\\<\\(default\\|load\\|mapc\\|expt\\)\\>" . font-lock-function-name-face)
		("\\<\\(add-hook\\|add-to-list\\)\\>" . font-lock-function-name-face)

		;; Emacs Functions
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
	  '(;; Custom Keywords Variables
		("static-elisp-keywords" . font-lock-variable-name-face)
		("custom-elisp-keywords" . font-lock-variable-name-face)
		("custom-c-and-c\\+\\+-keywords" . font-lock-variable-name-face)

		;; Custom Mode Hook
		("custom-prog-mode-hook" . font-lock-function-name-face)
		("custom-python-mode-hook" . font-lock-function-name-face)

		;; TreeSitter Auto
		("treesit-auto" . font-lock-function-name-face)
		("treesit-auto-install" . font-lock-function-name-face)
		("treesit-auto-add-to-auto-mode-alist" . font-lock-function-name-face)
		("global-treesit-auto-mode" . font-lock-function-name-face)

		;; Highlight Numbers
		("highlight-numbers-mode" . font-lock-function-name-face)))

(font-lock-add-keywords
 'emacs-lisp-mode
 static-elisp-keywords)

(font-lock-add-keywords
 'emacs-lisp-mode
 custom-elisp-keywords)
