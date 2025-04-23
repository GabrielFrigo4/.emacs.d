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
;;(add-hook 'eww-after-render-hook #'org-indent-mode)
(add-hook 'eww-after-render-hook #'eldoc-mode)
(add-hook 'eww-after-render-hook #'eldoc-box-hover-mode)
(add-hook 'eww-after-render-hook #'shrface-eww-setup)
