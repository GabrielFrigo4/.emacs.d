;; ################
;; # Lua
;; ################


(defun custom-lua-mode-hook ()
  (setq indent-tabs-mode t)
  (setq tab-width 4)
  (setq lua-indent-level tab-width)
  )

(add-hook 'lua-mode-hook #'custom-lua-mode-hook)
