;; ################
;; # TeX / LaTeX
;; ################


;; Import TeX
(require 'tex)

;; Import LaTeX
(require 'latex)


;; ################
;; # AUCTeX
;; ################


;; Enable Syntax Highlighting Inside Math Mode
(setq-default font-latex-fontify-script t)

;; Set TeX Settings
(setq-default TeX-auto-save t)
(setq-default TeX-parse-self t)
(setq-default TeX-master nil)

;; Enable PDF Mode by Default
(setq-default TeX-PDF-mode t)

;; Use `LatexMk` for Automatic Compilation
(setq-default TeX-command-default "LatexMk")
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)

;; Use `TeX-source-correlate-mode` for Search
(setq-default TeX-source-correlate-mode t)
(setq-default TeX-source-correlate-method 'synctex)

;; Adjust Size of Preview Images
(setq-default preview-scale-function 1.5)
(setq-default preview-auto-cache-preamble t)


;; ################
;; # RefTeX
;; ################


;; Import RefTeX
(require 'reftex)

;; Automatically Enable RefTeX
(add-hook 'latex-mode-hook 'reftex-mode)
(add-hook 'latex-mode-hook 'turn-on-reftex)

;; RefTex in AUCTeX
(setq-default reftex-plug-into-AUCTeX t)

;; Automatically Insert Citation Keys
(setq-default reftex-cite-format 'natbib)


;; ################
;; # CDLaTeX
;; ################


;; Automatically Enable CDLaTeX
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)

;; Use TAB for Quick Insertion
;;(setq-default cdlatex-tab-style 'electric)
