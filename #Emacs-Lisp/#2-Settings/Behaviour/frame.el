;; ################
;; # Frame
;; ################


;; Import *all-the-icons*
(require 'all-the-icons)

;; Def *new-frame-setup*
(defun new-frame-setup (frame)
  (when (display-graphic-p frame)
    (setq-default neo-theme 'icons)
    (set-frame-size frame 87 29)))

;; Run for Already-Existing Frames (For Single Instance Emacs)
(mapc 'new-frame-setup (frame-list))


;; ################
;; # Hook
;; ################


;; Run When a New Frame is Created (For Emacs in Client/Server Mode)
(add-hook 'after-make-frame-functions 'new-frame-setup)
