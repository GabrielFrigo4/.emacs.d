;; #############################################
;; # Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)
;; #############################################

;; ########################
;; # EMACS auto-options
;; ########################

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(tsdh-dark))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(which-key auto-complete neotree lua-mode rust-mode nasm-mode ace-window try))
 '(tool-bar-mode nil)
 '(xterm-mouse-mode 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "RobotoMono Nerd Font Mono" :foundry "outline" :slant normal :weight regular :height 108 :width normal)))))


;; ########################
;; # EMACS setup-options
;; ########################

;; Compile all ".el" files to ".elc"
(byte-recompile-directory (expand-file-name (concat (getenv "HOME") "/.emacs.d")) 0)

;; Add load-path "Emacs-Lisp"
(setq load-path (cons (concat (getenv "HOME") "/.emacs.d/Emacs-Lisp") load-path))

;; Load ".el" and ".elc" files
(load "startup.elc")
(load "package.elc")
(load "profile.elc")

;; ##################################
;; # Default garbage collection
(setq gc-cons-threshold (expt 2 20))
;; ##################################
