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
  ;; # Get Symbols
  ;; ################


  (setq-local variable-names '())
  (setq-local function-names '())
  (setq-local macro-names '())

  (mapatoms (lambda (symbol)
              (when (boundp symbol)
			          (push (symbol-name symbol) variable-names))
              (when (functionp symbol)
       		      (push (symbol-name symbol) function-names))
			        (when (macrop symbol)
			          (push (symbol-name symbol) macro-names))
		          ))


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


  (push "setq" macro-names)
  (setq-local macro-names (sort-encreasing-length macro-names))

  (dolist (m macro-names)
    (push (cons (format "\\<\\(%s\\)\\>" m) 'font-lock-keyword-face) macros))


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
