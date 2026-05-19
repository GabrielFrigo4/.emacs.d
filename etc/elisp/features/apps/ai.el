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
  :bind
  (("C-c g" . gptel)
   ("C-c RET" . gptel-send)
   ("C-c m" . gptel-select-model))
  :config
  (setq-default chatgpt-backend (gptel-make-openai "ChatGPT" :stream t :key llm-openai-api-key))
  (setq-default deepseek-backend (gptel-make-deepseek "DeepSeek" :stream t :key llm-deepseek-api-key))
  (setq-default gemini-backend (gptel-make-gemini "Gemini" :stream t :key llm-google-api-key))

  (setq-default gptel-model llm-google-model)
  (setq-default gptel-backend gemini-backend)

  (defvar gptel-models '("gemini-2.5-pro" "gemini-2.5-flash" "gemini-2.5-flash-lite")
    "Models List for GPTEL")

  (defun gptel-select-model ()
    "Interactively select a model to use with GPTEL"
    (interactive)
    (let ((selected-model (completing-read "Select the Model: " gptel-models nil t nil nil (symbol-name gptel-model))))
      (if (and selected-model (not (string-empty-p selected-model)))
          (progn
            (setq gptel-model (intern selected-model))
            (message "gptel-model defined as: %s" gptel-model))
        (message "Model selection canceled.")))))

(use-package org-ai
  :ensure (:type git :host github :repo "rksm/org-ai" :branch "master")
  :after (org llm)
  :hook (org-mode . org-ai-mode)
  :config
  (setq-default org-ai-default-chat-system-prompt
                "Act like a wizard that can only generate raw text. Your response should not contain any Markdown formatting. I need to copy and paste your output into a plain text editor without losing any information.")
  (setq-default org-ai-default-inject-sys-prompt-for-all-messages t)
  (setq-default org-ai-default-chat-model llm-google-model))

(provide 'feature-ai)
