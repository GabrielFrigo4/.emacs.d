# Emacs
 Emacs config

 This repository is the configuration of the Emacs code editor that Gabriel Frigo uses

## TODO
 Todo List (Emacs Current)
 ```
 Update: [CommonLisp]
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
 ./install-eaf.py --install "browser"
 ./install-eaf.py --install "pdf-viewer"
 ./install-eaf.py --install "music-player"
 ./install-eaf.py --install "video-player"
 ./install-eaf.py --install "image-viewer"
 ./install-eaf.py --install "file-manager"
 ./install-eaf.py --install "pyqterminal"
 ./install-eaf.py --install "terminal"
 ./install-eaf.py --install "camera"
 ./install-eaf.py --install "git"
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

## Using Nerd-Icons on Linux
 Install __Nerd-Icons__
 ```
 M-x nerd-icons-install-fonts
 ```

## Using Nerd-Icons on Windows
 Install __Nerd-Icons__
 ```
 M-x nerd-icons-install-fonts
 ```
 This function will prompt for a download directory for you to install them manually.

## ⚠️ Windows Prerequisites
 If you are running Emacs on Windows, the following configurations are **mandatory** to avoid installation errors and encoding issues.

### 1. Enable Developer Mode (Crucial for Elpaca)
 To allow the package manager (`elpaca`) to create symbolic links and avoid *"Operation not permitted"* errors:

 1.  Open **Settings**.
 2.  Navigate to:
     * **Windows 11:** `System > For developers`
     * **Windows 10:** `Update & Security > For developers`
 3.  Switch the **Developer Mode** toggle to **"On"**.

### 2. Windows Defender Exclusions (Performance & Stability)
 To prevent Git processes from being blocked (causing *"Too many open files"* errors) and to speed up package installation:

 1.  Go to **Settings > Privacy & security > Windows Security**.
 2.  Click on **Virus & threat protection**.
 3.  Under *Virus & threat protection settings*, click **Manage settings**.
 4.  Scroll down to *Exclusions* and click **Add or remove exclusions**.
 5.  Add your Emacs configuration folder: `C:\Users\YOUR_USERNAME\.emacs.d`

### 3. Enable Global UTF-8 Support
 To ensure `emacs-client` functions correctly and to prevent character encoding bugs:

 1.  Go to **Settings > Time & Language > Language & Region**.
 2.  Click on **Administrative language settings** (or related settings).
 3.  Click **Change system locale...**
 4.  Check the box: **"Beta: Use Unicode UTF-8 for worldwide language support"**.
 5.  Restart your computer.

 > **Guides:** [Windows 10 Guide](https://scholarslab.lib.virginia.edu/learn-twarc/08-win-region-settings) | [Windows 11 Guide](https://windows.atsit.in/32315/)
