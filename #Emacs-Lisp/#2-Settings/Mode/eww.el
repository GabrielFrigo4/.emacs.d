;; ################
;; # EWW
;; ################


;; Import EWW
(require 'eww)

;; Setup "Emacs Web Wowser"
(setq-default browse-url-browser-function 'browse-url-default-browser)

;; Enable Better HTML/CSS/JS Result
(setq-default url-queue-timeout (expt 2 4))
(setq-default url-user-agent 'default)


;; ################
;; # SHR
;; ################


;; Import SHR
(require 'shr)
(require 'shr-tag-pre-highlight)

;; Setup "Simple HTML Reader" (SHR)
(shrface-mode t)
(setq-default shr-nbsp ?\u00A0)
(setq-default shr-inhibit-images nil)
(setq-default shr-use-fonts nil)


;; ################
;; # SHRFACE
;; ################


;; Import SHRFACE
(require 'shrface)

;; Import ElDoc-Box
(require 'eldoc-box)

;; General Rendering
(defvar shrface-general-rendering-functions
  (append '((title . eww-tag-title)
            (form . eww-tag-form)
            (input . eww-tag-input)
            (button . eww-form-submit)
            (textarea . eww-tag-textarea)
            (select . eww-tag-select)
            (link . eww-tag-link)
            (meta . eww-tag-meta)
            (code . shrface-tag-code)
            (pre . shrface-shr-tag-pre-highlight))
          shrface-supported-faces-alist))

;; Setup Shrface in EWW
(defun shrface-eww-setup ()
  (unless shrface-toggle-bullets
    (shrface-regexp)
    (setq-local imenu-create-index-function #'shrface-imenu-get-tree))
  (shrface-show-all-annotations))

;; Shrface TAG Highlight
(defun shrface-shr-tag-pre-highlight (pre)
  "Highlighting code in PRE."
  (let* ((shr-folding-mode 'none)
         (shr-current-font 'default)
         (code (with-temp-buffer
                 (shr-generic pre)
                 ;; (indent-rigidly (point-min) (point-max) 2)
                 (buffer-string)))
         (lang (or (shr-tag-pre-highlight-guess-language-attr pre)
                   (let ((sym (language-detection-string code)))
                     (and sym (symbol-name sym)))))
         (mode (and lang
                    (shr-tag-pre-highlight--get-lang-mode lang))))
    (shr-ensure-newline)
    (shr-ensure-newline)
    (setq start (point))
    (insert
     ;; (propertize (concat "#+BEGIN_SRC " lang "\n") 'face 'org-block-begin-line)
     (or (and (fboundp mode)
              (with-demoted-errors "Error while fontifying: %S"
                (shr-tag-pre-highlight-fontify code mode)))
         code)
     ;; (propertize "#+END_SRC" 'face 'org-block-end-line )
     )
    (shr-ensure-newline)
    (setq end (point))
    (pcase (frame-parameter nil 'background-mode)
      ('light
       (add-face-text-property start end '(:background "#D8DEE9" :extend t)))
      ('dark
       (add-face-text-property start end '(:background "#292b2e" :extend t))))
    (shr-ensure-newline)
    (insert "\n")))

;; Shrface Render Region
(defun shrface-render-region (beg end)
  (require 'eww)
  (let ((shrface-org nil)
        (shr-bullet (concat (char-to-string shrface-item-bullet) " "))
        ;; make it large enough, it would not fill the column
        ;; I uses visual-line-mode, writeroom-mode for improving the reading experience instead
        (shr-width 7000)
        (shr-indentation (if (string-equal system-type "android") 0 0))
        (shr-table-vertical-line "|")
        (shr-external-rendering-functions shrface-general-rendering-functions)
        (shrface-toggle-bullets nil)
        (shrface-href-versatile t)
        (shr-use-fonts nil))
    (shr-render-region beg end)))

;; Shrface Render Advice
(defun shrface-render-advice (orig-fun &rest args)
  (require 'eww)
  (let ((shrface-org nil)
        (shr-bullet (concat (char-to-string shrface-item-bullet) " "))
        (shr-table-vertical-line "|")
        (shr-width 65)
        (shr-indentation 0)
        (shr-external-rendering-functions shrface-general-rendering-functions)
        (shrface-toggle-bullets nil)
        (shrface-href-versatile t)
        (shr-use-fonts nil))
    ;; workaround, need a delay to update the header line
    (run-with-timer 0.01 nil 'shrface-update-header-line)
    (apply orig-fun args)))

;; Show All Annotations
(defun shrface-show-all-annotations ()
  (when (bound-and-true-p paw-annotation-mode)
    (paw-clear-annotation-overlay)
    (paw-show-all-annotations)
    (if paw-annotation-show-wordlists-words-p
        (paw-focus-find-words :wordlist t))
    (if paw-annotation-show-unknown-words-p
        (paw-focus-find-words))))

;; Updae EWW Render
(advice-add 'eww-display-html :around #'shrface-render-advice)
;;(add-hook 'eww-after-render-hook #'org-indent-mode)
(add-hook 'eww-after-render-hook #'eldoc-mode)
(add-hook 'eww-after-render-hook #'eldoc-box-hover-mode)
(add-hook 'eww-after-render-hook #'shrface-eww-setup)
