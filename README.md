# Emacs
 Emacs config

 This repository is the configuration of the Emacs code editor that Gabriel Frigo uses

## TODO
 Todo List (Emacs Current)
 ```
 Update: [aweshell, highlight strings and numbers]
 ```

 Todo List (Emacs 31)
 ```
 Add: [DirectWrite BackEngine Font on Windows]
 ```

## Treesit
 Oficial \*ts-mode\* in Emacs 30.1
 ```
 (ok) => c-ts-mode
 (ok) => go-ts-mode
 (ok) => js-ts-mode
 (ok) => c++-ts-mode
 (ok) => css-ts-mode
 (ok) => lua-ts-mode
 (ok) => php-ts-mode
 (ok) => tsx-ts-mode
 (ok) => bash-ts-mode
 (ok) => heex-ts-mode
 (ok) => html-ts-mode
 (ok) => java-ts-mode
 (ok) => json-ts-mode
 (ok) => ruby-ts-mode
 (ok) => rust-ts-mode
 (ok) => toml-ts-mode
 (ok) => yaml-ts-mode
 (ok) => cmake-ts-mode
 (ok) => csharp-ts-mode
 (ok) => elixir-ts-mode
 (ok) => go-mod-ts-mode
 (ok) => python-ts-mode
 (ok) => c-or-c++-ts-mode
 (ok) => dockerfile-ts-mode
 (ok) => typescript-ts-mode
 ```

 Unoficial \*ts-mode\* in Emacs 30.1
 ```
 (ok) => haskell-ts-mode
 (ok) => zig-ts-mode
 ```

 Custom \*ts-mode\* in Emacs 30.1
 ```
 (ok) => common-lisp-ts-mode
 (ok) => emacs-lisp-ts-mode
 ```

 Debug Grammar / Explore Grammar
 ```elisp
 (treesit-explore-mode t)
 ```

## Elisp Symbols
 Get Symbols
 ```elisp
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
 ```elisp
 (let ((xbuff (generate-new-buffer "*output-variables*")))
   (with-output-to-temp-buffer xbuff
     (dolist (v variable-names)
       (print v))
     ))
 ```

 Show Functions
 ```elisp
 (let ((xbuff (generate-new-buffer "*output-functions*")))
   (with-output-to-temp-buffer xbuff
     (dolist (f function-names)
       (print f))
     ))
 ```

 Show Macros
 ```elisp
 (let ((xbuff (generate-new-buffer "*output-macros*")))
   (with-output-to-temp-buffer xbuff
     (dolist (m macro-names)
       (print m))
     ))
 ```

## Font
 RobotoMono Nerd Font - Italic
 ``` elisp
 ;; For "RobotoMono Nerd Font", We Need to Separately Specify the Italic Mode to Work
 (set-face-attribute 'italic nil :font "RobotoMono Nerd Font Mono" :foundry "pyrs" :slant 'italic)
 ```

## Install Emacs Application Framework (EAF)
 [__Install Emacs Application Framework__](https://github.com/emacs-eaf/emacs-application-framework) is a free/libre and open-source extensible framework that revolutionizes the graphical capabilities of Emacs.
 The key to ultimately Live in Emacs

### Linux
 ```zsh
 git clone --depth=1 -b master "https://github.com/emacs-eaf/emacs-application-framework.git" "$HOME/.emacs.d/eaf/emacs-application-framework/"
 cd "$HOME/.emacs.d/eaf/emacs-application-framework/"
 chmod +x ./install-eaf.py
 ./install-eaf.py
 ```

### Windows
 ```pwsh
 git clone --depth=1 -b master "https://github.com/emacs-eaf/emacs-application-framework.git" "$HOME/.emacs.d/eaf/emacs-application-framework/"
 cd "$HOME/.emacs.d/eaf/emacs-application-framework/"
 python install-eaf.py
 python install-eaf.py --install "browser"
 python install-eaf.py --install "pdf-viewer"
 python install-eaf.py --install "music-player"
 python install-eaf.py --install "video-player"
 python install-eaf.py --install "image-viewer"
 python install-eaf.py --install "file-manager"
 python install-eaf.py --install "pyqterminal"
 python install-eaf.py --install "terminal"
 python install-eaf.py --install "camera"
 python install-eaf.py --install "git"
 ```

## Using on Linux
 Install __All-The-Icons__
 ```
 M-x all-the-icons-install-fonts
 ```

## Using on Windows
 Install __All-The-Icons__
 ```
 M-x all-the-icons-install-fonts
 ```
 This function will prompt for a download directory for you to install them manually.

 To use the emacs-client you need to make the [whole system use UTF-8](https://scholarslab.lib.virginia.edu/learn-twarc/08-win-region-settings)
