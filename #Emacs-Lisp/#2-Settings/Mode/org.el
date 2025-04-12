;; ################
;; # Org
;; ################


;; Shift Selection
(setq-default org-support-shift-select t)

;; Fontify Code in Code Blocks
(setq-default org-src-fontify-natively t)

;; Set Org-Mode Indentation
(setq-default org-src-preserve-indentation t)

;; Hide Emphasis Markers
(setq-default org-hide-emphasis-markers t)

;; Set TODO Keywords
(setq-default org-todo-keywords
              '((sequence "TODO" "|" "WORK" "|" "DONE")))

;; Set TODO Faces
(defface org-todo-custom-face
  '((t (:inherit 'org-todo :weight bold)))
  "Custom face for TODO keyword.")
(defface org-work-custom-face
  '((t (:foreground "dark gray" :weight bold)))
  "Custom face for WORK keyword.")
(defface org-done-custom-face
  '((t (:inherit 'org-done :weight bold)))
  "Custom face for DONE keyword.")
(setq-default org-todo-keyword-faces
              '(("TODO" . org-todo-custom-face)
                ("WORK" . org-work-custom-face)
                ("DONE" . org-done-custom-face)))

;; Set CheckBox Faces
(set-face-attribute 'org-checkbox nil :weight 'bold)

;; Set CheckBox Font Lock
(font-lock-add-keywords
 'org-mode
 '(("^ *[-+] +\\[X\\] \\(.*\\)"
    (1 'shadow prepend))))

;; Append *org-src-lang-modes*
(with-eval-after-load 'org
  (setq-default org-src-lang-modes
                (append '(;; BIN
                          ("c" . c-ts)
                          ("C" . c-ts)
                          ("cc" . c-ts)
                          ("CC" . c++-ts)
                          ("c++" . c++-ts)
                          ("C++" . c++-ts)
                          ("cpp" . c++-ts)
                          ("CPP" . c++-ts)
                          ("c-or-c++" . c-or-c++-ts)
                          ("rust" . rust-ts)
                          ("zig" . zig-ts)
                          ("go" . go-ts)
                          ("haskell" . haskell-ts)
                          ;; JIT
                          ("csharp" . csharp-ts)
                          ("c#" . csharp-ts)
                          ("C#" . csharp-ts)
                          ("java" . java-ts)
                          ("elixir" . elixir-ts)
                          ("php" . php-ts)
                          ;; VM
                          ("lua" . lua-ts)
                          ("python" . python-ts)
                          ("ruby" . ruby-ts)
                          ("common-lisp" . common-lisp-ts)
                          ("lisp" . common-lisp-ts)
                          ;; WEB
                          ("js" . js-ts)
                          ("javascript" . js-ts)
                          ("typescript" . typescript-ts)
                          ("tsx" . tsx-ts)
                          ("html" . html-ts)
                          ("css" . css-ts)
                          ;; EMACS
                          ("emacs-lisp" . emacs-lisp-ts)
                          ("elisp" . emacs-lisp-ts)
                          ;; SHELL
                          ("bash" . bash-ts)
                          ;; MAKE
                          ("cmake" . cmake-ts)
                          ;; CONFIG
                          ("dockerfile" . dockerfile-ts)
                          ;; DATA
                          ("json" . json-ts)
                          ("toml" . toml-ts)
                          ("yaml" . yaml-ts))
                        org-src-lang-modes)))


;; ################
;; # Babel
;; ################


;; Set C and C++ compilers
(setq org-babel-C-compiler "clang")
(setq org-babel-C++-compiler "clang++")

;; Set *org-confirm-babel-evaluate*
(setq-default org-confirm-babel-evaluate nil)

;; Shell on Linux
(when-linux
 (setq-default org-babel-sh-command "zsh"))

;; Shell on FreeBSD
(when-freebsd
 (setq-default org-babel-sh-command "zsh"))

;; Shell on MacOS
(when-darwin
 (setq-default org-babel-sh-command "zsh"))

;; Shell on Windows
(when-windows
 (setq-default org-babel-sh-command "cmdproxy.exe"))

;; Set Block Theme
(defface org-block-begin-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the begin of source blocks.")
(defface org-block
  '((t (:background "#3A3938" :extend t)))
  "Face used for the source block background.")
(defface org-block-end-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the end of source blocks.")

;; Add *org-babel-load-languages*
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; BIN
   (C . t)
   (haskell . t)
   ;; JIT
   (java . t)
   ;; VM
   (lua . t)
   (python . t)
   (ruby . t)
   (lisp . t)
   ;; WEB
   (js . t)
   (css . t)
   ;; EMACS
   (emacs-lisp . t)
   ;; SHELL
   (shell . t)
   (eshell . t)
   ;; MAKE
   (makefile . t)
   ;; CONFIG
   (org . t)
   ;; TEX / LATEX
   (latex . t)))
