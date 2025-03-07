;; ################
;; # Server
;; ################


;; Import *neotree*
(require 'neotree)

;; Def *neotree-startup*
(defun neotree-startup ()
  (neotree-refresh)
  (neotree-hide))


;; ################
;; # Hook
;; ################


;; Add NeoTree-Startup
(add-hook 'after-init-hook #'neotree-startup)
(add-hook 'emacs-startup-hook #'neotree-startup)
(add-hook 'window-setup-hook #'neotree-startup)
(add-hook 'server-switch-hook #'neotree-startup)
