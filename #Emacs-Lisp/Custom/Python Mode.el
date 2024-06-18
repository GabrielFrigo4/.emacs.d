;; ################
;; # Python
;; ################


(setq-local custom-python-startup
            '(
              ("\\(\\_<[a-z]\\(?:\\sw\\|\\s_\\)?+\\)\\_>" . font-lock-variable-name-face)
              ))

(setq-local custom-python-keywords
            '(
              ;; Python Keywords
              ("\\<\\(False\\|True\\|None\\)\\>" . font-lock-builtin-face)
              ("\\<\\(and\\|as\\|assert\\|async\\)\\>" . font-lock-keyword-face)
              ("\\<\\(await\\|break\\|class\\|continue\\|def\\|del\\|elif\\)\\>" . font-lock-keyword-face)
              ("\\<\\(else\\|except\\|finally\\|for\\|from\\|global\\|if\\)\\>" . font-lock-keyword-face)
              ("\\<\\(import\\|in\\|is\\|lambda\\|nonlocal\\|not\\|or\\)\\>" . font-lock-keyword-face)
              ("\\<\\(pass\\|raise\\|return\\|try\\|while\\|with\\|yield\\)\\>" . font-lock-keyword-face)

              ;; Do for any "__word__"
              ("\\B\\s_\\s_\\(?:\\sw\\)+\\s_\\s_\\B" . font-lock-builtin-face)

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

(setq-local custom-python-defaults
            '(
              ("\\(\\_<[A-Z]\\(?:\\sw\\|\\s_\\)?+\\)\\_>" . font-lock-type-face)
              ("\\(\\_<[A-Z]\\(?:[A-Z]\\|\\s_\\|[0-9]\\)?+\\)\\_>" . font-lock-constant-face)
              ))

(setq-local custom-python-classes
            '(
              ("\\(\\_<[A-Z]\\(?:\\sw\\|\\s_\\)?+\\)\\_>\\s-*(" 1 font-lock-type-face)
              ("\\<class\\s-*\\(\\_<[A-Z]\\(?:\\sw\\|\\s_\\)?+\\)" 1 font-lock-type-face)
              ))

(setq-local custom-python-functions
            '(
              ("\\(\\_<[a-z]\\(?:\\sw\\|\\s_\\)?+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ("\\(\\_<[A-Z]\\(?:[A-Z]\\|\\s_\\|[0-9]\\)?+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ("\\<def\\s-*\\(\\_<[a-z]\\(?:\\sw\\|\\s_\\)?+\\)" 1 font-lock-function-name-face)
              ("\\<def\\s-*\\(\\_<[A-Z]\\(?:[A-Z]\\|\\s_\\|[0-9]\\)?+\\)" 1 font-lock-function-name-face)
              ))

(font-lock-add-keywords
 'python-mode
 custom-python-startup)

(font-lock-add-keywords
 'python-mode
 custom-python-keywords)

(font-lock-add-keywords
 'python-mode
 custom-python-defaults)

(font-lock-add-keywords
 'python-mode
 custom-python-classes)

(font-lock-add-keywords
 'python-mode
 custom-python-functions)

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
  (setq python-indent-offset tab-width)
  )

(add-hook 'python-mode-hook #'custom-python-mode-hook)
