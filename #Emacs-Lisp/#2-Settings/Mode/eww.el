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

;; Set Shrface
(setq-default shrface-toggle-bullets nil)
(setq-default shrface-href-versatile t)

;; Setup Aweww Render With Shrface 
(setq-default aweww-general-rendering-functions
              (append aweww-general-rendering-functions
                      shrface-supported-faces-alist))

;; Setup Shrface in EWW
(defun shrface-eww-setup ()
  (unless shrface-toggle-bullets
    (shrface-regexp)))

;; Updae EWW Render
(add-hook 'eww-after-render-hook #'eldoc-mode)
(add-hook 'eww-after-render-hook #'eldoc-box-hover-mode)
(add-hook 'eww-after-render-hook #'shrface-eww-setup)
