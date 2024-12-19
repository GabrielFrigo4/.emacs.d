;; ################
;; # Tree-Sitter
;; ################


;; Import *treesit*
(require 'treesit)

;; Set *treesit-font-lock* to Maximun Decoration
(setq-default treesit-font-lock-level 4)

;; Set *treesit-language-source-alist*
(setq treesit-language-source-alist
      '(;; BIN
        (c . ("https://github.com/tree-sitter/tree-sitter-c" "master" "src"))
        (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp" "master" "src"))
        (rust . ("https://github.com/tree-sitter/tree-sitter-rust" "master" "src"))
        (go . ("https://github.com/tree-sitter/tree-sitter-go" "master" "src"))
        ;; JIT
        (c-sharp . ("https://github.com/tree-sitter/tree-sitter-c-sharp" "master" "src"))
        (java . ("https://github.com/tree-sitter/tree-sitter-java" "master" "src"))
        ;; VM
        (python . ("https://github.com/tree-sitter/tree-sitter-python" "master" "src"))
        (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby" "master" "src"))
        ;; WEB
        (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
        (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
        (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
        (css . ("https://github.com/tree-sitter/tree-sitter-css" "master" "src"))
        ;; EMACS
        (elisp . ("https://github.com/Wilfred/tree-sitter-elisp" "main" "src"))
        ;; SHELL
        (bash . ("https://github.com/tree-sitter/tree-sitter-bash" "master" "src"))
        ;; MAKE
        (cmake . ("https://github.com/uyha/tree-sitter-cmake" "master" "src"))
        ;; CONFIG
        (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile" "master" "src"))
        (go-mod . ("https://github.com/camdencheek/tree-sitter-go-mod" "master" "src"))
        ;; DATA
        (json . ("https://github.com/tree-sitter/tree-sitter-json" "master" "src"))
        (toml . ("https://github.com/tree-sitter/tree-sitter-toml" "master" "src"))
        (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "master" "src"))
        ))

;; Set *major-mode-remap-alist*
(setq major-mode-remap-alist
      '(;; BIN
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (rust-mode . rust-ts-mode)
        (go-mode . go-ts-mode)
        ;; JIT
        (csharp-mode . csharp-ts-mode)
        (java-mode . java-ts-mode)
        ;; VM
        (python-mode . python-ts-mode)
        (ruby-mode . ruby-ts-mode)
        ;; WEB
        (js-mode . js-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (tsx-mode . tsx-ts-mode)
        (css-mode . css-ts-mode)
        ;; EMACS
        (emacs-lisp-mode . emacs-lisp-ts-mode)
        ;; SHELL
        (bash-mode . bash-ts-mode)
        ;; MAKE
        (cmake-mode . cmake-ts-mode)
        ;; CONFIG
        (dockerfile-mode . dockerfile-ts-mode)
        (go-mod-mode . go-mod-ts-mode)
        ;; DATA
        (json-mode . json-ts-mode)
        (toml-mode . toml-ts-mode)
        (yaml-mode . yaml-ts-mode)
        ))

;; Def *tree-sitter-setup*
(defun tree-sitter-setup ()
  (interactive)
  (dolist (source treesit-language-source-alist)
    (treesit-install-language-grammar (car source))))
