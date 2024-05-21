;; ################
;; # Rust
;; ################


(defun custom-rust-mode-hook ()
  (setq indent-tabs-mode t)
  )

(add-hook 'rust-mode-hook #'custom-rust-mode-hook)
