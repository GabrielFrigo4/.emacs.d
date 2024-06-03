;; ################
;; # Sort Function
;; ################


(defun sort-decreasing-length (list)
  (sort list
        (lambda (a b)
          (> (length a) (length b)))))

(defun sort-encreasing-length (list)
  (sort list
        (lambda (a b)
          (< (length a) (length b)))))


;; ################
;; # High Elisp
;; ################


(defun custom-hight-elisp-mode-hook ()
  ;; ################
  ;; # Define Locals
  ;; ################


  (setq-local defaults '())
  (setq-local variables '())
  (setq-local constants '())
  (setq-local functions '())
  (setq-local groups '())
  (setq-local macros '())


  ;; ################
  ;; # Defaults
  ;; ################


  (push (list "\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" 1 'font-lock-variable-name-face) defaults)
  (push (list "(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>" 1 'font-lock-function-name-face) defaults)


  ;; ################
  ;; # Variables
  ;; ################


  (push (list (format "(\\s-*%s\\s-*(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "lambda") 1 'font-lock-variable-name-face) variables)
  (push (list (format "(\\s-*%s\\s-*(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "dolist") 1 'font-lock-variable-name-face) variables)
  (push (list (format "(\\s-*%s\\s-*(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "dotimes") 1 'font-lock-variable-name-face) variables)
  (push (list (format "(\\s-*%s\\s-*(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "let") 1 'font-lock-variable-name-face) variables)
  (push (list (format "(\\s-*%s\\s-*.*\\s-*(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defun") 1 'font-lock-variable-name-face) variables)
  (push (list (format "(\\s-*%s\\s-*.*\\s-*(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defmacro") 1 'font-lock-variable-name-face) variables)
  (push (list (format "(\\s-*%s\\s-*.*\\s-*(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defgroup") 1 'font-lock-variable-name-face) variables)


  ;; ################
  ;; # Constants
  ;; ################


  (push (list (format "(\\s-*%s\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defconst") 1 'font-lock-constant-face) constants)


  ;; ################
  ;; # Functions
  ;; ################


  (push (list (format "(\\s-*%s\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defun") 1 'font-lock-function-name-face) functions)


  ;; ################
  ;; # Groups
  ;; ################


  (push (list (format "(\\s-*%s\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defgroup") 1 'font-lock-type-face) functions)


  ;; ################
  ;; # Macros
  ;; ################


  (setq-local macro-names
              (list
               "1value"
               "`"
               "add-function""allout-mode-p"
               "and-let*"
               "atomic-change-group"
               "auth-source--aput"
               "backquote"
               "backquote-list*"
               "backquote-list*-macro"
               "benchmark-progn"
               "benchmark-run"
               "benchmark-run-compiled"
               "bind-key"
               "bind-key*"
               "bind-keys"
               "bind-keys*"
               "bound-and-true-p"
               "browse-url-maybe-new-window"
               "buffer-local-set-state"
               "byte-compile-close-variables"
               "byte-compile-get-constant"
               "byte-compile-goto-if"
               "byte-compile-log"
               "byte-compile-log-lap"
               "byte-compile-maybe-guarded"
               "byte-compile-push-bytecode-const2"
               "byte-compile-push-bytecodes"
               "byte-defop"
               "byte-defop-compiler"
               "byte-defop-compiler-1"
               "byte-extrude-byte-code-vectors"
               "byte-optimize--pcase"
               "charset-long-name"
               "charset-short-name"
               "check-ccl-program"
               "cl--check-key"
               "cl--check-match"
               "cl--check-test"
               "cl--check-test-nokey"
               "cl--find-class"
               "cl--generic"
               "cl--parsing-keywords"
               "cl--pop2"
               "cl--push-clause-loop-body"
               "cl-assert"
               "cl-block"
               "cl-callf"
               "cl-callf2"
               "cl-case"
               "cl-check-type"
               "cl-decf"
               "cl-declaim"
               "cl-declare"
               "cl-defgeneric"
               "cl-define-compiler-macro"
               "cl-defmacro"
               "cl-defmethod"
               "cl-defstruct"
               "cl-defsubst"
               "cl-deftype"
               "cl-defun"
               "cl-destructuring-bind"
               "cl-do"
               "cl-do*"
               "cl-do-all-symbols"
               "cl-do-symbols"
               "cl-dolist"
               "cl-dotimes"
               "cl-ecase"
               "cl-etypecase"
               "cl-eval-when"
               "cl-flet"
               "cl-flet*"
               "cl-function"
               "cl-generic-current-method-specializers"
               "cl-generic-define-context-rewriter"
               "cl-generic-define-generalizer"
               "cl-incf"
               "cl-iter-defun"
               "cl-labels"
               "cl-letf"
               "cl-letf*"
               "cl-load-time-value"
               "cl-locally"
               "cl-loop"
               "cl-macrolet"
               "cl-multiple-value-bind"
               "cl-multiple-value-setq"
               "cl-once-only"
               "cl-prog"
               "cl-prog*"
               "cl-progv"
               "cl-psetf"
               "cl-psetq"
               "cl-pushnew"
               "cl-remf"
               "cl-return"
               "cl-return-from"
               "cl-rotatef"
               "cl-shiftf"
               "cl-symbol-macrolet"
               "cl-tagbody"
               "cl-the"
               "cl-typecase"
               "cl-with-gensyms"
               "class-parent"
               "combine-after-change-calls"
               "combine-change-calls"
               "comment-with-narrowing"
               "condition-case-unless-debug"
               "declare"
               "declare-ccl-program"
               "declare-function"
               "def-edebug-spec"
               "defadvice"
               "defclass"
               "defcustom"
               "defface"
               "defgroup"
               "defimage"
               "define-advice"
               "define-alternatives"
               "define-ccl-program"
               "define-derived-mode"
               "define-generic-mode"
               "define-global-minor-mode"
               "define-globalized-minor-mode"
               "define-ibuffer-column"
               "define-ibuffer-filter"
               "define-ibuffer-op"
               "define-ibuffer-sorter"
               "define-inline"
               "define-minor-mode"
               "define-multisession-variable"
               "define-obsolete-face-alias"
               "define-obsolete-function-alias"
               "define-obsolete-variable-alias"
               "define-short-documentation-group"
               "define-skeleton"
               "define-widget-keywords"
               "defmacro"
               "defmath"
               "defsubst"
               "deftheme"
               "defun"
               "defvar-keymap"
               "defvar-local"
               "degrees-to-radians"
               "delay-mode-hooks"
               "displaying-byte-compile-warnings"
               "dlet"
               "dolist"
               "dolist-with-progress-reporter"
               "dont-compile"
               "dotimes"
               "dotimes-with-progress-reporter"
               "easy-menu-define"
               "easy-mmode-define-global-mode"
               "easy-mmode-define-minor-mode"
               "easy-mmode-defmap"
               "easy-mmode-defsyntax"
               "eieio--class-option-assoc"
               "eieio-class-parent"
               "eieio-declare-slots"
               "eldoc--documentation-strategy-defcustom"
               "ert-deftest"
               "eval-and-compile"
               "eval-when-compile"
               "face-attribute-specified-or"
               "faceup-defexplainer"
               "flymake-log"
               "gv-define-expander"
               "gv-define-setter"
               "gv-define-simple-setter"
               "gv-delay-error"
               "gv-letplace"
               "gv-ref"
               "if-let"
               "if-let*"
               "ignore-error"
               "ignore-errors"
               "internal--thread-argument"
               "isearch-define-mode-toggle"
               "json--with-indentation"
               "json--with-output-to-string"
               "json-readtable-dispatch"
               "lambda"
               "lazy-completion-table"
               "let-alist"
               "let-when-compile"
               "letrec"
               "macroexp--accumulate"
               "macroexp-let2"
               "macroexp-let2*"
               "map-let"
               "map-put"
               "menu-bar-make-mm-toggle"
               "menu-bar-make-toggle"
               "menu-bar-make-toggle-command"
               "minibuffer-with-setup-hook"
               "named-let"
               "noreturn"
               "oclosure--define-functions"
               "oclosure--lambda"
               "oclosure-define"
               "oclosure-lambda"
               "oref"
               "oref-default"
               "org-batch-agenda"
               "org-batch-agenda-csv"
               "org-batch-store-agenda-views"
               "oset"
               "oset-default"
               "package--push"
               "package--unless-error"
               "package--with-response-buffer"
               "package--with-work-buffer"
               "pcase"
               "pcase-defmacro"
               "pcase-dolist"
               "pcase-exhaustive"
               "pcase-lambda"
               "pcase-let"
               "pcase-let*"
               "pcase-setq"
               "pop"
               "prog2"
               "push"
               "quail-define-rules"
               "radians-to-degrees"
               "remove-function"
               "replace--push-stack"
               "report-errors"
               "robin-define-package"
               "rx"
               "rx-define"
               "rx-let"
               "rx-let-eval"
               "save-mark-and-excursion"
               "save-match-data"
               "save-selected-window"
               "save-window-excursion"
               "seq-doseq"
               "seq-let"
               "seq-setq"
               "setf"
               "setopt"
               "setq-connection-local"
               "setq-default"
               "setq-local"
               "subr--with-wrapper-hook-no-warnings"
               "syntax-propertize-precompile-rules"
               "syntax-propertize-rules"
               "thread-first"
               "thread-last"
               "track-mouse"
               "tramp-archive-autoload-file-name-regexp"
               "tramp-compat-rx"
               "transient-define-prefix"
               "unbind-key"
               "unless"
               "url-bit-for-url"
               "url-handlers-create-wrapper"
               "use-package"
               "vc-call"
               "vc-error-occurred"
               "when"
               "when-let"
               "when-let*"
               "while-let"
               "while-no-input"
               "with-auto-compression-mode"
               "with-buffer-unmodified-if-unchanged"
               "with-case-table"
               "with-category-table"
               "with-coding-priority"
               "with-connection-local-application-variables"
               "with-connection-local-variables"
               "with-current-buffer"
               "with-current-buffer-window"
               "with-delayed-message"
               "with-demoted-errors"
               "with-displayed-buffer-window"
               "with-environment-variables"
               "with-eval-after-load"
               "with-existing-directory"
               "with-file-modes"
               "with-help-window"
               "with-isearch-suspended"
               "with-local-quit"
               "with-locale-environment"
               "with-memoization"
               "with-minibuffer-completions-window"
               "with-minibuffer-selected-window"
               "with-mutex"
               "with-output-to-string"
               "with-output-to-temp-buffer"
               "with-restriction"
               "with-selected-frame"
               "with-selected-window"
               "with-silent-modifications"
               "with-slots"
               "with-suppressed-warnings"
               "with-syntax-table"
               "with-temp-buffer"
               "with-temp-buffer-window"
               "with-temp-file"
               "with-temp-message"
               "with-timeout"
               "with-undo-amalgamate"
               "with-window-non-dedicated"
               "with-wrapper-hook"
               "without-restriction"
               ))

  (push "setq" macro-names)
  (push "if" macro-names)
  (setq-local macro-names (sort-encreasing-length macro-names))

  (dolist (m macro-names)
    (push (cons (format "\\<\\(%s\\)\\>" m) 'font-lock-keyword-face) macros))

  (push (list (format "(\\s-*%s\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defmacro") 1 'font-lock-keyword-face) macros)


  ;; ################
  ;; # Font Lock
  ;; ################


  (font-lock-add-keywords
   'emacs-lisp-mode
   defaults)

  (font-lock-add-keywords
   'emacs-lisp-mode
   variables)

  (font-lock-add-keywords
   'emacs-lisp-mode
   constants)

  (font-lock-add-keywords
   'emacs-lisp-mode
   functions)

  (font-lock-add-keywords
   'emacs-lisp-mode
   groups)

  (font-lock-add-keywords
   'emacs-lisp-mode
   macros)
  )

(custom-hight-elisp-mode-hook)
