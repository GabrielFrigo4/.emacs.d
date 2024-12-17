# Emacs
Emacs config

This repository is the configuration of the Emacs code editor that Gabriel Frigo uses

## TODO
Todo List
```
Atualizar Eshell
Atualizar emacs-lisp-ts-mode
Atualizar Lisp (sintax)
```

## Treesit
All \*ts-mode\* in Emacs 29.4
```
c-ts-mode
go-ts-mode
js-ts-mode
c++-ts-mode
css-ts-mode
tsx-ts-mode
bash-ts-mode
java-ts-mode
json-ts-mode
ruby-ts-mode
rust-ts-mode
toml-ts-mode
yaml-ts-mode
cmake-ts-mode
csharp-ts-mode
go-mod-ts-mode
python-ts-mode
c-or-c++-ts-mode
dockerfile-ts-mode
typescript-ts-mode
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