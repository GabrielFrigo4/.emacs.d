;; ################
;; # EWW
;; ################


;; Enable images
(setq-default shr-inhibit-images nil)

;; Use a Better Font for Reading
(setq-default shr-use-fonts t)

;; Enable Browser Function
(setq-default browse-url-browser-function 'browse-url-default-browser)

;; Improve Page Rendering
(add-hook 'eww-after-render-hook 'eww-readable)
