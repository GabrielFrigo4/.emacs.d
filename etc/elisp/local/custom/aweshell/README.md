# Aweshell — Awesome Eshell

> A powerful Emacs Eshell extension with syntax highlighting, auto-suggestions, multiple buffers, and beautiful prompts.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Emacs](https://img.shields.io/badge/Emacs-27.1+-purple.svg)](https://www.gnu.org/software/emacs/)

---

## Features

| Feature                 | Description                                        |
| ----------------------- | -------------------------------------------------- |
| **Multiple Buffers**    | Create and manage multiple eshell sessions         |
| **Syntax Highlighting** | Real-time command validation and highlighting      |
| **Auto-suggestions**    | Fish-like history suggestions with completion      |
| **"Did You Mean"**      | Typo correction for mistyped commands              |
| **Prompt Themes**       | Multiple prompt themes including a zsh-style theme |
| **Unix Aliases**        | Familiar aliases (`ll`, `la`, `clear`, `..`, etc.) |
| **Dedicated Window**    | IDE-style bottom terminal panel                    |
| **Git Completions**     | Tab-complete git commands and branches             |
| **Sudo Toggle**         | Toggle sudo prefix with a keybinding               |
| **Cat Highlighting**    | Syntax-highlighted `cat` output                    |
| **Archive Unpacking**   | Built-in `unpack` command for common archives      |
| **Background Alerts**   | Notifications when background processes finish     |

---

## Prompt Themes

Aweshell supports multiple prompt themes via `eshell-prompt-extras`:

| Theme                             | Style                                                |
| --------------------------------- | ---------------------------------------------------- |
| `epe-theme-pipeline`              | Oh-my-zsh style with user, time, and path (default)  |
| `epe-theme-zshrc`                 | Multi-line zsh replica with OS info, time, date, git |
| `epe-theme-lambda`                | Minimal lambda prompt                                |
| `epe-theme-dakrone`               | Lambda with directory shrinking                      |
| `epe-theme-multiline-with-status` | Multiline with command duration                      |

Set your theme:

```elisp
(setq aweshell-theme 'epe-theme-zshrc)
```

---

## Installation

### Local (Recommended)

Add the aweshell directory to your `load-path`:

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

## Configuration

```elisp
(use-package aweshell
  :commands (aweshell-new aweshell-toggle)
  :config
  ;; Theme selection
  (setq aweshell-theme 'epe-theme-zshrc)

  ;; Disable executable validation for faster input
  (setq aweshell-validate-executable nil)

  ;; Enable fish-like auto-suggestions
  (setq aweshell-auto-suggestion-p t)

  ;; Validation delay (lower = faster, higher = less CPU)
  (setq aweshell-validate-delay (expt 2 -1)))
```

---

## Keybindings

### Default Eshell Keybindings

| Key     | Command             |
| ------- | ------------------- |
| `C-l`   | Clear buffer        |
| `C-S-l` | Toggle sudo         |
| `M-'`   | Search history      |
| `M-h`   | Complete suggestion |

### Unix-like Aliases

| Alias    | Expansion                    |
| -------- | ---------------------------- |
| `clear`  | Full screen clear            |
| `ll`     | `ls -la`                     |
| `la`     | `ls -a`                      |
| `l`      | `ls -l`                      |
| `..`     | `cd ..`                      |
| `...`    | `cd ../..`                   |
| `....`   | `cd ../../..`                |
| `mkdirp` | `mkdir -p`                   |
| `e`      | Open file in Emacs           |
| `ee`     | Open file in other window    |
| `up`     | Navigate to parent directory |
| `unpack` | Extract archive files        |

---

## Interactive Commands

| Command                     | Description                          |
| --------------------------- | ------------------------------------ |
| `aweshell-new`              | Create a new eshell buffer           |
| `aweshell-next`             | Switch to next eshell buffer         |
| `aweshell-prev`             | Switch to previous eshell buffer     |
| `aweshell-toggle`           | Toggle eshell visibility             |
| `aweshell-switch-buffer`    | Select eshell buffer with completion |
| `aweshell-dedicated-toggle` | Toggle dedicated bottom panel        |
| `aweshell-dedicated-open`   | Open dedicated panel                 |
| `aweshell-dedicated-close`  | Close dedicated panel                |
| `aweshell-clear-buffer`     | Clear the eshell buffer              |
| `aweshell-sudo-toggle`      | Toggle sudo for current command      |
| `aweshell-search-history`   | Search through shell history         |

---

## Dependencies

All dependencies are bundled:

- [`eshell-prompt-extras`](https://github.com/kaihaosw/eshell-prompt-extras) — Prompt themes
- [`eshell-did-you-mean`](https://github.com/xuchunyang/eshell-did-you-mean) — Command correction
- [`eshell-up`](https://github.com/peterwvj/eshell-up) — Quick parent directory navigation
- [`exec-path-from-shell`](https://github.com/purcell/exec-path-from-shell) — macOS PATH fix

---

## Credits

- **Original Author:** Andy Stewart (lazycat.manatee@gmail.com)
- **Maintainer:** Gabriel Frigo (gabriel.frigo4@gmail.com)

---

## License

This program is free software; you can redistribute it and/or modify it under the terms of the [GNU General Public License v3.0](LICENSE).
