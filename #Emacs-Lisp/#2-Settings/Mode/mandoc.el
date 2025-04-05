;; ################
;; # Mandoc
;; ################


;; List of Unix Manual Links
(setq-default unix-manual-template-list
              ["https://www.man7.org/linux/man-pages/man%s/%s.%s.html"
               "https://man.cx/%s(%s)"
               "https://man.freebsd.org/cgi/man.cgi?query=%s&sektion=%s"
               "https://man.openbsd.org/%s.%s"
               "https://man.netbsd.org/%s.%s"
               "https://man.dragonflybsd.org/?command=%s&section=%s"])

;; Current Unix Manual Link
(setq-default unix-manual-active 0)

;; Unix Manual Online (Browser)
(defun browser/mandoc (browser section command)
  "Unix Manual Pages Online (Linux/BSD Manual Pages).
BROWSER is the web browser that open manual.
SECTION is the manual section number.
COMMAND is the name of the command."
  (let* ((url-template (aref unix-manual-template-list unix-manual-active))
         (number (if (and (> (length section) 0) (not (string-match-p "[0-9]" (string (aref section (1- (length section)))))))
                     (substring section 0 (1- (length section)))
                   section))
         (url (if (string-match "%s.*%s.*%s" url-template)
                  (format url-template (url-hexify-string number) (url-hexify-string command) (url-hexify-string section))
                (format url-template (url-hexify-string command) (url-hexify-string section)))))
    (funcall browser url)))

;; Unix Manual Online (W3M)
(defun w3m/mandoc (entry)
  "Unix Manual Pages Online (Linux/BSD Manual Pages).
Option 1: \"SECTION COMMAND\"
Option 2: \"COMMAND(SECTION)\"
Option 3: \"COMMAND.SECTION\"
SECTION is the manual section number.
COMMAND is the name of the command."
  (interactive "sManual Entry: ")
  (let (section command)
    (cond
     ;; Option 1: SECTION COMMAND (e.g., "3 printf" or "3p printf")
     ((string-match "^\\([0-9]+[a-z]?\\)\\s-+\\(.+\\)$" entry)
      (setq section (match-string 1 entry)
            command (match-string 2 entry)))
     ;; Option 2: COMMAND(SECTION) (e.g., "printf(3)" or "printf(3p)")
     ((string-match "^\\(.+\\)(\\([0-9]+[a-z]?\\))$" entry)
      (setq command (match-string 1 entry)
            section (match-string 2 entry)))
     ;; Option 3: COMMAND.SECTION (e.g., "printf.3" or "printf.3p")
     ((string-match "^\\(.+\\)\\.\\([0-9]+[a-z]?\\)$" entry)
      (setq command (match-string 1 entry)
            section (match-string 2 entry)))
     ;; Get an Error: Invalid Manual Entry Format
     (t
      (error "Invalid manual entry format")))
    (browser/mandoc #'w3m-browse-url section command)))

;; Unix Manual Online (EWW)
(defun eww/mandoc (entry)
  "Unix Manual Pages Online (Linux/BSD Manual Pages).
Option 1: \"SECTION COMMAND\"
Option 2: \"COMMAND(SECTION)\"
Option 3: \"COMMAND.SECTION\"
SECTION is the manual section number.
COMMAND is the name of the command."
  (interactive "sManual Entry: ")
  (let (section command)
    (cond
     ;; Option 1: SECTION COMMAND (e.g., "3 printf" or "3p printf")
     ((string-match "^\\([0-9]+[a-z]?\\)\\s-+\\(.+\\)$" entry)
      (setq section (match-string 1 entry)
            command (match-string 2 entry)))
     ;; Option 2: COMMAND(SECTION) (e.g., "printf(3)" or "printf(3p)")
     ((string-match "^\\(.+\\)(\\([0-9]+[a-z]?\\))$" entry)
      (setq command (match-string 1 entry)
            section (match-string 2 entry)))
     ;; Option 3: COMMAND.SECTION (e.g., "printf.3" or "printf.3p")
     ((string-match "^\\(.+\\)\\.\\([0-9]+[a-z]?\\)$" entry)
      (setq command (match-string 1 entry)
            section (match-string 2 entry)))
     ;; Get an Error: Invalid Manual Entry Format
     (t
      (error "Invalid manual entry format")))
    (browser/mandoc #'eww section command)))

;; Create Alias of Unix Manual Online (EWW)
(defalias 'mandoc 'eww/mandoc
  "Unix Manual Pages Online (Linux/BSD Manual Pages).
Option 1: \"SECTION COMMAND\"
Option 2: \"COMMAND(SECTION)\"
Option 3: \"COMMAND.SECTION\"
SECTION is the manual section number.
COMMAND is the name of the command.")
