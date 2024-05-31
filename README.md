# Emacs
Emacs config

This repository is the configuration of the Emacs code editor that Gabriel Frigo uses

## TODO
Melhorar
```
Atualizar Python
Atualizar Lua
Atualizar C/C++
```

Fazer
```
Atualizar Brilho dos Numeros
Atualizar NASM
Atualizar FASM
Atualizar ASM
Atualizar Lisp
```


## Elisp Symbols
Show Functions
``` elisp
(let ((xbuff (generate-new-buffer "*output-functions*")))
  (with-output-to-temp-buffer xbuff
    (dolist (f function-names)
      (prin1 f)
      (prin1 "\n"))
    ))
```

Show Variables
``` elisp
(let ((xbuff (generate-new-buffer "*output-variables*")))
  (with-output-to-temp-buffer xbuff
    (dolist (v variable-names)
      (prin1 v)
      (prin1 "\n"))
    ))
```

## Add TreeSitter
Eu decidi parar de usar TreeSitter no Emacs. Já que apesar de ser nativo
O style do Emacs e o do TreeSitter no momento são incompatíveis e isso
atrapalhava para eu padronizar o meu emacs...

Add in settings.el
``` elisp
;; Install Treesit-Auto
(unless (package-installed-p 'treesit-auto)
  (package-install 'treesit-auto))
(use-package treesit-auto
  :custom
  (treesit-auto-install 't)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))
```

Add in init.el
``` elisp
(custom-set-variables
 '(package-selected-packages
   '(treesit-auto))
)
```

## Using on LINUX
Install __All-The-Icons__ and __Tree-Sitter__
```
M-x all-the-icons-install-fonts
M-x treesit-auto-install-all
```

## Using on WINDOWS
Install __Tree-Sitter__
```
M-x treesit-auto-install-all
```
