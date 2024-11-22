;; ################
;; # Python
;; ################


(defun custom-python-mode-hook ()
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  (setq python-indent-offset tab-width)
  )

(add-hook 'python-mode-hook #'custom-python-mode-hook)
