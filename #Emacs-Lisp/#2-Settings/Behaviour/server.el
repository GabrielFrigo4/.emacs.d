;; ################
;; # Server
;; ################


;; Import *neotree*
(require 'neotree)

;; Def *neotree-startup*
(defun neotree-startup ()
  (neotree-refresh)
  (neotree-hide))

;; Add NeoTree-Startup
(add-hook 'server-switch-hook #'neotree-startup)
(add-hook 'after-init-hook #'neotree-startup)
