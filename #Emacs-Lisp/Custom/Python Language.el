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

(with-eval-after-load 'python
  (setf (nth 7 python-font-lock-keywords-maximum-decoration)
        `(,(rx symbol-start
               (or
                ;; Python 2 and 3:
                "ArithmeticError" "AssertionError" "AttributeError" "BaseException"
                "BufferError" "BytesWarning" "DeprecationWarning" "EOFError"
                "EnvironmentError" "Exception" "FloatingPointError" "FutureWarning"
                "GeneratorExit" "IOError" "ImportError" "ImportWarning"
                "IndentationError" "IndexError" "KeyError" "KeyboardInterrupt"
                "LookupError" "MemoryError" "NameError" "NotImplementedError"
                "OSError" "OverflowError" "PendingDeprecationWarning"
                "ReferenceError" "RuntimeError" "RuntimeWarning" "StopIteration"
                "SyntaxError" "SyntaxWarning" "SystemError" "SystemExit" "TabError"
                "TypeError" "UnboundLocalError" "UnicodeDecodeError"
                "UnicodeEncodeError" "UnicodeError" "UnicodeTranslateError"
                "UnicodeWarning" "UserWarning" "ValueError" "Warning"
                "ZeroDivisionError"
                ;; Python 2:
                "StandardError"
                ;; Python 3:
                "BlockingIOError" "BrokenPipeError" "ChildProcessError"
                "ConnectionAbortedError" "ConnectionError" "ConnectionRefusedError"
                "ConnectionResetError" "FileExistsError" "FileNotFoundError"
                "InterruptedError" "IsADirectoryError" "NotADirectoryError"
                "PermissionError" "ProcessLookupError" "RecursionError"
                "ResourceWarning" "StopAsyncIteration" "TimeoutError"
                ;; OS specific
                "VMSError" "WindowsError"
                )
               symbol-end)
          . font-lock-type-face)))

(defun custom-python-mode-hook ()
  (setq indent-tabs-mode t)
  (setq python-indent 8)
  (setq tab-width 4)
  )

(add-hook 'python-mode-hook #'custom-python-mode-hook)
