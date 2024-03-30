;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 23))))

;; EMACS Auto-Options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(tsdh-dark))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages '(ace-window try))
 '(show-paren-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "RobotoMono Nerd Font Mono" :foundry "outline" :slant normal :weight regular :height 108 :width normal)))))

(defconst dot-emacs (concat (getenv "HOME") "/.emacs.d/" "profile.el")
    "My dot emacs file")
 
(require 'bytecomp)
(setq compiled-dot-emacs (byte-compile-dest-file dot-emacs))
 
(if (or (not (file-exists-p compiled-dot-emacs))
	(file-newer-than-file-p dot-emacs compiled-dot-emacs)
        (equal (nth 4 (file-attributes dot-emacs)) (list 0 0)))
    (load dot-emacs)
  (load compiled-dot-emacs))
 
(add-hook 'kill-emacs-hook
          '(lambda () (and (file-newer-than-file-p dot-emacs compiled-dot-emacs)
                           (byte-compile-file dot-emacs))))
