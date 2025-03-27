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
    ;; Ignore EAF Start Process
    (advice-add 'eaf-start-process :override #'ignore)
    ;; Setup EAF
    (require 'eaf)
    ;; Setup Apps
    (require 'eaf-browser)
    (require 'eaf-pdf-viewer)
    (require 'eaf-music-player)
    (require 'eaf-video-player)
    (require 'eaf-image-viewer)
    (require 'eaf-file-manager)
    (require 'eaf-pyqterminal)
    (require 'eaf-terminal)
    (require 'eaf-camera)
    (require 'eaf-git)
    ;; Set EAF Apps Variables
    (setq-default eaf-pyqterminal-font-family "JetBrains Mono")
    (setq-default eaf-pyqterminal-font-size 20)
    ;; Enable EAF Start Process
    (if-windows
     (run-at-time "2.4 sec" nil (lambda () (advice-remove 'eaf-start-process #'ignore)))
     (run-at-time "1.6 sec" nil (lambda () (advice-remove 'eaf-start-process #'ignore))))
    ;; Kill EAF Garbage
    (eaf-kill-process)))

;; Setup EAF only in *display-graphic*
(when (display-graphic-p)
  (eaf-setup))

;; Setup EAF only in a Server Frame
(add-hook 'server-after-make-frame-hook #'eaf-setup)


;; ################
;; # Functions
;; ################


;; Start
(defun eaf-start ()
  "Start Emacs Application Framework (EAF)"
  (interactive)
  (eaf-start-process))

;; Restart
(defun eaf-restart ()
  "Restart Emacs Application Framework (EAF)"
  (interactive)
  (eaf-restart-process))

;; Stop
(defun eaf-stop ()
  "Stop Emacs Application Framework (EAF)"
  (interactive)
  (eaf-stop-process))

;; Kill
(defun eaf-kill ()
  "Kill Emacs Application Framework (EAF)"
  (interactive)
  (eaf-kill-process))

;; File
(defun eaf-file ()
  "Open EAF File Manager"
  (interactive)
  (eaf-open-file-manager))

;; Term
(defun eaf-term ()
  "Open EAF PyQ6 Terminal"
  (interactive)
  (eaf-open-pyqterminal))

;; Cam
(defun eaf-cam ()
  "Open EAF Camera"
  (interactive)
  (eaf-open-camera))

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

;; ChatGPT
(defun eaf-open-chatgpt ()
  "Open EAF Browser with ChatGPT LLM"
  (interactive)
  (eaf-open-browser "chatgpt.com"))

;; Gemini
(defun eaf-open-gemini ()
  "Open EAF Browser with Gemini LLM"
  (interactive)
  (eaf-open-browser "gemini.google.com"))

;; DeepSeek
(defun eaf-open-deepseek ()
  "Open EAF Browser with DeepSeek LLM"
  (interactive)
  (eaf-open-browser "chat.deepseek.com"))

;; Wikipedia
(defun eaf-open-wikipedia ()
  "Open EAF Browser with Wikipedia WebSite"
  (interactive)
  (eaf-open-browser "pt.wikipedia.org"))

;; YouTube
(defun eaf-open-youtube ()
  "Open EAF Browser with YouTube WebSite"
  (interactive)
  (eaf-open-browser "youtube.com"))


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

;; ChatGPT
(defalias 'chatgpt 'eaf-open-chatgpt
  "Open EAF Browser with ChatGPT LLM")

;; Gemini
(defalias 'gemini 'eaf-open-gemini
  "Open EAF Browser with Gemini LLM")

;; DeepSeek
(defalias 'deepseek 'eaf-open-deepseek
  "Open EAF Browser with DeepSeek LLM")

;; Wikipedia
(defalias 'wikipedia 'eaf-open-wikipedia
  "Open EAF Browser with Wikipedia WebSite")

;; YouTube
(defalias 'youtube 'eaf-open-youtube
  "Open EAF Browser with YouTube WebSite")
