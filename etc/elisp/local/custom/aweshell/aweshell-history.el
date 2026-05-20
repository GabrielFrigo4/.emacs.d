;;; aweshell-history.el --- History and autosuggestions for aweshell -*- lexical-binding: t; -*-


(defun aweshell/parse-shell-history ()
    "Parse history from eshell/bash/zsh/ ."
    (delete-dups
     (mapcar
      (lambda (str)
        (string-trim (substring-no-properties str)))
      (append
       (ring-elements eshell-history-ring)
       (aweshell/parse-bash-history)
       (aweshell/parse-zsh-history)))))

(provide 'aweshell-history)
;;; aweshell-history.el ends here
