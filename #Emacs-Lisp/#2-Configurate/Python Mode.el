;; ################
;; # Python
;; ################


(defun custom-python-mode-hook ()
  (setq indent-tabs-mode t)
  (setq python-indent 8)
  (setq tab-width 4)
  (setq python-indent-offset tab-width)
  )

(add-hook 'python-mode-hook #'custom-python-mode-hook)
