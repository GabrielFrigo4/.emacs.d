;; #############################################
;; # Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)
;; #############################################


;;################
;; Startup
;;################

;; Set to 'fundamental-mode
(setq initial-major-mode 'fundamental-mode)

;; Remove message
(setq initial-scratch-message 'nil)


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
 '(display-battery-mode t)
 '(display-line-numbers-type 'relative)
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(inhibit-startup-message t)
 '(package-selected-packages
   '(which-key auto-complete neotree lua-mode rust-mode nasm-mode ace-window try))
 '(size-indication-mode t)
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
(load "package")
(load "settings")
(load "shortcut")


;; ##################################
;; # Default garbage collection
(setq gc-cons-threshold (expt 2 20))
;; ##################################
