;; ################
;; # Python
;; ################


(setq-local custom-python-startup
            '(
              ("\\(\\_<[a-z_]\\(?:\\sw\\|\\s_\\)?+\\)\\_>" . font-lock-variable-name-face)
              ))

(setq-local custom-python-keywords
            '(
              ;; Python Keywords
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(and\\|as\\|assert\\|async\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(await\\|break\\|class\\|continue\\|def\\|del\\|elif\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(else\\|except\\|finally\\|for\\|from\\|global\\|if\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(import\\|in\\|is\\|lambda\\|nonlocal\\|not\\|or\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(pass\\|raise\\|return\\|try\\|while\\|with\\|yield\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-keyword-face)

              ;; Generic Keywords "__word__"
              ("\\B\\s_\\s_\\(?:\\sw\\)+\\s_\\s_\\B" . font-lock-builtin-face)

              ;; Builtin Keywords "__word__"
              ("\\B\\s_\\s_doc\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_file\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_init\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_main\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_name\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_debug\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_future\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_package\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\B\\s_\\s_builtins\\s_\\s_\\B" . font-lock-builtin-face)
              ))

(setq-local custom-python-defaults
            '(
              ("\\(\\_<\\s_*[A-Z]\\(?:[A-Z0-9_]\\)?+\\)\\_>" . font-lock-constant-face)
              ("\\(\\_<\\s_*[A-Z]\\(?:\\sw\\|\\s_\\)?+\\)\\_>" . font-lock-type-face)
              ))

(setq-local custom-python-classes
            '(
              ("\\(\\_<\\s_*[A-Z]\\(?:\\sw\\|\\s_\\)?+\\)\\_>\\s-*(" 1 font-lock-type-face)
              ("\\<class\\s-*\\(\\_<\\s_?[A-Z]\\(?:\\sw\\|\\s_\\)?+\\)" 1 font-lock-type-face)
              ))

(setq-local custom-python-functions
            '(
              ;; Builtin Functions
              ("\\B\\s_\\s_import\\s_\\s_\\B" . font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(abs\\|aiter\\|all\\|anext\\|any\\|ascii\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(bin\\|bool\\|breakpoint\\|bytearray\\|bytes\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(callable\\|chr\\|classmethod\\|compile\\|complex\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(delattr\\|dict\\|dir\\|divmod\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(enumerate\\|eval\\|exec\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(filter\\|float\\|format\\|frozenset\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(getattr\\|globals\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(hasattr\\|hash\\|help\\|hex\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(id\\|input\\|int\\|isinstance\\|issubclass\\|iter\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(len\\|list\\|locals\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(map\\|max\\|memoryview\\|min\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(next\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(object\\|oct\\|open\\|ord\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(pow\\|print\\|property\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(range\\|repr\\|reversed\\|round\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(set\\|setattr\\|slice\\|sorted\\|staticmethod\\|str\\|sum\\|super\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(tuple\\|type\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(vars\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(zip\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-builtin-face)

              ;; Define Functions
              ("\\(\\_<\\s_*[a-z]\\(?:\\sw\\|\\s_\\)?+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ("\\(\\_<\\s_*[A-Z]\\(?:[A-Z0-9_]\\)?+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ("\\<def\\s-*\\(\\_<\\s_*[a-z]\\(?:\\sw\\|\\s_\\)?+\\)" 1 font-lock-function-name-face)
              ("\\<def\\s-*\\(\\_<\\s_*[A-Z]\\(?:[A-Z]\\|\\s_\\|[0-9]\\)?+\\)" 1 font-lock-function-name-face)
              ))

(setq-local custom-python-values
            '(
              ("\\(?:[^a-zA-Z0-9_]\\|^\\)\\(False\\|True\\|None\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" 1 font-lock-constant-face)
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

(font-lock-add-keywords
 'python-mode
 custom-python-values)

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
