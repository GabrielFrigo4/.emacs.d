# Aweww — Awesome EWW

> A configuration layer and extension for the built-in Emacs Web Wowser (EWW) browser, providing enhanced readability, code highlighting, and intuitive keybindings.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Emacs](https://img.shields.io/badge/Emacs-29.1+-purple.svg)](https://www.gnu.org/software/emacs/)

---

## Features

| Feature                 | Description                                                   |
| ----------------------- | ------------------------------------------------------------- |
| **Dynamic Width**       | Content width adapts to your frame size automatically         |
| **Shrface Integration** | Enhanced faces, headings, and org-like rendering              |
| **Code Highlighting**   | Syntax-highlighted `<pre>` blocks via `shr-tag-pre-highlight` |
| **Readable Toggle**     | One-key toggle for `eww-readable` mode                        |
| **Image Toggle**        | Enable/disable images with a keybinding                       |
| **Color Toggle**        | Enable/disable CSS colors with a keybinding                   |
| **Newline Cleanup**     | Removes excessive blank lines after rendering                 |
| **Visual Line Mode**    | Comfortable word-wrap for reading                             |

---

## Keybindings

| Key | Command                 | Description              |
| --- | ----------------------- | ------------------------ |
| `R` | `aweww-toggle-readable` | Toggle readable mode     |
| `I` | `aweww-toggle-images`   | Toggle images on/off     |
| `C` | `aweww-toggle-colors`   | Toggle CSS colors on/off |
| `H` | `eww-list-histories`    | Show browsing history    |
| `B` | `eww-back-url`          | Go back                  |
| `F` | `eww-forward-url`       | Go forward               |
| `q` | `quit-window`           | Close EWW buffer         |

---

## Installation

### Local (Recommended)

Add the aweww directory to your `load-path`:

```elisp
(add-to-list 'load-path (expand-file-name "path/to/aweww"))
(require 'aweww)
```

### Quelpa

```elisp
(use-package aweww
  :quelpa (aweww :fetcher github :repo "GabrielFrigo4/aweww"))
```

### Elpaca

```elisp
(use-package aweww
  :ensure (:type git :host github :repo "GabrielFrigo4/aweww"))
```

---

## Configuration

```elisp
(require 'aweww)

;; Enable auto-readable mode (disabled by default)
(setq aweww-auto-readable t)

;; Adjust width offset (default: 8 columns from frame edge)
(setq aweww-default-width-offset 8)
```

---

## Dependencies

Aweww works standalone but is enhanced with these optional packages:

- [`shrface`](https://github.com/chenyanming/shrface) — Better faces, headings, and org-like features
- [`shr-tag-pre-highlight`](https://github.com/xuchunyang/shr-tag-pre-highlight.el) — Syntax highlighting for `<pre>` code blocks

If these are not installed, Aweww gracefully degrades to standard EWW rendering.

---

## Usage

Simply use `M-x aweww` (or `M-x eww`) to start browsing. All enhancements are loaded automatically.

---

## Author

**Gabriel Frigo** (gabriel.frigo4@gmail.com)

---

## License

This project is licensed under the [MIT License](LICENSE).
