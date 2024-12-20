(require 'treesit)

(setq macro-names '())
(mapatoms (lambda (symbol)
            (when (macrop symbol)
              (push (symbol-name symbol) macro-names))))
(setq macro-names (cl-sort macro-names 'string-lessp :key 'downcase))
(push "require" macro-names)

(defvar emacs-lisp-ts-mode--builtins
  macro-names)

(defvar emacs-lisp-ts-mode--keywords
  '("defun" "defsubst" "defmacro" "defconst" "defvar"
    ;; Special forms
    "and" "catch" "cond" "condition-case" "function"
    "if" "interactive" "lambda" "let" "let*" "or" "prog1" "prog2"
    "progn" "quote" "save-current-buffer" "save-excursion"
    "save-restriction" "setq" "setq-default" "unwind-protect" "while"))

(defvar emacs-lisp-ts-mode--operators
  '("*" "/" "+" "-"
    "/=" "="))

(defun emacs-lisp-ts-mode--fontify-parameters (node override start end &rest _)
  (treesit-fontify-with-override
   (treesit-node-start node)
   (treesit-node-end node)
   (if (string-prefix-p "&" (treesit-node-text node))
       'font-lock-type-face
     'font-lock-variable-name-face)
   override start end))

(defvar emacs-lisp-ts-mode--font-lock-settings
  (treesit-font-lock-rules
   :language 'elisp
   :feature 'comment
   '((comment) @font-lock-comment-face)

   :language 'elisp
   :feature 'string
   '((string) @font-lock-string-face)

   :language 'elisp
   :feature 'number
   '([(integer) (float)] @font-lock-number-face)

   :language 'elisp
   :feature 'keyword
   `([,@emacs-lisp-ts-mode--keywords] @font-lock-keyword-face
     (quote ["`" "'" "#'"] @font-lock-keyword-face)
     (unquote_splice ",@" @font-lock-keyword-face)
     (unquote "," @font-lock-keyword-face))

   :language 'elisp
   :feature 'constant
   '(["t" "nil"] @font-lock-constant-face
     (char) @font-lock-constant-face)

   :language 'elisp
   :feature 'definition
   `((special_form
      _ ["defvar" "setq" "setq-default" "let"] (symbol) @font-lock-variable-name-face)

     (function_definition
      name: (symbol) @font-lock-function-name-face
      parameters: (list _ (symbol) @emacs-lisp-ts-mode--fontify-parameters :*))

     (macro_definition
      name: (symbol) @font-lock-keyword-face
      parameters: (list _ (symbol) @emacs-lisp-ts-mode--fontify-parameters :*)))

   :language 'elisp
   :feature 'builtin
   `((list _ ((symbol) @font-lock-keyword-face
              (:match ,(rx-to-string
                        `(seq bol
                              (or ,@emacs-lisp-ts-mode--builtins)
                              eol))
                      @font-lock-keyword-face))))

   :language 'elisp
   :feature 'property
   `(((symbol) @font-lock-builtin-face
      (:match ,(rx bol ":") @font-lock-builtin-face)))

   :language 'elisp
   :feature 'preprocessor
   `(((symbol) @font-lock-preprocessor-face
      (:match ,(rx bol "@") @font-lock-preprocessor-face))
     (unquote_splice (symbol) @font-lock-preprocessor-face)
     (unquote (symbol) @font-lock-preprocessor-face))

   :language 'elisp
   :feature 'quoted
   '((quote (symbol) @font-lock-constant-face))

   :language 'elisp
   :feature 'bracket
   '(["(" ")" "[" "]" "#[" "#("] @font-lock-bracket-face)

   :language 'elisp
   :feature 'operator
   `(((symbol) @font-lock-operator-face
      (:match ,(rx-to-string
                `(seq bol
                      (or ,@emacs-lisp-ts-mode--operators)
                      eol))
              @font-lock-operator-face)))

   :language 'elisp
   :feature 'variable
   `((vector _ ((symbol) @font-lock-variable-name-face)))

   :language 'elisp
   :feature 'callable
   `((list _ ((symbol) @font-lock-function-call-face)))))

(defvar emacs-lisp-ts-mode-feature-list
  '((comment)
    (string keyword definition)
    (builtin constant property preprocessor)
    (bracket number operator quoted variable callable)))

(define-derived-mode emacs-lisp-ts-mode emacs-lisp-mode "ELisp"
  "Major mode for editing Emacs Lisp code using tree-sitter.

Commands:
\\<emacs-lisp-ts-mode-map>"
  (when (treesit-ready-p 'elisp)
    (treesit-parser-create 'elisp)

    (setq-local treesit-font-lock-settings
                emacs-lisp-ts-mode--font-lock-settings)
    (setq-local treesit-font-lock-feature-list
                emacs-lisp-ts-mode-feature-list)

    (treesit-major-mode-setup)))

(provide 'emacs-lisp-ts-mode)
