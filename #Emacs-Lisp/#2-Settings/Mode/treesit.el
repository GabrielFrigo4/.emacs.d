;; ################
;; # Treesit
;; ################


;; Import *treesit*
(require 'treesit)

;; Set *treesit-font-lock* to Maximun Decoration
(setq-default treesit-font-lock-level 4)

;; Set *treesit-language-source-alist*
(setq-default treesit-language-source-alist
              '(;; BIN
                (c . ("https://github.com/tree-sitter/tree-sitter-c" "master" "src"))
                (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp" "master" "src"))
                (rust . ("https://github.com/tree-sitter/tree-sitter-rust" "master" "src"))
                (zig . ("https://github.com/maxxnino/tree-sitter-zig" "main" "src"))
                (go . ("https://github.com/tree-sitter/tree-sitter-go" "master" "src"))
                ;; JIT
                (c-sharp . ("https://github.com/tree-sitter/tree-sitter-c-sharp" "master" "src"))
                (java . ("https://github.com/tree-sitter/tree-sitter-java" "master" "src"))
                (elixir . ("https://github.com/elixir-lang/tree-sitter-elixir" "main" "src"))
                (php . ("https://github.com/tree-sitter/tree-sitter-php" "master" "php/src"))
                ;; VM
                (lua . ("https://github.com/tree-sitter-grammars/tree-sitter-lua" "main" "src"))
                (python . ("https://github.com/tree-sitter/tree-sitter-python" "master" "src"))
                (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby" "master" "src"))
                (commonlisp . ("https://github.com/tree-sitter-grammars/tree-sitter-commonlisp" "master" "src"))
                ;; WEB
                (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
                (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
                (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
                (html . ("https://github.com/tree-sitter/tree-sitter-html" "master" "src"))
                (css . ("https://github.com/tree-sitter/tree-sitter-css" "master" "src"))
                ;; EMACS
                (elisp . ("https://github.com/Wilfred/tree-sitter-elisp" "main" "src"))
                ;; SHELL
                (bash . ("https://github.com/tree-sitter/tree-sitter-bash" "master" "src"))
                ;; MAKE
                (cmake . ("https://github.com/uyha/tree-sitter-cmake" "master" "src"))
                ;; CONFIG
                (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile" "main" "src"))
                (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod" "main" "src"))
                (heex . ("https://github.com/phoenixframework/tree-sitter-heex" "main" "src"))
                ;; DATA
                (json . ("https://github.com/tree-sitter/tree-sitter-json" "master" "src"))
                (toml . ("https://github.com/tree-sitter/tree-sitter-toml" "master" "src"))
                (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "master" "src"))
                ;; DOC
                (phpdoc . ("https://github.com/claytonrcarter/tree-sitter-phpdoc" "master" "src"))
                (luadoc . ("https://github.com/tree-sitter-grammars/tree-sitter-luadoc" "master" "src"))
                (jsdoc . ("https://github.com/tree-sitter/tree-sitter-jsdoc" "master" "src"))
                ;; PATTERN
                (luap . ("https://github.com/tree-sitter-grammars/tree-sitter-luap" "master" "src"))))

;; Set *major-mode-remap-alist*
(setq-default major-mode-remap-alist
              '(;; BIN
                (c-mode . c-ts-mode)
                (c++-mode . c++-ts-mode)
                (c-or-c++-mode . c-or-c++-ts-mode)
                (rust-mode . rust-ts-mode)
                (zig-mode . zig-ts-mode)
                (go-mode . go-ts-mode)
                ;; JIT
                (csharp-mode . csharp-ts-mode)
                (java-mode . java-ts-mode)
                (elixir-mode . elixir-ts-mode)
                (php-mode . php-ts-mode)
                ;; VM
                (lua-mode . lua-ts-mode)
                (python-mode . python-ts-mode)
                (ruby-mode . ruby-ts-mode)
                (common-lisp-mode . common-lisp-ts-mode)
                ;; WEB
                (js-mode . js-ts-mode)
                (typescript-mode . typescript-ts-mode)
                (tsx-mode . tsx-ts-mode)
                (html-mode . html-ts-mode)
                (css-mode . css-ts-mode)
                ;; EMACS
                (emacs-lisp-mode . emacs-lisp-ts-mode)
                ;; SHELL
                (bash-mode . bash-ts-mode)
                ;; MAKE
                (cmake-mode . cmake-ts-mode)
                ;; CONFIG
                (dockerfile-mode . dockerfile-ts-mode)
                ;; DATA
                (json-mode . json-ts-mode)
                (toml-mode . toml-ts-mode)
                (yaml-mode . yaml-ts-mode)))

;; Set *treesit-load-name-override-list*
(setq-default treesit-load-name-override-list '())

;; Def *tree-sitter-setup*
(defun tree-sitter-setup ()
  (interactive)
  (dolist (source treesit-language-source-alist)
    (treesit-install-language-grammar (car source))))
