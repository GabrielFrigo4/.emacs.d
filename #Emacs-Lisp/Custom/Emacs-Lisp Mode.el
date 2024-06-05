;; ################
;; # Emacs Lisp
;; ################


(defun custom-emacs-lisp-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
 )

(add-hook 'emacs-lisp-mode-hook #'custom-emacs-lisp-mode-hook)
