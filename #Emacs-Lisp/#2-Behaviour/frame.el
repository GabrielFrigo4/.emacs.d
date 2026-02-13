;; ============================================================================
;;  POSITIONING
;; ============================================================================


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


;; ============================================================================
;;  INITIALIZATION
;; ============================================================================


(defun new-frame-setup (frame)
  (select-frame frame)
  (set-frame-size frame 87 29)
  (if-windows
   (sleep-for 0.036)
   (sleep-for 0.032))
  (set-frame-center-screen frame))

(dolist (frame (frame-list))
  (new-frame-setup frame))


;; ============================================================================
;;  HOOKS
;; ============================================================================


(add-hook 'after-make-frame-functions 'new-frame-setup)
