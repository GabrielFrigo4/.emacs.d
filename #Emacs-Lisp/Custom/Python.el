;; ################
;; # Python
;; ################


(setq-local custom-python-keywords
            '(
              ;; Do for any "__word__"
              ;;("\\B\\s_\\s_\\(?:\\sw\\)+\\s_\\s_\\B" . font-lock-builtin-face)

              ;; Builtin "__word__"
              ("\\B\\s_\\s_doc\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_file\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_init\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_main\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_name\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_debug\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_future\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_import\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_package\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_builtins\\s_\\s_\\B" . font-lock-builtin-face)
              ))

(font-lock-add-keywords
 'python-mode
 custom-python-keywords)

(defun custom-python-mode-hook ()
  (setq indent-tabs-mode t)
  (setq python-indent 8)
  (setq tab-width 4)
  )

(add-hook 'python-mode-hook #'custom-python-mode-hook)
