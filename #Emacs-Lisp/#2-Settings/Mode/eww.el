;; ################
;; # EWW
;; ################


;; Setup "Emacs Web Wowser"
(setq-default browse-url-browser-function 'browse-url-default-browser)

;; Enable Better HTML/CSS/JS Result
(setq-default url-queue-timeout (expt 2 5))
(setq-default url-user-agent "Mozilla/5.0")

;; Cleanup New Lines
(defun eww-cleanup-newlines ()
  "Remove Excessive Blank Lines in EWW Buffers."
  (let ((inhibit-read-only t))
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\n\\{3,\\}" nil t)
        (replace-match "\n\n")))))
(add-hook 'eww-after-render-hook #'eww-cleanup-newlines)


;; ################
;; # SHR
;; ################


;; Setup "Simple HTML Reader" (SHR)
(shrface-mode t)
(setq-default shr-nbsp ?\u00A0)
(setq-default shr-inhibit-images nil)
(setq-default shr-use-fonts nil)


;; ################
;; # Renders
;; ################


;; Create *EWW After Section Header*
(defvar-local eww-after-section-header nil
  "EWW After Section Header")

;; Restart *EWW After Section Header*
(add-hook 'eww-after-render-hook
          (lambda ()
            (setq eww-after-section-header nil)))

;; Create <b> Render for EWW / SHR
(defun eww-render-b (dom)
  "Custom <b> rendering for EWW: Headers and Body"
  (let* ((class (dom-attr dom 'class))
         (text (dom-texts dom)))
    (cond
     ;; Section Header: Insert Spacing and New Line
     ((and class (string= class "section"))
      (shr-insert "\n\n")
      (shr-generic dom)
      (shr-insert "\n\n")
      (setq eww-after-section-header t))
     ;; Bold Text: Indent if at Beginning of Line
     ((and text
           (or (string-match-p "^[a-zA-Z0-9_]+$" text)
               (string-match-p "^#" text)))
      (when (and (save-excursion (bolp))
                 (eq eww-after-section-header t))
        (shr-insert "     ")
        (setq eww-after-section-header nil))
      (shr-insert (propertize text 'face 'bold)))
     ;; Fallback
     (t
      (shr-generic dom)))))
(add-to-list 'shr-external-rendering-functions '(b . eww-render-b))
