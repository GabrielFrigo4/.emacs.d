;; ################
;; # Lua
;; ################


(setq-local custom-lua-keywords
            '(("\\<\\(\<w\>\\)\\>" . font-lock-type-name-face)))

(font-lock-add-keywords
 'lua-mode
 custom-lua-keywords)
