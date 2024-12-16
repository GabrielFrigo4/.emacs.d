# Emacs
Emacs config

This repository is the configuration of the Emacs code editor that Gabriel Frigo uses

## TODO
Fazer
```
Atualizar Eshell
Atualizar ASM (sintax)
Atualizar Lisp (sintax)
```

## Elisp Symbols
Get Symbols
``` elisp
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

(setq variable-names (cl-sort variable-names 'string-lessp :key 'downcase))
(setq function-names (cl-sort function-names 'string-lessp :key 'downcase))
(setq macro-names (cl-sort macro-names 'string-lessp :key 'downcase))
```

Show Variables
``` elisp
(let ((xbuff (generate-new-buffer "*output-variables*")))
  (with-output-to-temp-buffer xbuff
    (dolist (v variable-names)
      (print v))
    ))
```

Show Functions
``` elisp
(let ((xbuff (generate-new-buffer "*output-functions*")))
  (with-output-to-temp-buffer xbuff
    (dolist (f function-names)
      (print f))
    ))
```

Show Macros
``` elisp
(let ((xbuff (generate-new-buffer "*output-macros*")))
  (with-output-to-temp-buffer xbuff
    (dolist (m macro-names)
      (print m))
    ))
```

## Using on LINUX
Install __All-The-Icons__
```
M-x all-the-icons-install-fonts
```