;; ################
;; # EAF
;; ################


;; Load EAF Path
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/eaf/emacs-application-framework/"))

;; Setup EAF on Linux
(when-linux
 ;; Setup EAF
 (require 'eaf)
 ;; Setup Apps
 (require 'eaf-browser)
 (require 'eaf-pdf-viewer)
 ;; Kill Buffers
 (dolist (buf (list "*eaf*" "*eaf-epc con 4*"))
   (when (get-buffer buf)
     (kill-buffer buf))))
