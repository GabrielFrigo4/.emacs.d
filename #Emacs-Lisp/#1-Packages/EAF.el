;; ################
;; # EAF
;; ################


;; Remove D-Bus on Windows
(when-windows
 (advice-add 'dbus-call-method :around
             (lambda (orig-fn &rest args)
               (let ((result ""))
                 (condition-case err
                     (setq result (apply orig-fn args))
                   (error
                    result))
                 result))))

;; Def *eaf-setup*
(defun eaf-setup ()
  "Setup Emacs Application Framework (EAF)"
  (interactive)
  ;; Check if EAF is not Loaded
  (unless (featurep 'eaf)
    ;; Load EAF Path
    (add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/eaf/emacs-application-framework/"))
    ;; Setup EAF
    (require 'eaf)
    ;; Setup Apps
    (require 'eaf-browser)
    (require 'eaf-pdf-viewer)
    ;; Kill EAF Garbage
    (run-at-time "4 sec" nil #'eaf-kill-process)))

;; Setup EAF only in *display-graphic*
(when (display-graphic-p)
  (eaf-setup))

;; Setup EAF only in a Server Frame
(add-hook 'server-after-make-frame-hook #'eaf-setup)
