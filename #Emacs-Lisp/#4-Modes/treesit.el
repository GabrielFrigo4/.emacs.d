;; ################
;; # GitHub
;; ################


;; Def *treesit-generate-stable-list-from-github1*
(defun treesit-generate-stable-list-from-github1 ()
  "Generates a list of grammar sources by searching for the latest tags on GitHub.
Uses the `treesit-language-source-unstable-alist` list as a base."
  (interactive)
  (message "Looking for the latest versions of Tree-sitter grammars...")
  (let ((stable-list '()))
    (dolist (source treesit-language-source-unstable-alist)
      (let* ((lang (car source))
             (spec (cdr source))
             (url (nth 0 spec))
             (original-rev (nth 1 spec))
             (subdir (nth 2 spec))
             (latest-tag (github-fetch-latest-release-tag url)))
        (push `(,lang . (,(nth 0 spec)
                         ,(or latest-tag original-rev)
                         ,(nth 2 spec)))
              stable-list)))
    (nreverse stable-list)))

;; Def *treesit-generate-stable-list-from-github*
(defun treesit-generate-stable-list-from-github ()
  "Generate a list of grammar sources using fixed versions or latest tags.
For each language in `treesit-language-source-branch-alist`, this function
determines the revision to use based on the following priority:
1. A fixed version specified in `treesit-language-fixed-version-alist`.
2. The latest release tag fetched from GitHub.
3. The original branch/revision from `treesit-language-source-branch-alist`
   as a fallback."
  (interactive)
  (message "Generating stable list for Tree-sitter grammars...")
  (let ((stable-list '()))
    (dolist (source treesit-language-source-branch-alist)
      (let* ((lang         (car source))
             (spec         (cdr source))
             (url          (car spec))
             (original-rev (cadr spec))
             (subdir       (caddr spec))
             (fixed-version (cdr (assoc lang treesit-language-fixed-version-alist)))
             (latest-tag (unless fixed-version
                           (github-fetch-latest-release-tag url)))
             (final-rev (or fixed-version latest-tag original-rev)))
        (message "Language: %s -> Using revision: %s" lang final-rev)
        (push `(,lang ,url ,final-rev ,subdir) stable-list)))
    (nreverse stable-list)))


;; ################
;; # Treesit
;; ################


;; Import *treesit*
(require 'treesit)

;; Set *treesit-font-lock* to Maximun Decoration
(setq-default treesit-font-lock-level 4)

;; Set *treesit-language-fixed-version-alist*
(defvar treesit-language-fixed-version-alist
  '()
  "List of grammars with fixed versions.")

;; Set *treesit-language-source-branch-alist*
(defvar treesit-language-source-branch-alist
  '(;; Emacs Oficial Treesit
    ;; BIN
    (c . ("https://github.com/tree-sitter/tree-sitter-c" "master" "src"))
    (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp" "master" "src"))
    (rust . ("https://github.com/tree-sitter/tree-sitter-rust" "master" "src"))
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
    ;; WEB
    (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
    (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
    (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
    (html . ("https://github.com/tree-sitter/tree-sitter-html" "master" "src"))
    (css . ("https://github.com/tree-sitter/tree-sitter-css" "master" "src"))
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
    (luap . ("https://github.com/tree-sitter-grammars/tree-sitter-luap" "master" "src"))
    
    ;; Emacs Unoficial Treesit
    ;; BIN
    (haskell . ("https://github.com/tree-sitter/tree-sitter-haskell" "master" "src"))
    (zig . ("https://github.com/maxxnino/tree-sitter-zig" "main" "src"))
    
    ;; Emacs Custom Treesit
    ;; VM
    (commonlisp . ("https://github.com/tree-sitter-grammars/tree-sitter-commonlisp" "master" "src"))
    ;; EMACS
    (elisp . ("https://github.com/Wilfred/tree-sitter-elisp" "main" "src")))
  "List of grammars with branching to check the latest versions.")

;; Set *major-mode-remap-alist*
(setq-default major-mode-remap-alist
              '(;; Emacs Oficial Treesit
                ;; BIN
                (c-mode . c-ts-mode)
                (c++-mode . c++-ts-mode)
                (c-or-c++-mode . c-or-c++-ts-mode)
                (rust-mode . rust-ts-mode)
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
                ;; WEB
                (js2-mode . js-ts-mode)
                (javascript-mode . js-ts-mode)
                (typescript-mode . typescript-ts-mode)
                (tsx-mode . tsx-ts-mode)
                (html-mode . html-ts-mode)
                (css-mode . css-ts-mode)
                ;; SHELL
                (sh-mode . bash-ts-mode)
                ;; MAKE
                (cmake-mode . cmake-ts-mode)
                ;; CONFIG
                (dockerfile-mode . dockerfile-ts-mode)
                ;; DATA
                (json-mode . json-ts-mode)
                (conf-toml-mode . toml-ts-mode)
                (yaml-mode . yaml-ts-mode)
                
                ;; Emacs Unoficial Treesit
                ;; BIN
                (haskell-mode . haskell-ts-mode)
                (zig-mode . zig-ts-mode)
                
                ;; Emacs Custom Treesit
                ;; VM
                (common-lisp-mode . common-lisp-ts-mode)
                ;; EMACS
                (emacs-lisp-mode . emacs-lisp-ts-mode)
                ))

;; Set *treesit-load-name-override-list*
(setq-default treesit-load-name-override-list '())

;; Set *treesit-language-source-alist* (BOOT TIME: Local only)
(setq-default treesit-language-source-alist
              (mapcar (lambda (item)
                        (let ((lang (car item))
                              (spec (cdr item)))
                          (list lang (nth 0 spec) (nth 1 spec) (nth 2 spec))))
                      treesit-language-source-branch-alist))

;; Def *tree-sitter-setup* (RUNTIME: GitHub fetch)
(defun tree-sitter-setup ()
  (interactive)
  (message "Fetching latest grammar versions from GitHub...")
  (setq treesit-language-source-alist (treesit-generate-stable-list-from-github))
  (dolist (source treesit-language-source-alist)
    (treesit-install-language-grammar (car source)))
  (message "Tree-sitter setup completed."))
