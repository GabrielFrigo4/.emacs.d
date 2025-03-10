;; ################
;; # TeX / LaTeX
;; ################


;; Import TeX
(require 'tex)

;; Import LaTeX
(require 'latex)

;; Setup Emacs TeX (and LaTeX) Tab Width
(defun tex-setup-tab-width ()
  (setq-local tab-width 4)
  (setq-local tex-indent-basic tab-width)
  (setq-local indent-tabs-mode nil))
(add-hook 'tex-mode-hook #'tex-setup-tab-width)
(add-hook 'latex-mode-hook #'tex-setup-tab-width)

;; Setup AUCTeX Tex (and LaTeX) Tab Width
(defun TeX-setup-tab-width ()
  (setq-local tab-width 4)
  (setq-local TeX-indent-basic tab-width)
  (setq-local TeX-brace-indent-level tab-width)
  (setq-local TeX-newline-function 'newline-and-indent)
  (setq-local LaTeX-indent-level tab-width)
  (setq-local LaTeX-item-indent tab-width)
  (setq-local LaTeX-math-indent tab-width)
  (setq-local indent-tabs-mode nil))
(add-hook 'TeX-mode-hook #'TeX-setup-tab-width)
(add-hook 'LaTeX-mode-hook #'TeX-setup-tab-width)

;; Enable / Disable Previw Latex Bool
(setq-default enable-preview-latex t)


;; ################
;; # Preview
;; ################


;; Set Preview Image Type
(setq-default preview-image-type 'dvipng)

;; Enable Auto Cache Preamble
(setq-default preview-auto-cache-preamble t)

;; Use GhostScript Method
(setq-default preview-pdf-color-adjust-method t)

;; Command List
;; [212;42] => 170
;; [28;7] => 21
(setq-default preview-cmd-template-list
              '("mogrify -fuzz 0%% -fill \"RGB(42,42,42)\" -opaque \"RGB(28,28,28)\" -format png %s/*/*/*.png"
                "mogrify -fuzz 1%% -fill \"RGB(93,93,93)\" -opaque \"RGB(22,22,22)\" -format png %s/*/*/*.png"
                "mogrify -fuzz 2%% -fill \"RGB(127,127,127)\" -opaque \"RGB(17,17,17)\" -format png %s/*/*/*.png"
                "mogrify -fuzz 2%% -fill \"RGB(144,144,144)\" -opaque \"RGB(15,15,15)\" -format png %s/*/*/*.png"
                "mogrify -fuzz 2%% -fill \"RGB(161,161,161)\" -opaque \"RGB(13,13,13)\" -format png %s/*/*/*.png"
                "mogrify -fuzz 3%% -fill \"RGB(178,178,178)\" -opaque \"RGB(11,11,11)\" -format png %s/*/*/*.png"
                "mogrify -fuzz 3%% -fill \"RGB(195,195,195)\" -opaque \"RGB(9,9,9)\" -format png %s/*/*/*.png"
                "mogrify -fuzz 3%% -fill \"RGB(212,212,212)\" -opaque \"RGB(7,7,7)\" -format png %s/*/*/*.png"))

;; Recreate Preview Images Files
(setq-default __process-remeing__ nil)
(defun invert-black-preview-images ()
  "Invert only Black to White in AUCTeX Preview Images Using ImageMagick."
  (setq-default __process-remeing__ (length preview-cmd-template-list))
  (dolist (cmd-template preview-cmd-template-list)
    (let ((proc (start-process-shell-command cmd-template nil (format cmd-template TeX-output-dir))))
      (message "Command Process Create!")
      (set-process-sentinel
       proc
       (lambda (process event)
         (when (string-match-p "finished" event)
           (message "Command Process Finish!")
           (setq-default __process-remeing__ (1- __process-remeing__))
           (when (zerop __process-remeing__)
             (message "Finish Setup Latex Preview")
             (if-windows
              (run-at-time "2 sec" nil (lambda () (switch-to-buffer __latex-buffer__)))
              (run-at-time "1 sec" nil (lambda () (switch-to-buffer __latex-buffer__)))))))))
    (sleep-for 0.25)))

;; Setup LaTeX Preview
(defun setup-latex-preview ()
  "Setup LaTeX Preview Images"
  (message "Init Setup Latex Preview")
  (if-windows
   (run-at-time "6 sec" nil #'invert-black-preview-images)
   (run-at-time "4 sec" nil #'invert-black-preview-images)))

;; Add Advice to Preview Buffer
(advice-add 'preview-buffer :after #'setup-latex-preview)

;; Add Advice to Preview Document
(advice-add 'preview-document :after #'setup-latex-preview)


;; ################
;; # AUCTeX
;; ################


;; Add Packages to View
(setq-default preview-default-option-list
              '("displaymath" "floats" "graphics" "textmath" "sections" "footnotes"
                "graphicx" "fontenc" "mathtools" "mathrsfs" "amssymb" "amsthm"
                "amsmath"))

;; Setup Preview LaTeX
(setq-default __latex-buffer__ nil)
(defun setup-preview-latex ()
  (when (and
         (and
          (not (zerop (buffer-size)))
          (eq major-mode 'LaTeX-mode))
         (eq enable-preview-latex t))
    (setq-default __latex-buffer__ (current-buffer))
    (preview-buffer)
    (switch-to-buffer "*Messages*")))
(add-hook 'find-file-hook #'setup-preview-latex)
(add-hook 'after-save-hook #'setup-preview-latex)


;; ################
;; # RefTeX
;; ################


;; Import RefTeX
(require 'reftex)

;; Automatically Enable RefTeX in TeX
(add-hook 'tex-mode-hook 'reftex-mode)
(add-hook 'TeX-mode-hook 'reftex-mode)
(add-hook 'tex-mode-hook 'turn-on-reftex)
(add-hook 'TeX-mode-hook 'turn-on-reftex)

;; Automatically Enable RefTeX in LaTeX
(add-hook 'latex-mode-hook 'reftex-mode)
(add-hook 'LaTeX-mode-hook 'reftex-mode)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; RefTex in AUCTeX
(setq-default reftex-plug-into-AUCTeX t)

;; Automatically Insert Citation Keys
(setq-default reftex-cite-format 'natbib)
