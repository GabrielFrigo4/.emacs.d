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


;; ################
;; # Term
;; ################


(defun term-other-window (sh)
  "Open a `term' in a new window."
  (interactive)
  (let ((buf (term sh)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(defun zsh-other-window ()
  "Open a `zsh' in a new window."
  (interactive)
  (term-other-window "zsh"))

(defun bash-other-window ()
  "Open a `bash' in a new window."
  (interactive)
  (term-other-window "bash"))

(defun sh-other-window ()
  "Open a `sh' in a new window."
  (interactive)
  (term-other-window "sh"))

(defun cmd-other-window ()
  "Open a `cmd' in a new window."
  (interactive)
  (term-other-window "cmd"))

(defun pwsh-other-window ()
  "Open a `pwsh' in a new window."
  (interactive)
  (term-other-window "pwsh"))

(defun default-term-other-window ()
  "Open a `pwsh' in a new window."
  (interactive)
  (if (eq system-type 'windows-nt)
      (pwsh-other-window)
    (zsh-other-window))
  )


;; ################
;; # Shell
;; ################


(defun shell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (shell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))


;; ################
;; # Shell
;; ################


(defun eshell-other-window ()
  "Open a `eshell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))
