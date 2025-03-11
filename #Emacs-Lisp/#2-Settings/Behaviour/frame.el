;; ################
;; # Frame
;; ################


;; Import *all-the-icons*
(require 'all-the-icons)

;; Center the Frame in Screen
(defun set-frame-center-screen (&optional frame)
  "Center Frame (or the Current Frame) on the Screen."
  (interactive)
  (let* ((frame (or frame (selected-frame)))
         (frame-width (frame-pixel-width frame))
         (frame-height (frame-pixel-height frame))
         (display-width (display-pixel-width))
         (display-height (display-pixel-height))
         (pos-x (/ (- display-width frame-width) 2))
         (pos-y (/ (- display-height frame-height) 2)))
    (set-frame-position frame pos-x pos-y)))

;; Def *new-frame-setup*
(defun new-frame-setup (frame)
  (when (display-graphic-p frame)
    (setq-default neo-theme 'icons)
    (select-frame frame)
    (set-frame-size frame 87 29)
    (set-frame-center-screen frame)))

;; Run for Already-Existing Frames (For Single Instance Emacs)
(dolist (frame (frame-list))
  (new-frame-setup frame))


;; ################
;; # Hook
;; ################


;; Run When a New Frame is Created (For Emacs in Client/Server Mode)
(add-hook 'after-make-frame-functions 'new-frame-setup)
