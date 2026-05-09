;; ============================================================================
;;  TREE-SITTER FEATURE
;; ============================================================================

(defvar feature-treesit-enable-ts-modes nil
  "Toggle to enable or disable major-mode-remap-alist for Tree-sitter.")

;; ----------------------------------------------------------------------------
;;  GRAMMAR SOURCES
;; ----------------------------------------------------------------------------

(setq treesit-language-source-branch-alist
      '((bash        "https://github.com/tree-sitter/tree-sitter-bash")
        (c           "https://github.com/tree-sitter/tree-sitter-c")
        (c-sharp     "https://github.com/tree-sitter/tree-sitter-c-sharp")
        (cmake       "https://github.com/uyha/tree-sitter-cmake")
        (common-lisp "https://github.com/theHamsta/tree-sitter-commonlisp")
        (cpp         "https://github.com/tree-sitter/tree-sitter-cpp")
        (css         "https://github.com/tree-sitter/tree-sitter-css")
        (dockerfile  "https://github.com/camdencheek/tree-sitter-dockerfile")
        (elixir      "https://github.com/elixir-lang/tree-sitter-elixir")
        (elisp       "https://github.com/Wilfred/tree-sitter-elisp")
        (glsl        "https://github.com/tree-sitter-grammars/tree-sitter-glsl")
        (go          "https://github.com/tree-sitter/tree-sitter-go")
        (haskell     "https://github.com/tree-sitter/tree-sitter-haskell")
        (html        "https://github.com/tree-sitter/tree-sitter-html")
        (java        "https://github.com/tree-sitter/tree-sitter-java")
        (javascript  "https://github.com/tree-sitter/tree-sitter-javascript")
        (json        "https://github.com/tree-sitter/tree-sitter-json")
        (lua         "https://github.com/Azganoth/tree-sitter-lua")
        (make        "https://github.com/alemuller/tree-sitter-make")
        (markdown    "https://github.com/ikatyang/tree-sitter-markdown")
        (mermaid     "https://github.com/monaqa/tree-sitter-mermaid")
        (php         "https://github.com/tree-sitter/tree-sitter-php")
        (python      "https://github.com/tree-sitter/tree-sitter-python")
        (ruby        "https://github.com/tree-sitter/tree-sitter-ruby")
        (rust        "https://github.com/tree-sitter/tree-sitter-rust")
        (toml        "https://github.com/ikatyang/tree-sitter-toml")
        (tsx         "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript  "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml        "https://github.com/ikatyang/tree-sitter-yaml")
        (zig         "https://github.com/maxxnino/tree-sitter-zig")))

;; ----------------------------------------------------------------------------
;;  MODE REMAPPING
;; ----------------------------------------------------------------------------

(defun treesit-apply-remaps ()
  "Apply major-mode-remap-alist based on the central toggle."
  (if feature-treesit-enable-ts-modes
      (setq major-mode-remap-alist
            '((c-mode           . c-ts-mode)
              (c++-mode         . c++-ts-mode)
              (c-or-c++-mode    . c-or-c++-ts-mode)
              (rust-mode        . rust-ts-mode)
              (go-mode          . go-ts-mode)
              (csharp-mode      . csharp-ts-mode)
              (java-mode        . java-ts-mode)
              (elixir-mode      . elixir-ts-mode)
              (php-mode         . php-ts-mode)
              (lua-mode         . lua-ts-mode)
              (python-mode      . python-ts-mode)
              (ruby-mode        . ruby-ts-mode)
              (js2-mode         . js-ts-mode)
              (javascript-mode  . js-ts-mode)
              (typescript-mode  . typescript-ts-mode)
              (tsx-mode         . tsx-ts-mode)
              (html-mode        . html-ts-mode)
              (css-mode         . css-ts-mode)
              (sh-mode          . bash-ts-mode)
              (cmake-mode       . cmake-ts-mode)
              (dockerfile-mode  . dockerfile-ts-mode)
              (json-mode        . json-ts-mode)
              (conf-toml-mode   . toml-ts-mode)
              (yaml-mode        . yaml-ts-mode)
              (haskell-mode     . haskell-ts-mode)
              (zig-mode         . zig-ts-mode)
              (common-lisp-mode . common-lisp-ts-mode)
              (emacs-lisp-mode  . emacs-lisp-ts-mode)))
    (setq major-mode-remap-alist nil)))

(treesit-apply-remaps)

;; ----------------------------------------------------------------------------
;;  SETUP COMMANDS
;; ----------------------------------------------------------------------------

(setq-default treesit-language-source-alist
              (mapcar (lambda (item)
                        (let ((lang (car item))
                              (spec (cdr item)))
                          (list lang (nth 0 spec) (nth 1 spec) (nth 2 spec))))
                      treesit-language-source-branch-alist))

(defun tree-sitter-setup ()
  "Setup and install all Tree-sitter grammars."
  (interactive)
  (let ((out-dir (expand-file-name "lib/tree-sitter" var-dir)))
    (unless (file-exists-p out-dir) (make-directory out-dir t))
    (dolist (source treesit-language-source-alist)
      (treesit-install-language-grammar (car source) out-dir)))
  (message "Tree-sitter setup completed."))

(provide 'feature-treesit)
