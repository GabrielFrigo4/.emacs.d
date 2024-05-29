;; ################
;; # High Elisp
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
;; # Get Symbols
;; ################


(setq-local function-names '())
(setq-local functions '())

(setq-local variable-names '())
(setq-local variables '())

(setq-local macro-names '())
(setq-local macros '())

(setq-local group-names '())
(setq-local groups '())


;; ################
;; # Get Symbols
;; ################

(mapatoms (lambda (symbol)
			(setq-local is-gruop t)
            (when (functionp symbol)
       		  (push (format "\\<\\(%s\\)\\>" (symbol-name symbol)) function-names)
			  (setq-local is-group nil))
            (when (boundp symbol)
			  (push (format "\\<\\(%s\\)\\>" (symbol-name symbol)) variable-names)
			  (setq-local is-group nil))
			(when (macrop symbol)
			  (push (format "\\<\\(%s\\)\\>" (symbol-name symbol)) macro-names)
			  (setq-local is-group nil))
			(when is-group
			  (push (format "\\<\\(%s\\)\\>" (symbol-name symbol)) group-names))
		  ))


;; ################
;; # Functions
;; ################


(setq-local functions '(
  ("(\\s-*\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>" 1 'font-lock-function-name-face)
))


;; ################
;; # Variables
;; ################


(setq-local variable-names (sort-encreasing-length variable-names))

(dolist (v variable-names)
  (push (cons v 'font-lock-variable-name-face) variables))


;; ################
;; # Macros
;; ################


(push (format "\\<\\(%s\\)\\>" "setq") macro-names)
(setq-local macro-names (sort-encreasing-length macro-names))

(dolist (m macro-names)
  (push (cons m 'font-lock-keyword-face) macros))


;; ################
;; # Groups
;; ################


(push (format "\\<\\(%s\\)\\>" "setqq") group-names)
(setq-local group-names (sort-encreasing-length group-names))

(dolist (g group-names)
  (push (cons g 'font-lock-type-face) groups))


;; ################
;; # Font Lock
;; ################


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
