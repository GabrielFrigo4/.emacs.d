;; ============================================================================
;;  GENERAL SETTINGS
;; ============================================================================


(setq-default org-support-shift-select t)
(setq-default org-src-fontify-natively t)
(setq-default org-src-preserve-indentation t)
(setq-default org-hide-emphasis-markers t)


;; ============================================================================
;;  TODO & CHECKBOXES
;; ============================================================================


(setq-default org-todo-keywords
              '((sequence "TODO" "|" "WORK" "|" "DONE")))

(defface org-todo-custom-face
  '((t (:inherit 'org-todo :weight bold)))
  "Custom face for TODO and [ ] keyword.")

(defface org-work-custom-face
  '((t (:foreground "goldenrod4" :weight bold)))
  "Custom face for WORK and [-] keyword.")

(defface org-done-custom-face
  '((t (:inherit 'org-done :weight bold)))
  "Custom face for DONE and [X] keyword.")

(setq-default org-todo-keyword-faces
              '(("TODO" . org-todo-custom-face)
                ("WORK" . org-work-custom-face)
                ("DONE" . org-done-custom-face)))

(set-face-attribute 'org-checkbox nil :weight 'bold)

(defun org-checkbox-colorizer (start end)
  "Fontify Org checkboxes differently based on their state between START and END."
  (save-excursion
    (goto-char start)
    (while (re-search-forward "^ *[-+*] +\\(\\[ \\]\\|\\[-\\]\\|\\[X\\]\\)" end t)
      (unless (org-in-src-block-p)
        (let ((match (match-string 1)))
          (add-text-properties
           (match-beginning 1) (match-end 1)
           (cond
            ((string= match "[ ]")
             '(face ,org-todo-custom-face))
            ((string= match "[-]")
             '(face ,org-work-custom-face))
            ((string= match "[X]")
             '(face ,org-done-custom-face)))))))))

(add-hook 'org-mode-hook
          (lambda ()
            "Enable custom checkbox coloring in Org buffers."
            (jit-lock-register #'org-checkbox-colorizer)))

(font-lock-add-keywords
 'org-mode
 '(("^ *[-+*] +\\[X\\] \\(.*\\)"
    (1 'shadow prepend))))


;; ============================================================================
;;  SOURCE BLOCKS & LANGUAGES
;; ============================================================================


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


;; ============================================================================
;;  BABEL CONFIGURATION
;; ============================================================================


(setq org-babel-C-compiler "clang")
(setq org-babel-C++-compiler "clang++")

(setq-default org-confirm-babel-evaluate nil)

(when-unix
 (setq-default org-babel-sh-command "zsh"))

(when-windows
 (setq-default org-babel-sh-command "cmdproxy.exe"))

;; --- Block Themes ---

(defface org-block-begin-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block
  '((t (:background "#3A3938" :extend t)))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:underline "#646260" :foreground "#10CFFC" :background "#41403F" :extend t)))
  "Face used for the line delimiting the end of source blocks.")

;; --- Load Languages ---

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

;; --- Lua Execution Fix ---

(defun org-babel-execute-lua (body params)
  "Execute a block of Lua code with Babel using an external Lua process."
  (let* ((script-file (make-temp-file "ob-lua-" nil ".lua" body))
         (cmd (format "lua %s" (shell-quote-argument script-file))))
    (with-temp-buffer
      (call-process-shell-command cmd nil t)
      (buffer-string))))

(advice-add 'org-babel-execute:lua :override #'org-babel-execute-lua)
