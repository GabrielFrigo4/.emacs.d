;; ============================================================================
;;  AI FEATURE
;; ============================================================================

(use-package llm
  :ensure (:type git :host github :repo "emacsmirror/llm" :branch "master")
  :defer t
  :config
  (setq-default llm-openai-api-key (auth-source-pick-first-password :host "api.openai.com"))
  (setq-default llm-deepseek-api-key (auth-source-pick-first-password :host "api.deepseek.com"))
  (setq-default llm-google-api-key (auth-source-pick-first-password :host "generativelanguage.googleapis.com"))
  (setq-default llm-google-model "gemini-2.5-flash-lite"))

(use-package gptel
  :ensure (:type git :host github :repo "emacsmirror/gptel" :branch "master")
  :defer t
  :bind (("C-c g" . gptel) ("C-c RET" . gptel-send) ("C-c m" . gptel-select-model))
  :config
  (setq-default gemini-backend (gptel-make-gemini "Gemini" :stream t :key llm-google-api-key))
  (setq-default gptel-model llm-google-model)
  (setq-default gptel-backend gemini-backend)
  (defun gptel-select-model () (interactive) (message "Model selection...")))

(provide 'feature-ai)
