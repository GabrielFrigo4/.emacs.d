;; ################
;; # Emacs Lisp
;; ################


(defun config-emacs-lisp-mode-hook ()
  (setq-local indent-tabs-mode nil)
  (setq-local tab-width 2))

(add-hook 'emacs-lisp-mode-hook #'config-emacs-lisp-mode-hook)
