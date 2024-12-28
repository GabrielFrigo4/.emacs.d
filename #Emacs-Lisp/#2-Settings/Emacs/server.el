;; ################
;; # Server
;; ################


;; Import *neotree*
(require 'neotree)

;; 
(defun neotree-startup ()
  (neotree-refresh)
  (neotree-hide))

;; 
(if (daemonp)
    (add-hook 'server-switch-hook #'neotree-startup)
  (add-hook 'after-init-hook #'neotree-startup))
