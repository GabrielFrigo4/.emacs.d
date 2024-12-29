;; ################
;; # Lua
;; ################


(defun config-lua-mode-hook ()
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 4)
  (setq-local lua-indent-level tab-width))

(add-hook 'lua-mode-hook #'config-lua-mode-hook)
