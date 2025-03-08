;; ################
;; # TeX / LaTeX
;; ################


;; Import TeX
(require 'tex)

;; Import LaTeX
(require 'latex)

;; Set Tab Width
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq-local tab-width 4)
            (setq-local TeX-indent-basic tab-width)
            (setq-local LaTeX-indent-level tab-width)
            (setq-local LaTeX-item-indent tab-width)
            (setq-local LaTeX-math-indent tab-width)
            (setq-local indent-tabs-mode nil)))


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
