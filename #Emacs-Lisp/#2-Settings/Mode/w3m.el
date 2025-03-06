;; ################
;; # W3M
;; ################


;; Import W3M
(require 'w3m-load)
(require 'mime-w3m)

;; Set Display Mode to Plain
(w3m-display-mode 'plain)

;; List of Unix Manual Links
(setq-default unix-manual-list
              ["https://www.man7.org/linux/man-pages/man%s/%s.%s.html"
               "https://man.cx/%s(%s)"
               "https://man.freebsd.org/cgi/man.cgi?query=%s&sektion=%s"
               "https://man.openbsd.org/%s.%s"
               "https://man.netbsd.org/%s.%s"
               "https://man.dragonflybsd.org/?command=%s&section=%s"])

;; Current Unix Manual Link
(setq-default unix-manual-active 0)

;; Unix Manual Online (W3M)
(defun w3m/mandoc (section command)
  "Unix Manual Pages Online (Linux/BSD Manual Pages).
SECTION is the manual section number.
COMMAND is the name of the command."
  (interactive "sSection: \nsCommand: ")
  (let* ((url-template (aref unix-manual-list unix-manual-active))
         (number (if (and (> (length section) 0) (not (string-match-p "[0-9]" (string (aref section (1- (length section)))))))
                     (substring section 0 (1- (length section)))
                   section))
         (url (if (string-match "%s.*%s.*%s" url-template)
                  (format url-template (url-hexify-string number) (url-hexify-string command) (url-hexify-string section))
                (format url-template (url-hexify-string command) (url-hexify-string section)))))
    (w3m-browse-url url)))

;; Unix Manual Online (EWW)
(defun eww/mandoc (section command)
  "Unix Manual Pages Online (Linux/BSD Manual Pages).
SECTION is the manual section number.
COMMAND is the name of the command."
  (interactive "sSection: \nsCommand: ")
  (let* ((url-template (aref unix-manual-list unix-manual-active))
         (number (if (and (> (length section) 0) (not (string-match-p "[0-9]" (string (aref section (1- (length section)))))))
                     (substring section 0 (1- (length section)))
                   section))
         (url (if (string-match "%s.*%s.*%s" url-template)
                  (format url-template (url-hexify-string number) (url-hexify-string command) (url-hexify-string section))
                (format url-template (url-hexify-string command) (url-hexify-string section)))))
    (eww url)))

;; Create Alias of Unix Manual Online (W3M)
(defalias 'mandoc 'w3m/mandoc
  "Unix Manual Pages Online (Linux/BSD Manual Pages).
SECTION is the manual section number.
COMMAND is the name of the command.")
