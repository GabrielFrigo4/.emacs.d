# 🌐 Aweww — Awesome EWW

> An elegant, readable, and modern extension for Emacs Web Wowser (EWW).

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Emacs](https://img.shields.io/badge/Emacs-29.1+-purple.svg)](https://www.gnu.org/software/emacs/)

**Aweww** transforms the standard Emacs EWW browser into a powerful reading tool. It brings dynamic widths, beautiful typography, code highlighting, and one-key toggles for distraction-free browsing right into your Emacs frame.

---

## ✨ Features

| Feature | Description |
| :--- | :--- |
| **Responsive Width** | The text content automatically scales to your frame size for comfortable reading. |
| **Shrface Integration** | Enjoy enhanced typography, Org-mode-like headings, and polished faces. |
| **Code Highlighting** | Automatic syntax highlighting for `<pre>` blocks using `shr-tag-pre-highlight`. |
| **One-Click Readability** | Instantly toggle the `eww-readable` mode to remove web clutter. |
| **Media & Style Toggles** | Swiftly enable or disable images and CSS colors to save bandwidth or reduce glare. |
| **Smart Cleanup** | Automatically removes excessive whitespace and blank lines post-render. |

---

## ⌨️ Keybindings

Aweww provides a streamlined, modal-like experience when browsing:

| Key | Command | Action |
| :---: | :--- | :--- |
| `R` | `aweww/toggle-readable` | Toggle distraction-free readable mode |
| `I` | `aweww/toggle-images` | Toggle images rendering |
| `C` | `aweww/toggle-colors` | Toggle CSS colors |
| `H` | `eww-list-histories` | Open browsing history |
| `B` | `eww-back-url` | Navigate backward |
| `F` | `eww-forward-url` | Navigate forward |
| `q` | `quit-window` | Close the EWW buffer gracefully |

---

## 🚀 Installation

### Local (Recommended)

Clone the repository and add it to your Emacs `load-path`:

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

## ⚙️ Configuration

Aweww comes with sensible defaults, but it is fully customizable:

```elisp
(use-package aweww
  :config
  ;; Automatically trigger readable mode upon loading a page (default: nil)
  (setq aweww/auto-readable t)

  ;; Set the dynamic width margin from the frame edge (default: 8)
  (setq aweww/default-width-offset 8))
```

---

## 📦 Dependencies

Aweww is designed to work standalone, gracefully falling back to standard EWW rendering. However, for the ultimate experience, we recommend having:

- [`shrface`](https://github.com/chenyanming/shrface) — For Org-like heading faces and beautiful typography.
- [`shr-tag-pre-highlight`](https://github.com/xuchunyang/shr-tag-pre-highlight) — For robust syntax highlighting in code blocks.

---

## 👨‍💻 Usage

Fire up your browser with `M-x aweww` or the standard `M-x eww`. All enhancements, custom faces, and keybindings will be loaded seamlessly.

---

## 📄 License & Credits

- **Author & Maintainer:** Gabriel Frigo (gabriel.frigo4@gmail.com)
- **License:** MIT
