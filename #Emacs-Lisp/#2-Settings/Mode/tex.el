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


;; ################
;; # Preview
;; ################


;; Set Preview Image Type
(setq-default preview-image-type 'dvipng)

;; Enable Auto Cache Preamble
(setq-default preview-auto-cache-preamble t)


;; ################
;; # AUCTeX
;; ################


;; Setup Preview LaTeX
(defun setup-preview-latex ()
  (when (and (not (zerop (buffer-size))) (eq major-mode 'LaTeX-mode))
    (setq-local preview-default-option-list
              (append preview-default-option-list
                      '("graphicx"
                        "fontenc"
                        "mathtools"
                        "mathrsfs"
                        "amssymb"
                        "amsthm"
                        "amsmath")))
    (let ((current-buffer (current-buffer)))
      (preview-buffer)
      (switch-to-buffer current-buffer))))
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
