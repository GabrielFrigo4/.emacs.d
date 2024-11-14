;; ################
;; # Programing
;; ################


(defun custom-prog-mode-hook ()
  (highlight-numbers-mode)
  (setq indent-tabs-mode t)
  )

(add-hook 'prog-mode-hook 'superword-mode)
(add-hook 'prog-mode-hook #'custom-prog-mode-hook)
