(require 'eshell)
(require 'em-hist)

(defun mock-on-input-line-p-fixed ()
  (and (derived-mode-p 'eshell-mode)
       (boundp 'eshell-last-output-end)
       (markerp eshell-last-output-end)
       (>= (line-end-position) eshell-last-output-end)
       (not (< (line-beginning-position)
               (save-excursion
                 (goto-char eshell-last-output-end)
                 (line-beginning-position))))))

(defun test-on-input-line-p ()
  (with-temp-buffer
    (eshell-mode)
    (insert "output 1\noutput 2\n")
    (let ((marker (point-marker)))
      (set-marker-insertion-type marker t)
      (setq eshell-last-output-end marker))
    (insert "$ ")
    
    (goto-char (point-min))
    (message "At min (output 1): %s" (mock-on-input-line-p-fixed))
    
    (goto-char (point-max))
    (message "At max (prompt): %s" (mock-on-input-line-p-fixed))
    ))

(test-on-input-line-p)
