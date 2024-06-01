;; ################
;; # Lua
;; ################


(setq-local custom-lua-keywords
            '(
              ;;("\\<\\(?:love\\)\\>" . font-lock-builtin-face)
              ("<\\(?:\\sw\\)+>" . font-lock-builtin-face)
              ))

(font-lock-add-keywords
 'lua-mode
 custom-lua-keywords)
