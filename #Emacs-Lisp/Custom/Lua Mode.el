;; ################
;; # Lua
;; ################


(setq-local custom-lua-startup
            '(
              ("\\(\\_<\\(?:\\sw\\|\\s_\\)?+\\)\\_>" . font-lock-variable-name-face)
              ))

(setq-local custom-lua-keywords
            '(
              ;; Lua Keywords
              ("\\<\\(true\\|false\\|nil\\)\\>" . font-lock-constant-face)
              ("\\<\\(and\\|break\\|do\\|else\\|elseif\\)\\>" . font-lock-keyword-face)
              ("\\<\\(end\\|if\\|in\\|for\\|function\\)\\>" . font-lock-keyword-face)
              ("\\<\\(not\\|or\\|repeat\\|return\\)\\>" . font-lock-keyword-face)
              ("\\<\\(then\\|local\\|until\\|while\\)\\>" . font-lock-keyword-face)

              ;; Lua Tables (Modules)
              ("\\<\\(math\\|string\\|table\\|os\\|io\\|debug\\)\\>" . font-lock-builtin-face)

              ;; LOVE Framework
              ("\\<\\(?:love\\)\\>" . font-lock-builtin-face)
              ))

(setq-local custom-lua-defaults
            '(
              ("\\(\\_<[A-Z]\\(?:[A-Z]\\|\\s_\\|[0-9]\\)+\\)?\\_>" . font-lock-constant-face)
              ))

(setq-local custom-lua-attributes
            '(
              ("<\\(?:\\sw\\)?+>" . font-lock-builtin-face)
              ))

(setq-local custom-lua-functions
            '(
              ("\\(\\_<\\(?:\\sw\\|\\s_\\)?+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ("\\<function\\s-*\\(\\_<[a-z]\\(?:\\sw\\|\\s_\\)?+\\)" 1 font-lock-function-name-face)
              ))

(font-lock-add-keywords
 'lua-mode
 custom-lua-startup)

(font-lock-add-keywords
 'lua-mode
 custom-lua-keywords)

(font-lock-add-keywords
 'lua-mode
 custom-lua-defaults)

(font-lock-add-keywords
 'lua-mode
 custom-lua-attributes)

(font-lock-add-keywords
 'lua-mode
 custom-lua-functions)

(defun custom-lua-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (setq lua-indent-level tab-width)
  )

(add-hook 'lua-mode-hook #'custom-lua-mode-hook)
