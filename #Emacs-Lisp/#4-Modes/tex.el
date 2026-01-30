;; ============================================================================
;;  DEPENDENCIES
;; ============================================================================


(require 'tex)
(require 'latex)
(require 'reftex)


;; ============================================================================
;;  CORE CONFIGURATION
;; ============================================================================


(setq-default enable-preview-latex t)


;; ============================================================================
;;  HOOKS & INDENTATION
;; ============================================================================


(defun tex-setup-tab-width ()
  (setq-local tab-width 4)
  (setq-local tex-indent-basic tab-width)
  (setq-local indent-tabs-mode nil))
(add-hook 'tex-mode-hook #'tex-setup-tab-width)
(add-hook 'latex-mode-hook #'tex-setup-tab-width)

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


;; ============================================================================
;;  PDF VIEWING
;; ============================================================================


(defun view-latex ()
  "Compile LaTeX with LaTeXMk and Dvipdfmx, then view the PDF in a split window."
  (interactive)
  (let ((orig-buffer (current-buffer)))
    (TeX-command "LaTeXMk" 'TeX-master-file)
    (if-windows
     (async-sleep (expt 2 2.5))
     (async-sleep (expt 2 1.5)))
    (switch-to-buffer orig-buffer)
    (TeX-command "Dvipdfmx" 'TeX-master-file)
    (if-windows
     (async-sleep (expt 2 1))
     (async-sleep (expt 2 0)))
    (switch-to-buffer orig-buffer)
    (split-window-below)
    (other-window 1)
    (find-file (concat TeX-output-dir "/" (TeX-master-file) ".pdf"))))


;; ============================================================================
;;  PREVIEW LATEX
;; ============================================================================


(setq-default preview-image-type 'dvipng)
(setq-default preview-auto-cache-preamble t)
(setq-default preview-pdf-color-adjust-method t)

(defun preview-latex ()
  "Preview Inline LaTeX Without Break Colors"
  (interactive)
  (preview-region (point-min) (point-max)))


;; ============================================================================
;;  AUCTEX CONFIGURATION
;; ============================================================================


(setq-default preview-default-option-list
              '("displaymath" "floats" "graphics" "textmath" "sections" "footnotes"
                "graphicx" "fontenc" "mathtools" "mathrsfs" "amssymb" "amsthm"
                "amsmath"))

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


;; ============================================================================
;;  REFTEX
;; ============================================================================


(add-hook 'tex-mode-hook   'reftex-mode)
(add-hook 'TeX-mode-hook   'reftex-mode)
(add-hook 'tex-mode-hook   'turn-on-reftex)
(add-hook 'TeX-mode-hook   'turn-on-reftex)

(add-hook 'latex-mode-hook 'reftex-mode)
(add-hook 'LaTeX-mode-hook 'reftex-mode)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq-default reftex-plug-into-AUCTeX t)
(setq-default reftex-cite-format 'natbib)
