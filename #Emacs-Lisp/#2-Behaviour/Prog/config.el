;; ################
;; # Programing
;; ################


(defun config-prog-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  (highlight-numbers-mode)
  )

(add-hook 'prog-mode-hook 'superword-mode)
(add-hook 'prog-mode-hook #'config-prog-mode-hook)
