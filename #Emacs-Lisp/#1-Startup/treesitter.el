(setq-default treesit-font-lock-level 4)

(setq treesit-language-source-list
      '((c "https://github.com/tree-sitter/tree-sitter-c" "master" "src")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp" "master" "src")
        (c-sharp "https://github.com/tree-sitter/tree-sitter-c-sharp" "master" "src")
        (rust "https://github.com/tree-sitter/tree-sitter-rust" "master" "src")
		(zig "https://github.com/GrayJack/tree-sitter-zig" "master" "src")
        (go "https://github.com/tree-sitter/tree-sitter-go" "master" "src")
        (haskell "https://github.com/tree-sitter/tree-sitter-haskell" "master" "src")
        (java "https://github.com/tree-sitter/tree-sitter-java" "master" "src")
        (python "https://github.com/tree-sitter/tree-sitter-python" "master" "src")
		(lua "https://github.com/tjdevries/tree-sitter-lua" "master" "src")
        (nasm "https://github.com/naclsn/tree-sitter-nasm" "master" "src")
        (asm "https://github.com/RubixDev/tree-sitter-asm" "master" "src")))

(defun tree-sitter-setup ()
  (interactive)
  (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-list)))