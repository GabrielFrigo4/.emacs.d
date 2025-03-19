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
    (add-to-list 'load-path (concat emacs-dir "/eaf/emacs-application-framework/"))
    ;; Setup EAF
    (require 'eaf)
    ;; Setup Apps
    (require 'eaf-browser)
    (require 'eaf-pdf-viewer)
    ;; Kill EAF Garbage
    (if-windows
     (run-at-time "2.4 sec" nil #'eaf-kill-process)
     (run-at-time "1.6 sec" nil #'eaf-kill-process))))

;; Setup EAF only in *display-graphic*
(when (display-graphic-p)
  (eaf-setup))

;; Setup EAF only in a Server Frame
(add-hook 'server-after-make-frame-hook #'eaf-setup)


;; ################
;; # Functions
;; ################


;; Google
(defun eaf-open-google ()
  "Open EAF Browser with Google Search"
  (interactive)
  (eaf-open-browser "google.com"))

;; DuckDuckGo
(defun eaf-open-duckduckgo ()
  "Open EAF Browser with DuckDuckGo Search"
  (interactive)
  (eaf-open-browser "duckduckgo.com"))

;; Bing
(defun eaf-open-bing ()
  "Open EAF Browser with Bing Search"
  (interactive)
  (eaf-open-browser "bing.com"))


;; ################
;; # Alias
;; ################


;; Google
(defalias 'google 'eaf-open-google
  "Open EAF Browser with Google Search")

;; DuckDuckGo
(defalias 'duckduckgo 'eaf-open-duckduckgo
  "Open EAF Browser with DuckDuckGo Search")

;; Bing
(defalias 'bing 'eaf-open-bing
  "Open EAF Browser with Bing Search")
