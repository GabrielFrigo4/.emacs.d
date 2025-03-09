;; ################
;; # PDF-VIEW
;; ################


;; Disable PDF-Cache Prefetching Timer
(defadvice pdf-cache--prefetch-start (around suppress-timer activate)
  "Suppress the pdf-cache prefetching timer."
  (cancel-function-timers 'pdf-cache--prefetch-start))
