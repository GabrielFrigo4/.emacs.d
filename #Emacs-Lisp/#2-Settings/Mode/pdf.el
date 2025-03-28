;; ################
;; # PDF
;; ################


;; ################
;; # PDF-TOOLS
;; ################


;; Setup MSYS2
(setq-default pdf-tools-msys2-directory (concat home-dir "/scoop/apps/msys2/current/"))


;; ################
;; # PDF-VIEW
;; ################


;; Setup PDF View Images Scale
(setq-default pdf-view-use-scaling nil)

;; Enable 2 Pixels Border
(setq-default pdf-view-image-relief 2)

;; Use ImageMagick
(setq-default pdf-view-use-imagemagick t)

;; Disable PDF-Cache Prefetching Timer
(defadvice pdf-cache--prefetch-start (around suppress-timer activate)
  "Suppress the pdf-cache prefetching timer."
  (cancel-function-timers 'pdf-cache--prefetch-start))
