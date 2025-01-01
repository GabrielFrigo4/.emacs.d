;; ################
;; # Org
;; ################


;; Shift Selection
(setq-default org-support-shift-select t)

;; Fontify Code in Code Blocks
(setq-default org-src-fontify-natively t)

;; Set Org-Mode Indentation
(setq-default org-src-preserve-indentation t)

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
                (append  org-src-lang-modes
                         '(;; BIN
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
                           ("yaml" . yaml-ts)))))
