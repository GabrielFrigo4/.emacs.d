;; ################
;; # Python
;; ################


(defun config-python-mode-hook ()
  (setq-local tab-width 4)
  (setq-local indent-tabs-mode t)
  (setq-local python-indent-offset tab-width))

(add-hook 'python-mode-hook #'config-python-mode-hook)
