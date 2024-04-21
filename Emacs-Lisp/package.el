;;################
;; Packages
;;################

;; Install Packages
(use-package try
  :ensure t)
(use-package nasm-mode
  :ensure t)
(use-package rust-mode
  :ensure t)
(use-package lua-mode
  :ensure t)
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))
(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-right-bottom)
    ))
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))
(when (eq system-type 'gnu/linux)

)
(if (eq system-type 'windows-nt)
  (use-package neotree
    :ensure t
    :config (setq neo-theme (if (display-graphic-p) 'arrow))
    :bind ("C-\\" . 'neotree-toggle))
  (use-package neotree
    :ensure t
    :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    :bind ("C-\\" . 'neotree-toggle))
)

;; Settings Packages
(setq-default neo-show-hidden-files t)
