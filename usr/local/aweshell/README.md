# 🐚 Aweshell — Awesome Eshell

> A meticulously crafted, powerful Eshell extension bringing syntax highlighting, intelligent auto-suggestions, and a stunning terminal experience right into your Emacs.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Emacs](https://img.shields.io/badge/Emacs-27.1+-purple.svg)](https://www.gnu.org/software/emacs/)

**Aweshell** supercharges the default Emacs shell (Eshell) by bridging the gap between typical modern terminals (like Zsh/Fish) and the Emacs ecosystem. With dedicated IDE-like panels, gorgeous prompt themes, and typo-corrections, it creates a robust and aesthetically pleasing command-line workflow.

---

## ✨ Features

| Feature                 | Description                                                  |
| :---------------------- | :----------------------------------------------------------- |
| **Multiple Sessions**   | Effortlessly create, switch, and manage multiple shell buffers. |
| **Syntax Highlighting** | Real-time command validation: valid commands are highlighted instantly. |
| **Auto-Suggestions**    | Fish-style intelligent history suggestions with seamless completion. |
| **"Did You Mean?"**     | Automatic typo detection and correction for mistyped commands. |
| **Beautiful Prompts**   | Multiple out-of-the-box themes, including an Oh-My-Zsh replica. |
| **Unix Aliases**        | Familiar Unix muscle memory (`ll`, `clear`, `..`, `unpack`). |
| **Dedicated Panel**     | Pop up an IDE-style bottom terminal window on demand.        |
| **Git Completions**     | Native tab-completion for Git commands, branches, and tags.  |
| **Sudo Toggle**         | Swiftly prepend or toggle `sudo` for your current command line. |
| **Highlighted Cat**     | Built-in syntax highlighting for `cat` command output.       |
| **Background Alerts**   | Visual notifications when a background process finishes.     |

---

## 🎨 Prompt Themes

Aweshell supports multiple prompt themes powered by `aweshell-theme`. You can easily match your terminal's vibe to your Emacs setup.

| Theme | Style |
| :--- | :--- |
| `aweshell/theme-theme-pipeline` | Oh-my-zsh style (Powerline) with user, time, and path blocks. |
| `aweshell/theme-theme-zshrc` | Multi-line Zsh replica featuring OS info, date, time, and Git status. |
| `aweshell/theme-theme-lambda` | Clean, minimal lambda prompt. |
| `aweshell/theme-theme-dakrone` | Minimal lambda with smart directory shrinking. |
| `aweshell/theme-theme-multiline-with-status` | Multi-line prompt that includes command execution duration. |

**Setting your theme:**

```elisp
(setq aweshell/theme 'aweshell/theme-theme-zshrc)
```

---

## 🚀 Installation

### Local (Recommended)

Clone the repository and add it to your Emacs `load-path`:

```elisp
(add-to-list 'load-path (expand-file-name "path/to/aweshell"))
(require 'aweshell)
```

### Quelpa

```elisp
(use-package aweshell
  :quelpa (aweshell :fetcher github :repo "GabrielFrigo4/aweshell"))
```

### Elpaca

```elisp
(use-package aweshell
  :ensure (:type git :host github :repo "GabrielFrigo4/aweshell"))
```

---

## ⚙️ Configuration

A fully featured configuration utilizing `use-package`:

```elisp
(use-package aweshell
  :commands (aweshell/new aweshell/toggle)
  :config
  ;; Select your favorite prompt theme
  (setq aweshell/theme 'aweshell/theme-theme-zshrc)

  ;; Toggle Fish-style auto-suggestions
  (setq aweshell/auto-suggestion-p t)

  ;; Enable or disable executable validation (disable for faster input)
  (setq aweshell/validate-executable t)

  ;; Adjust validation delay (lower = faster, higher = saves CPU)
  (setq aweshell/validate-delay (expt 2 -1)))
```

---

## ⌨️ Keybindings & Shortcuts

### Essential Eshell Bindings

| Key | Command | Action |
| :---: | :--- | :--- |
| `C-l` | `aweshell/clear-buffer` | Clear the terminal buffer |
| `C-S-l` | `aweshell/sudo-toggle` | Toggle `sudo` on current command |
| `M-'` | `aweshell/search-history` | Interactive history search |
| `M-h` | `aweshell/insert-suggestion` | Accept auto-suggestion |

### Interactive Panel & Buffer Management

| Command | Description |
| :--- | :--- |
| `aweshell/new` | Spawn a brand new Eshell session |
| `aweshell/next` | Cycle to the next Aweshell buffer |
| `aweshell/prev` | Cycle to the previous Aweshell buffer |
| `aweshell/switch-buffer` | Select a specific Aweshell buffer via prompt |
| `aweshell/dedicated-toggle` | Toggle the IDE-style bottom panel |

### Built-in Unix Aliases

Aweshell automatically sets up aliases to save you keystrokes:

| Alias | Expansion |
| :---: | :--- |
| `ll` / `la` / `l` | `ls -la` / `ls -a` / `ls -l` |
| `..` / `...` | `cd ..` / `cd ../..` |
| `mkdirp` | `mkdir -p` |
| `e` / `ee` | Open file in Emacs / Open in other window |
| `up` | Quickly navigate up the directory tree |
| `unpack` | Universal extraction for `.tar`, `.gz`, `.zip`, etc. |

---

## 📦 Bundled Dependencies

For your convenience, Aweshell tightly integrates and bundles its dependencies to provide a zero-friction setup:

- **Prompt Themes:** Integrated natively via `aweshell-theme`.
- **Typo Correction:** Integrated natively via `aweshell-did-you-mean`.
- **Fast Navigation:** Integrated natively via `aweshell-up`.
- **Environment Parity:** Integrated natively via `aweshell-exec-path` (Fixes macOS/Linux GUI `$PATH` issues).

---

## 👨‍💻 Credits & License

- **Original Author:** Andy Stewart (lazycat.manatee@gmail.com)
- **Maintainer:** Gabriel Frigo (gabriel.frigo4@gmail.com)

This program is free software; you can redistribute it and/or modify it under the terms of the [GNU General Public License v3.0](LICENSE).
