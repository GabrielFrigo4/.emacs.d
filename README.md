# Emacs
Emacs config

This repository is the configuration of the Emacs code editor that Gabriel Frigo uses

## TODO
Todo List
```
Atualizar emacs-lisp-ts-mode
Atualizar Lisp (Slime IDE)
Atualizar Eshell
```

## Treesit
Oficial \*ts-mode\* in Emacs 29.4
```
(ok) => c-ts-mode
(ok) => go-ts-mode
(ok) => js-ts-mode
(ok) => c++-ts-mode
(ok) => css-ts-mode
(ok) => tsx-ts-mode
(ok) => bash-ts-mode
(ok) => java-ts-mode
(ok) => json-ts-mode
(ok) => ruby-ts-mode
(ok) => rust-ts-mode
(ok) => toml-ts-mode
(ok) => yaml-ts-mode
(ok) => cmake-ts-mode
(ok) => csharp-ts-mode
(not) => go-mod-ts-mode
(ok) => python-ts-mode
(ok) => c-or-c++-ts-mode
(ok) => dockerfile-ts-mode
(ok) => typescript-ts-mode
```

Unoficial \*ts-mode\* in Emacs 29.4
```
(ok) => elisp-ts-mode
(ok) => zig-ts-mode
(not) => lua-ts-mode
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

## Using on Linux
Install __All-The-Icons__
```
M-x all-the-icons-install-fonts
```

## Using on Windows
To use the emacs-client you need to make the [whole system use UTF-8](https://scholarslab.lib.virginia.edu/learn-twarc/08-win-region-settings)