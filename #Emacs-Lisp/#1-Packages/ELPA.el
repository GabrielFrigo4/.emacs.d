;; ################
;; # ELPA
;; ################


;; Wait (ELPACA)
(elpaca-wait)

;; Install Emacs Visual Studio
(unless (package-installed-p 'auto-scroll-bar)
  (package-install 'auto-scroll-bar))
(auto-scroll-bar-mode t)

;; Install Themes
(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))
