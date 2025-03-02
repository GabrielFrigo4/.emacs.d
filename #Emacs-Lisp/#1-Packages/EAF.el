;; ################
;; # EAF
;; ################


;; Load EAF Path
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/eaf/emacs-application-framework/"))

;; Setup EAF
(require 'eaf)

;; Setup Apps on Windows
(when-windows
 (require 'eaf-browser)
 (require 'eaf-pdf-viewer))

;; Setup Apps on Linux
(when-linux
 (require 'eaf-browser)
 (require 'eaf-pdf-viewer))

;; Remove EAF Buffers
(dolist (buf (list "*eaf*" "*eaf-epc con 4*"))
  (when (get-buffer buf)
    (kill-buffer buf)))
