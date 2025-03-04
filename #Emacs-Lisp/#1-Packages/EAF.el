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

;; Load EAF Path
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/eaf/emacs-application-framework/"))

;; Setup EAF
(require 'eaf)
(setq-default eaf-dbus-supported nil)

;; Setup Apps
(require 'eaf-browser)
(require 'eaf-pdf-viewer)
