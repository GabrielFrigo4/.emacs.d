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
      '((sequence "☐" "|" "☑")))

;; Org-Mode Theme Definitions
(defface org-block-begin-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the begin of source blocks.")
(defface org-block
  '((t (:background "#3A3938" :extend t)))
  "Face used for the source block background.")
(defface org-block-end-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the end of source blocks.")

;; Append *org-src-lang-modes*
(with-eval-after-load 'org
  (setq-default org-src-lang-modes
                (append '(;; BIN
                          ("c" . c-ts)
                          ("C" . c-ts)
                          ("c++" . c++-ts)
                          ("C++" . c++-ts)
                          ("cpp" . c++-ts)
                          ("CPP" . c++-ts)
                          ("c-or-c++" . c-or-c++-ts)
                          ("rust" . rust-ts)
                          ("zig" . zig-ts)
                          ("go" . go-ts)
                          ;; JIT
                          ("csharp" . csharp-ts)
                          ("c#" . csharp-ts)
                          ("C#" . csharp-ts)
                          ("java" . java-ts)
                          ;; VM
                          ("python" . python-ts)
                          ("ruby" . ruby-ts)
                          ;; WEB
                          ("js" . js-ts-mode)
                          ("javascript" . js-ts)
                          ("typescript" . typescript-ts)
                          ("tsx" . tsx-ts)
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

;; Add *org-babel-load-languages*
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; BIN
   (C . t)
   ;; JIT
   (java . t)
   ;; VM
   (python . t)
   (ruby . t)
   (lua . t)
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
   (org . t)))
