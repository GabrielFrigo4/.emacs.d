;; ################
;; # EWW
;; ################


;; Import EWW
(require 'eww)

;; Setup "Emacs Web Wowser"
(setq-default browse-url-browser-function 'browse-url-default-browser)

;; Enable Better HTML/CSS/JS Result
(setq-default url-queue-timeout (expt 2 4))
(setq-default url-user-agent 'default)


;; ################
;; # SHR
;; ################


;; Import SHR
(require 'shr)
(require 'shr-tag-pre-highlight)

;; Setup "Simple HTML Reader" (SHR)
(setq-default shr-nbsp ?\u00A0)
(setq-default shr-inhibit-images nil)
(setq-default shr-use-fonts nil)


;; ################
;; # SHRFACE
;; ################


;; Import SHRFACE
(require 'shrface)

;; Import ElDoc-Box
(require 'eldoc-box)
