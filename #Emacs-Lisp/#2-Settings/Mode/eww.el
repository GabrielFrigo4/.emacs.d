;; ################
;; # EWW
;; ################


;; Setup "Emacs Web Wowser"
(setq-default browse-url-browser-function 'browse-url-default-browser)

;; Enable Better HTML/CSS/JS Result
(setq-default url-queue-timeout (expt 2 4))
(setq-default url-user-agent 'default)


;; ################
;; # SHR
;; ################


;; Setup "Simple HTML Reader" (SHR)
(shrface-mode t)
(setq-default shr-nbsp ?\u00A0)
(setq-default shr-inhibit-images nil)
(setq-default shr-use-fonts nil)
