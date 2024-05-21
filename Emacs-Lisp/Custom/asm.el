;; ################
;; # Assembly
;; ################

(defun custom-asm-mode-hook ()
  (local-unset-key (vector asm-comment-char))
  (electric-indent-local-mode)

  (defun asm-calculate-indentation ()
  (or
   ;; Flush labels goes to the left margin.
   (and (looking-at "[.@_[:word:]]+:") 0)
   ;; Same thing for `;;' comments.
   (and (looking-at "\\s<\\s<") 0)
   ;; Nasm %macro stuff goes to the left margin
   (and (looking-at "%") 0)
   ;; Assembly keywords goes to the left margin.
   (and (looking-at "c?global\\|section\\|segment\\") 0)
   (and (looking-at "c?default\\|align\\|bits\\|org\\|INIT_..X") 0)
   (and (looking-at "c?INIT_..X") 0)
   ;; The rest goes at column tab-width
   (or tab-width)))
  )

(add-hook 'asm-mode-hook #'custom-asm-mode-hook) 
