;; ============================================================================
;;  CONFIGURATION
;; ============================================================================


(setq-default epe-git-enable nil)
(setq-default eshell-bad-command-tolerance (expt 2 64))
(setq-default aweshell-validate-executable nil)
(setq-default aweshell-auto-suggestion-p t)

(if-windows
 (setq-default aweshell-validate-delay (expt 2 -0.5))
 (setq-default aweshell-validate-delay (expt 2 -1)))


;; ============================================================================
;;  PROMPT THEME
;; ============================================================================


(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-multiline-with-status "eshell-prompt-extras")
  (setq-default eshell-highlight-prompt t
                eshell-prompt-function 'epe-theme-multiline-with-status
                epe-git-dirty-char "*"))


;; ============================================================================
;;  UTILITY FUNCTIONS
;; ============================================================================


(defun eshell/clear ()
  "Clear the Eshell Buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)))


;; ============================================================================
;;  ALIASES
;; ============================================================================


(defalias 'eshell/cls   'eshell/clear)
(defalias 'eshell/clr   'eshell/clear)

(defalias 'eshell/where 'eshell/which)
(defalias 'eshell/wh    'eshell/which)

(defalias 'eshell/close 'eshell/exit)
(defalias 'eshell/ex    'eshell/exit)

(defalias 'eshell/open-file 'find-file)
(defalias 'eshell/open      'find-file)
(defalias 'eshell/op        'find-file)

(defalias 'eshell/buff 'switch-to-buffer)
(defalias 'eshell/s2b  'switch-to-buffer)
(defalias 'eshell/sb   'switch-to-buffer)
