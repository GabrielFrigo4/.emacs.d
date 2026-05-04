;; ============================================================================
;;  PACKAGE INITIALIZATION
;; ============================================================================


(setq package-enable-at-startup nil)

(when (boundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache
   (expand-file-name "var/cache/eln-cache/" user-emacs-directory)))
