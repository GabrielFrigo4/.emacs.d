;; ################
;; # EWW
;; ################


;; Unix Manual Online
(defun mandoc (section command)
  "Unix Manual Pages Online (Linux Manual Pages).
SECTION is the manual section (e.g., 1 for general commands).
COMMAND is the name of the command to look up."
  (interactive "sManual Section: \nsCommand: ")
  (let ((url (format "https://man.cx/%s(%s)" (url-hexify-string command) (url-hexify-string section))))
    (eww url)))
