;; ============================================================================
;;  UI TWEAKS
;; ============================================================================


(setq-default blink-cursor-interval 0.5)
(setq-default visible-bell t)
(setq-default inhibit-compacting-font-caches t)
(setq-default truncate-lines nil)


;; ============================================================================
;;  FILE MANAGEMENT
;; ============================================================================


(setq-default make-backup-files nil)
(setq-default create-lockfiles nil)


;; ============================================================================
;;  AUTO REVERT MODE
;; ============================================================================


(global-auto-revert-mode 1)
(setq-default global-auto-revert-non-file-buffers t)


;; ============================================================================
;;  VISUAL LINE MODE (SMART WRAP)
;; ============================================================================


(add-hook 'org-mode-hook
          #'visual-line-mode)

(add-hook 'prog-mode-hook
          (lambda ()
            (visual-line-mode -1)))


;; ============================================================================
;;  EMACS 30+ FEATURE (COMPLETION PREVIEW)
;; ============================================================================


(when (fboundp 'global-completion-preview-mode)
  (global-completion-preview-mode 1))


;; ============================================================================
;;  MACOS KEYBINDINGS
;; ============================================================================


(if-darwin
 (setq-default mac-command-modifier 'meta
               mac-option-modifier 'super))


;; ============================================================================
;;  CODING SYSTEM
;; ============================================================================


(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(with-eval-after-load 'ob-async
  (add-hook 'ob-async-pre-execute-src-block-hook
            (lambda ()
              (set-language-environment "UTF-8")
              (prefer-coding-system 'utf-8))))


;; ============================================================================
;;  PERFORMANCE
;; ============================================================================


(setq-default max-image-size (expt 2 24))
(setq-default image-cache-eviction-delay (expt 2 8))

(setq-default async-shell-command-buffer 'new-buffer)
