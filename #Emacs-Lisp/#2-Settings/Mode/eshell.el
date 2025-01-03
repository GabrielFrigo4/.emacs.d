;; ################
;; # Eshell
;; ################


;; Remove *command-tolerance*
(setq-default eshell-bad-command-tolerance (expt 2 64))

;; Remove Git Data
(advice-add 'epe-git-p :override
            (lambda (&rest args)
              nil))

;; Set Theme
(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-multiline-with-status "eshell-prompt-extras")
  (setq-default eshell-highlight-prompt t
                eshell-prompt-function 'epe-theme-multiline-with-status
                epe-git-dirty-char "*"))


;; ################
;; # Functions
;; ################


;; Def *clear*
(defun eshell/clear ()
  "Clear the Eshell Buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))


;; ################
;; # Alias
;; ################


;; Def alias
(defalias 'clear-scrollback 'eshell/clear-scrollback)
(defalias 'clear 'eshell/clear)
(defalias 'cls 'eshell/clear)
(defalias 'clr 'eshell/clear)
