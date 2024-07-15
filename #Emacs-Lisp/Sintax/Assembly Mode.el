;; ################
;; # Assembly
;; ################


(defun sintax-asm-mode-hook ()
  ;; Comments Style
  (modify-syntax-entry ?\# "<")
  (modify-syntax-entry ?\n ">")
  (modify-syntax-entry ?\; "<")
  (modify-syntax-entry ?\n ">")
  (modify-syntax-entry ?\/ ". 12")
  (modify-syntax-entry ?\n ">")

  ;; String Style
  (modify-syntax-entry ?\" "\"")
  (modify-syntax-entry ?\' "\"")
  (modify-syntax-entry ?\` "\"")

  ;; Indentation Style
  (defun asm-calculate-indentation ()
  (or
   ;; Flush labels goes to the left margin.
   (and (looking-at "[.@_[:word:]]+:") 0)
   ;; `;;` or `##` comments goes to the left margin.
   (and (looking-at "\\s<\\s<") 0)
   ;; `///` comments goes to the left margin.
   (and (looking-at "///") 0)
   ;; Nasm %macro stuff goes to the left margin
   (and (looking-at "%") 0)
   ;; Assembly keywords goes to the left margin.
   (and (looking-at "c?.global\\|.globl\\|INIT_..X") 0)
   (and (looking-at "c?global\\|section\\|segment\\|INIT_..X") 0)
   (and (looking-at "c?struc\\|endstruc\\|restruc\\|INIT_..X") 0)
   (and (looking-at "c?rept\\|irpv\\|match|{\\|}\\|INIT_..X") 0)
   (and (looking-at "c?default\\|align\\|bits\\|org\\|INIT_..X") 0)
   ;; The rest goes at column tab-width
   (or tab-width)))
  )

(add-hook 'asm-mode-hook #'sintax-asm-mode-hook)
