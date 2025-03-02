;; ################
;; # EWW
;; ################


;; Unix Manual Web
(defun unix-man (command)
  "Unix Manual Pages Online (NetBSD Manual Pages)"
  (interactive "sUnix Manual Pages Online: ")
  (let ((url (format "https://man.netbsd.org/%s" (url-hexify-string command))))
    (eww url)))
