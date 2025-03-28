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

;; Use #3-Sources for GhostScript
(if-windows
 (setq-default preview-gs-command (concat emacs-dir "/#Emacs-Lisp/#3-Sources/GhostScript/gs-mogrify.cmd"))
 (setq-default preview-gs-command (concat emacs-dir "/#Emacs-Lisp/#3-Sources/GhostScript/gs-mogrify.sh")))

;; Define Preview LaTeX
(defun preview-latex ()
  "Preview Inline LaTeX Without Break Colors"
  (interactive)
  (preview-region (point-min) (point-max)))


;; ################
;; # AUCTeX
;; ################


;; Add Packages to View
(setq-default preview-default-option-list
              '("displaymath" "floats" "graphics" "textmath" "sections" "footnotes"
                "graphicx" "fontenc" "mathtools" "mathrsfs" "amssymb" "amsthm"
                "amsmath"))

;; Setup Preview LaTeX
(defun setup-preview-latex ()
  (when (and
         (and
          (not (zerop (buffer-size)))
          (eq major-mode 'LaTeX-mode))
         (eq enable-preview-latex t))
    (let ((__latex-buffer__ (current-buffer)))
      (preview-latex)
      (switch-to-buffer __latex-buffer__))))
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
