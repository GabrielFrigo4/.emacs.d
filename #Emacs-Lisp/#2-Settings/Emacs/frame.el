;; ################
;; # Frame
;; ################


;; Import *all-the-icons*
(require 'all-the-icons)

;; Def *new-frame-setup*
(defun new-frame-setup (frame)
  (if (display-graphic-p frame)
      (setq neo-theme 'icons)))

;; Run for already-existing frames (For single instance emacs)
(mapc 'new-frame-setup (frame-list))

;; Run when a new frame is created (For emacs in client/server mode)
(add-hook 'after-make-frame-functions 'new-frame-setup)
