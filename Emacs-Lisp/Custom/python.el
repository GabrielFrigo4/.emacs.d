;; ################
;; # Python
;; ################


(defun custom-python-mode-hook ()
  (setq indent-tabs-mode t)
  )

(add-hook 'python-mode-hook #'custom-python-mode-hook)
