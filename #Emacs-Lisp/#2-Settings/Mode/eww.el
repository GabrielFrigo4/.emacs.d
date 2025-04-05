;; ################
;; # EWW
;; ################


;; Setup "Emacs Web Wowser"
(setq-default browse-url-browser-function 'browse-url-default-browser)

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
