;; ################
;; # Assembly
;; ################


(defun custom-asm-mode-hook ()
  (local-unset-key (vector asm-comment-char))
  (setq tab-always-indent (default-value 'tab-always-indent))
  (electric-indent-local-mode)
  )

(add-hook 'asm-mode-hook #'custom-asm-mode-hook)
