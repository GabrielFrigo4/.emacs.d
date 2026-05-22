;; ============================================================================
;;  AWESHELL-UP.EL
;; ============================================================================

;; Copyright (C) 2016 Peter W. V. Tran-Jørgensen

;; Author: Peter W. V. Tran-Jørgensen <peter.w.v.jorgensen@gmail.com>
;; Maintainer: Peter W. V. Tran-Jørgensen <peter.w.v.jorgensen@gmail.com>
;; URL: https://github.com/peterwvj/aweshell/up
;; Created: 14th October 2016
;; Version: 0.0.4
;; Package-Requires: ((emacs "24"))
;; Keywords: eshell

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;; ============================================================================
;;  COMMENTARY
;; ============================================================================

;; Package for quickly navigating to a specific parent directory in
;; eshell without having to repeatedly typing 'cd ..'.  This is
;; achieved using the 'aweshell/up' function, which can be bound to an
;; eshell alias such as 'up'.  As an example, assume that the current
;; working directory is:
;;
;; /home/user/first/second/third/fourth/fifth $
;;
;; Now, in order to quickly go to (say) the directory named 'first' one
;; simply executes:
;;
;; /home/user/first/second/third/fourth/fifth $ up fi
;; /home/user/first $
;;
;; This command searches the current working directory from right to
;; left (while skipping the current directory, 'fifth') for a
;; directory that matches the user's input ('fi' in this case).  If a
;; match is found then eshell changes to that directory, otherwise it
;; does nothing.
;;
;; It is recommended to invoke 'aweshell/up' using an alias as done in
;; the example above.  To do that, add the following to your
;; .eshell.aliases file:
;;
;; alias up aweshell/up $1
;;
;; The complete description of aweshell/up, including other features, is
;; available at: https://github.com/peterwvj/aweshell/up
;;
;; This package is inspired by 'bd', which uses bash to implement
;; similar functionality.
;;
;; See: https://github.com/vigneshwaranr/bd

;; ============================================================================
;;  CODE
;; ============================================================================

(defvar aweshell/up-ignore-case t "Non-nil if searches must ignore case.")

(defvar aweshell/up-print-parent-dir nil "Non-nil if the parent directory must be printed before ‘aweshell/up’ changes to it.")

(defun aweshell/up-closest-parent-dir (file)
  "Find the closest parent directory of a file.
Argument FILE the file to find the closest parent directory for."
  (file-name-directory
   (directory-file-name
    (expand-file-name file))))

(defun aweshell/up-find-parent-dir (path &optional match)
  "Find the parent directory based on the user's input.
Argument PATH the source directory to search from.
Argument MATCH a string that identifies the parent directory to search for."
  (let ((closest-parent (aweshell/up-closest-parent-dir path)))
    (if match
        (let ((case-fold-search aweshell/up-ignore-case))
          (locate-dominating-file closest-parent
                                  (lambda (parent)
                                    (let ((dir (file-name-nondirectory
                                                (expand-file-name
                                                 (directory-file-name parent)))))
                                      (if (string-match match dir)
                                          dir
                                        nil)))))
      closest-parent)))

;;;###autoload
(defun aweshell/up (&optional match)
  "Go to a specific parent directory in eshell.
Argument MATCH a string that identifies the parent directory to go
to."
  (interactive)
  (let* ((path default-directory)
         (parent-dir (aweshell/up-find-parent-dir path match)))
    (progn
      (when parent-dir
        (eshell/cd parent-dir))
      (when aweshell/up-print-parent-dir
        (if parent-dir
            (eshell/echo parent-dir)
          (eshell/echo path))))))

;;;###autoload
(defun aweshell/up-peek (&optional match)
  "Find a specific parent directory in eshell.
Argument MATCH a string that identifies the parent directory to find"
  (interactive)
  (let* ((path default-directory)
         (parent-dir (aweshell/up-find-parent-dir path match)))
    (if parent-dir
        parent-dir
      path)))

(provide 'aweshell-up)
