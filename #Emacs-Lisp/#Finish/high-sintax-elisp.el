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


  (setq-local defaults-names '())
  (setq-local defaults '())

  (setq-local variable-names '())
  (setq-local variables '())

  (setq-local function-names '())
  (setq-local functions '())

  (setq-local macro-names '())
  (setq-local macros '())

  (setq-local group-names '())
  (setq-local groups '())


  ;; ################
  ;; # Get Symbols
  ;; ################


  (mapatoms (lambda (symbol)
			        (setq-local is-gruop t)
              (when (boundp symbol)
			          (push (symbol-name symbol) variable-names)
			          (setq-local is-group nil))
              (when (functionp symbol)
       		      (push (symbol-name symbol) function-names)
			          (setq-local is-group nil))
			        (when (macrop symbol)
			          (push (symbol-name symbol) macro-names)
			          (setq-local is-group nil))
			        (when is-group
			          (push (symbol-name symbol) group-names))
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


  ;; ################
  ;; # Functions
  ;; ################


  (push (list (format "(\\s-*%s\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)" "defun") 1 'font-lock-function-name-face) functions)


  ;; ################
  ;; # Macros
  ;; ################


  (push "setq" macro-names)
  (setq-local macro-names (sort-encreasing-length macro-names))

  (dolist (m macro-names)
    (push (cons (format "\\<\\(%s\\)\\>" m) 'font-lock-keyword-face) macros))


  ;; ################
  ;; # Groups
  ;; ################


  (setq-local group-names (sort-encreasing-length group-names))

  (dolist (g group-names)
    (push (cons (format "\\<\\(%s\\)\\>" g) 'font-lock-type-face) groups))


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
   functions)

  (font-lock-add-keywords
   'emacs-lisp-mode
   macros)

  (font-lock-add-keywords
   'emacs-lisp-mode
   groups)
  )

(custom-hight-elisp-mode-hook)
