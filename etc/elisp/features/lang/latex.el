;; ============================================================================
;;  LATEX FEATURE
;; ============================================================================

(use-package auctex
  :ensure (:type git :host github :repo "emacsmirror/auctex" :branch "master")
  :hook ((LaTeX-mode . TeX-source-correlate-mode)
         (TeX-after-compilation-finished-functions . TeX-revert-document-buffer)
         (tex-mode . reftex-mode)
         (TeX-mode . reftex-mode)
         (latex-mode . reftex-mode)
         (LaTeX-mode . reftex-mode))
  :config
  (setq-default TeX-parse-self nil)
  (setq-default TeX-save-parse nil)
  (setq-default TeX-save-query nil)
  (setq-default TeX-auto-save nil)
  (setq-default TeX-master t)
  (setq-default TeX-output-dir (expand-file-name "emacs-tex-out" temporary-file-directory))
  (setq-default TeX-PDF-mode -1)
  (setq-default TeX-view-program-selection '((output-pdf "PDF Tools")))
  (setq-default TeX-source-correlate-method 'synctex)

  (setq-default preview-image-type 'dvipng)
  (setq-default preview-auto-cache-preamble t)
  (setq-default preview-pdf-color-adjust-method t)

  (defun tex-setup-tab-width ()
    (setq-local tab-width 4)
    (setq-local tex-indent-basic tab-width)
    (setq-local indent-tabs-mode -1))
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
    (setq-local indent-tabs-mode -1))
  (add-hook 'TeX-mode-hook #'TeX-setup-tab-width)
  (add-hook 'LaTeX-mode-hook #'TeX-setup-tab-width)

  (defun view-latex ()
    "Compile LaTeX and view PDF."
    (interactive)
    (let ((orig-buffer (current-buffer)))
      (TeX-command "LaTeXMk" 'TeX-master-file)
      (if-windows (async-sleep (expt 2 2.5)) (async-sleep (expt 2 1.5)))
      (switch-to-buffer orig-buffer)
      (TeX-command "Dvipdfmx" 'TeX-master-file)
      (if-windows (async-sleep (expt 2 1)) (async-sleep (expt 2 0)))
      (switch-to-buffer orig-buffer)
      (split-window-below)
      (other-window 1)
      (find-file (concat TeX-output-dir "/" (TeX-master-file) ".pdf"))))

  (defun preview-latex () (interactive) (preview-region (point-min) (point-max))))

;; ============================================================================
;;  PDF FEATURE
;; ============================================================================

(use-package pdf-tools
  :ensure (:type git :host github :repo "emacsmirror/pdf-tools" :branch "master")
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  (when-windows (setq-default pdf-tools-msys2-directory "C:/msys64"))
  (setq-default pdf-view-use-scaling nil)
  (setq-default pdf-view-image-relief 2)
  (setq-default pdf-view-use-imagemagick t)
  :hook (pdf-view-mode . (lambda () (display-line-numbers-mode -1) (pdf-view-midnight-minor-mode 1))))

(use-package cdlatex
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/cdlatex" :branch "master"))

(provide 'feature-latex)
