;; ################
;; # Python
;; ################


(setq-local custom-python-keywords
	  '(("\\<\\(__file__\\)\\>" . font-lock-variable-name-face)))

(font-lock-add-keywords
 'python-mode
 custom-python-keywords)

(defun custom-python-mode-hook ()
  (setq indent-tabs-mode t)
  (setq python-indent 8)
  (setq tab-width 4)
  )

(add-hook 'python-mode-hook #'custom-python-mode-hook)
