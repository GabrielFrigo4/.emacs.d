# Gabriel Frigo's Emacs Configuration

This repository is the configuration of the Emacs code editor that Gabriel Frigo uses.

---

## TODO

### Todo List (Emacs Current)

```
Update: [Common Lisp]
Update: [Emacs Lisp]
Remake: [Aweshell]
Remake: [Aweww]
```

### Todo List (Emacs 31)

```
Add: [DirectWrite BackEngine Font on Windows]
```

---

## Treesit

### Oficial \*ts-mode\* in Emacs 30.1

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

### Unoficial \*ts-mode\* in Emacs 30.1

```
(ok) => haskell-ts-mode
(ok) => zig-ts-mode
(ok) => glsl-ts-mode
(ok) => markdown-ts-mode
(ok) => mermaid-ts-mode
```

### Custom \*ts-mode\* in Emacs 30.1

```
(up) => common-lisp-ts-mode
(up) => emacs-lisp-ts-mode
```

### Debug Grammar / Explore Grammar

```elisp
(treesit-explore-mode 1)
```

---

## Elisp Symbols

### Get Symbols

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

### Show Variables

```elisp
(let ((xbuff (generate-new-buffer "*output-variables*")))
  (with-output-to-temp-buffer xbuff
    (dolist (v variable-names)
      (print v))
    ))
```

### Show Functions

```elisp
(let ((xbuff (generate-new-buffer "*output-functions*")))
  (with-output-to-temp-buffer xbuff
    (dolist (f function-names)
      (print f))
    ))
```

### Show Macros

```elisp
(let ((xbuff (generate-new-buffer "*output-macros*")))
  (with-output-to-temp-buffer xbuff
    (dolist (m macro-names)
      (print m))
    ))
```

---

## Font

### RobotoMono Nerd Font - Italic

```elisp
;; For "RobotoMono Nerd Font", We Need to Separately Specify the Italic Mode to Work
(set-face-attribute 'italic nil :font "RobotoMono Nerd Font Mono" :foundry "pyrs" :slant 'italic)
```

---

## Install Emacs Application Framework (EAF)

[**Install Emacs Application Framework**](https://github.com/emacs-eaf/emacs-application-framework) is a free/libre and open-source extensible framework that revolutionizes the graphical capabilities of Emacs.
The key to ultimately Live in Emacs.

### Linux

```zsh
git clone --depth=1 -b master "https://github.com/emacs-eaf/emacs-application-framework.git" "${HOME}/.emacs.d/opt/eaf/emacs-application-framework/"
cd "${HOME}/.emacs.d/opt/eaf/emacs-application-framework/"
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
git clone --depth=1 -b master "https://github.com/emacs-eaf/emacs-application-framework.git" "$HOME/.emacs.d/opt/eaf/emacs-application-framework/"
cd "$HOME/.emacs.d/opt/eaf/emacs-application-framework/"
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

---

## Nerd-Icons

Install **Nerd-Icons** from within Emacs:

```elisp
M-x nerd-icons-install-fonts
```

### Linux

On Linux, you can also install the fonts manually to your system:

```bash
mkdir -p "${HOME}/.local/share/fonts"
cd "${HOME}/.local/share/fonts"
wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip"
unzip -o NerdFontsSymbolsOnly.zip
rm NerdFontsSymbolsOnly.zip
fc-cache -fv
cd -
```

### Windows

On Windows, running the `M-x nerd-icons-install-fonts` function inside Emacs will prompt for a download directory for you to install the fonts manually.

---

## Emacs Server / Daemon Configuration

When running Emacs as a daemon (`emacs --daemon`) and connecting via `emacsclient`, there is a key difference between Unix-like systems (Linux, FreeBSD, macOS) and Windows.

### Unix-like (Linux / FreeBSD / macOS)

On Unix systems, Emacs uses **Unix Domain Sockets** for communication, which are faster and more secure.

- **Variable**: `EMACS_SOCKET_NAME`
- **Setup**: If you want to use a custom socket directory (e.g., `"${HOME}/.emacs.d/var/server/auth/"`), you must ensure the directory exists and has strict `0700` permissions, otherwise the Emacs server will refuse to start for security reasons.

```bash
# Create the Directory
mkdir -p "${HOME}/.emacs.d/var/server/auth/"

# Restrict Permissions (Crucial for Emacs Server)
chmod 0700 "${HOME}/.emacs.d/var/server/auth/"
```

In your terminal configuration (`.bashrc` ou `.zshrc`), export the path using `EMACS_SOCKET_NAME`:

```bash
export EMACS_SOCKET_NAME="${HOME}/.emacs.d/var/server/auth/server"
```

### Windows

On Windows, Emacs traditionally uses a **TCP Server** instead of local sockets. It writes a plain text file containing the connection credentials (IP, port, and a secure auth key).

- **Variable**: `EMACS_SERVER_FILE`
- **Setup**: In your terminal configuration, export the path using `EMACS_SERVER_FILE`. The `emacsclient` will read this text file to know how to connect over TCP.

```pwsh
$env:EMACS_SERVER_FILE = "$HOME\.emacs.d\var\server\auth\server"
```

---

## ⚠️ Windows Prerequisites

If you are running Emacs on Windows, the following configurations are **mandatory** to avoid installation errors and encoding issues.

### 1. Enable Developer Mode (Crucial for Elpaca)

To allow the package manager (`elpaca`) to create symbolic links and avoid _"Operation not permitted"_ errors:

1.  Open **Settings**.
2.  Navigate to:
    - **Windows 11:** `System > For developers`
    - **Windows 10:** `Update & Security > For developers`
3.  Switch the **Developer Mode** toggle to **"On"**.

### 2. Windows Defender Exclusions (Performance & Stability)

To prevent Git processes from being blocked (causing _"Too many open files"_ errors) and to speed up package installation:

1.  Go to **Settings > Privacy & security > Windows Security**.
2.  Click on **Virus & threat protection**.
3.  Under _Virus & threat protection settings_, click **Manage settings**.
4.  Scroll down to _Exclusions_ and click **Add or remove exclusions**.
5.  Add your Emacs configuration folder: `C:\Users\YOUR_USERNAME\.emacs.d`

### 3. Enable Global UTF-8 Support

To ensure `emacsclient` functions correctly and to prevent character encoding bugs:

1.  Go to **Settings > Time & Language > Language & Region**.
2.  Click on **Administrative language settings** (or related settings).
3.  Click **Change system locale...**
4.  Check the box: **"Beta: Use Unicode UTF-8 for worldwide language support"**.
5.  Restart your computer.

> **Guides:** [Windows 10 Guide](https://scholarslab.lib.virginia.edu/learn-twarc/08-win-region-settings) | [Windows 11 Guide](https://windows.atsit.in/32315/)
