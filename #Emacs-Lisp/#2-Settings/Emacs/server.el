;; ################
;; # Server
;; ################


;; Import *neotree*
(require 'neotree)

;; Def *neotree-startup*
(defun neotree-startup ()
  (neotree-refresh)
  (neotree-hide))

;; Check if *daemonp*
(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
  (add-hook 'after-init-hook #'neotree-startup))
