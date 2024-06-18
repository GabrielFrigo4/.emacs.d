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
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(true\\|false\\|nil\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-constant-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(and\\|break\\|do\\|else\\|elseif\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(end\\|if\\|in\\|for\\|function\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(not\\|or\\|repeat\\|return\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(then\\|local\\|until\\|while\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)

              ;; Lua Tables (Modules)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(math\\|string\\|table\\|os\\|io\\|debug\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)

              ;; LOVE Framework
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(love\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ))

(setq-local custom-lua-defaults
            '(
              ("\\(\\_<\\s_*[A-Z]\\(?:[A-Z0-9_]\\)?+\\)\\_>" . font-lock-constant-face)
              ))

(setq-local custom-lua-attributes
            '(
              ("<\\(?:\\sw\\)?+>" . font-lock-builtin-face)
              ))

(setq-local custom-lua-functions
            '(
              ;; Builtin Functions
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(dofile\\|dostring\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(next\\|nextvar\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(tostring\\|tonumber\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(print\\|type\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(assert\\|error\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(setglobal\\|getglobal\\|setfallback\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)

              ;; Define Functions
              ("\\(\\_<\\(?:\\sw\\|\\s_\\)?+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ("\\<function\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" 1 font-lock-function-name-face)
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
