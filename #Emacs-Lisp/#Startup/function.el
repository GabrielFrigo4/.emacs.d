;; ################
;; # Function
;; ################


;; ################
;; # Regex
;; ################


(defun regex-code-word (word)
  (format "\\(?:[^a-zA-Z0-9_]\\|^\\)\\(%s\\)\\(?:[^a-zA-Z0-9_]\\|$\\)" word))

(defun regex-elisp-keyword (keyword)
  (format "(\\<\\(%s\\)\\>[^a-zA-Z0-9_-]" keyword))


;; ################
;; # Sort
;; ################


(defun sort-decreasing-length (list)
  (sort list
        (lambda (a b)
          (> (length a) (length b)))))

(defun sort-encreasing-length (list)
  (sort list
        (lambda (a b)
          (< (length a) (length b)))))
