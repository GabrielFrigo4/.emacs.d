;;; aweww.el --- An "Awesome" EWW Configuration -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; This file provides a set of configurations for the EWW browser
;; (Emacs Web Wowser) and its SHR (Simple HTML Reader) renderer
;; to improve readability, code highlighting, and color rendering.
;;
;; It uses 'shrface' and 'shr-tag-pre-highlight' to enhance
;; the appearance of rendered content.
;;
;; Key Features:
;; - Sets dynamic rendering widths based on frame size.
;; - Cleans up excessive blank lines after rendering.
;; - Integrates 'shrface' for better syntax highlighting and faces.
;; - Sets sensible defaults for a better browsing experience.

;;; Code:

;; ################
;; # Dependencies
;; ################

;; Require Shrface carefully
(require 'shr-tag-pre-highlight nil t)
(require 'shrface nil t)

;; ################
;; # EWW / SHR
;; ################

;; Setup "Simple HTML Reader" (SHR)
(setq-default shr-nbsp ?\u00A0)
(setq-default shr-inhibit-images nil)
(setq-default shr-use-fonts nil)
(setq-default shr-use-colors nil)
(setq-default shr-width 80)

;; Set SHR Width Dynamically (Buffer-Local)
(defun aweww-set-shr-width (&rest _args)
  "Adjust 'shr-width' based on the current frame width buffer-locally."
  (when (frame-live-p (selected-frame))
    (when (display-graphic-p (selected-frame))
      (setq-local shr-width (- (frame-width) 8)))))

(advice-add 'eww-render :before #'aweww-set-shr-width)

;; Toggles
(defun aweww-toggle-readable ()
  "Toggle eww-readable in the current buffer."
  (interactive)
  (eww-readable))

(defun aweww-toggle-images ()
  "Toggle images in the current buffer."
  (interactive)
  (setq-local shr-inhibit-images (not shr-inhibit-images))
  (eww-reload))

;; ################
;; # Renders
;; ################


;; Define the custom rendering functions, combining
;; standard EWW handlers with 'shrface' faces and
;; <pre> block highlighting.
(defvar aweww-general-rendering-functions
  (append '((title . eww-tag-title)
            (form . eww-tag-form)
            (input . eww-tag-input)
            (button . eww-form-submit)
            (textarea . eww-tag-textarea)
            (select . eww-tag-select)
            (link . eww-tag-link)
            (meta . eww-tag-meta)
            (code . shrface-tag-code)
            (pre . shr-tag-pre-highlight))
          shrface-supported-faces-alist)
  "AWEWW's list of rendering functions for SHR.")

;; Tell SHR to use our custom rendering list.
(setq-default shr-external-rendering-functions aweww-general-rendering-functions)


;; ################
;; # Hooks
;; ################

;; Cleanup Excessive Blank Lines
(defun aweww-cleanup-newlines ()
  "Remove excessive blank lines in AWEWW buffers.

Replaces three or more newlines with exactly two."
  (when (eq major-mode 'eww-mode)
    (let ((inhibit-read-only t))
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward "\\(\s*\n\\)\\{3,\\}" nil t)
          (replace-match "\n\n"))))))

;; Defer Newline Cleanup
(defun aweww-cleanup-newlines-deferred ()
  "Run newline cleanup after EWW finishes rendering.

Uses a 0-second timer to ensure this runs *after*
the current rendering process completes."
  (run-at-time 0 nil #'aweww-cleanup-newlines))

;; Setup 'shrface' for EWW
(defun shrface-eww-setup ()
  "Configure 'shrface' in the EWW buffer.

Runs 'shrface-regexp' unless 'shrface-toggle-bullets'
is disabled by the user."
  (unless shrface-toggle-bullets
    (shrface-regexp)))

;; Add hooks to run after EWW renders
(add-hook 'eww-after-render-hook #'shrface-eww-setup)
(add-hook 'eww-after-render-hook #'aweww-cleanup-newlines-deferred)


;; ################
;; # AWEWW
;; ################


;; Alias to AWEWW
(defalias 'aweww 'eww)

;; Provide *aweww*
(provide 'aweww)

;;; aweww.el ends here