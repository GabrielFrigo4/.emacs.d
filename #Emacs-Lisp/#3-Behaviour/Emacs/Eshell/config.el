;; ################
;; # Eshell
;; ################


(advice-add 'epe-git-p :override
            (lambda (&rest args)
              nil))

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-multiline-with-status "eshell-prompt-extras")
  (setq eshell-highlight-prompt t
        eshell-prompt-function 'epe-theme-multiline-with-status
        epe-git-dirty-char "*"))


;; ################
;; # Functions
;; ################


(defun eshell/clear ()
  "Clear the Eshell Buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))


;; ################
;; # Alias
;; ################


(defalias 'clear-scrollback 'eshell/clear-scrollback)
(defalias 'clear 'eshell/clear)
(defalias 'cls 'eshell/clear)
(defalias 'clr 'eshell/clear)
