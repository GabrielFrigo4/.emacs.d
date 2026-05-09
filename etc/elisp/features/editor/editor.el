;; ============================================================================
;;  EDITOR FEATURE
;; ============================================================================

;; ----------------------------------------------------------------------------
;;  EVIL CONFIGURATION
;; ----------------------------------------------------------------------------

(use-package evil
  :ensure (:type git :host github :repo "emacsmirror/evil" :branch "master")
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-default-state 'emacs)
  :config
  (evil-mode 1))

(use-package evil-tutor
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/evil-tutor" :branch "master"))

(use-package smartparens
  :ensure (:type git :host github :repo "emacsmirror/smartparens" :branch "master")
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config)
  (setq-default sp-show-pair-from-inside t)
  (setq-default sp-autoskip-closing-pair t)
  (setq-default sp-highlight-pair-overlay nil))

(use-package multiple-cursors
  :defer t
  :ensure (:type git :host github :repo "emacsmirror/multiple-cursors" :branch "master"))

;; ----------------------------------------------------------------------------
;;  FORMATTING CONFIGURATION
;; ----------------------------------------------------------------------------

(use-package apheleia
  :ensure (:type git :host github :repo "emacsmirror/apheleia" :branch "master")
  :hook (prog-mode . apheleia-mode)
  :config
  (setq apheleia-formatters
        (append '((stylua . ("stylua" "--indent-type" "Tabs" "--indent-width" "4" "-")))
                apheleia-formatters))
  (setq apheleia-mode-alist
        (append '((js-mode . prettier)
                  (js2-mode . prettier)
                  (js-ts-mode . prettier)
                  (typescript-mode . prettier)
                  (typescript-ts-mode . prettier)
                  (tsx-ts-mode . prettier)
                  (json-mode . prettier)
                  (json-ts-mode . prettier)
                  (css-mode . prettier)
                  (css-ts-mode . prettier)
                  (scss-mode . prettier)
                  (less-mode . prettier)
                  (html-mode . prettier)
                  (html-ts-mode . prettier)
                  (yaml-mode . prettier)
                  (yaml-ts-mode . prettier)
                  (markdown-mode . prettier)
                  (markdown-ts-mode . prettier)
                  (graphql-mode . prettier)
                  (lua-mode . stylua)
                  (lua-ts-mode . stylua)
                  (c-mode . clang-format)
                  (c++-mode . clang-format)
                  (c-ts-mode . clang-format)
                  (c++-ts-mode . clang-format))
                apheleia-mode-alist)))

(provide 'feature-editor)
