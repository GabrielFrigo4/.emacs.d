;; ################
;; # GitHub
;; ################


;; Import *WebAPI*
(require 'url)
(require 'json)

;; Import *Auth*
(require 'auth-source)

;; Def *github-fetch-latest-release-tag*
(defun github-fetch-latest-release-tag (github-url)
  "For a GitHub URL, fetches the latest release tag via API in an authenticated manner.
Returns the tag name as a string or nil on failure."
  (interactive "sURL do GitHub: ")
  (when (string-match "github\\.com/\\([^/]+\\)/\\([^/]+\\)" github-url)
    (let* ((owner (match-string 1 github-url))
           (repo (match-string 2 github-url))
           (api-url (format "https://api.github.com/repos/%s/%s/releases/latest" owner repo))
           (url-request-cache nil)
           (secrets (auth-source-search :host "api.github.com"))
           (token (when secrets (plist-get (car secrets) :secret)))
           (token-value (if (functionp token) (funcall token) token))
           (url-request-extra-headers
            (when token-value
              `(("Authorization" . ,(format "Bearer %s" token-value))
                ("User-Agent" . "Emacs/treesit-fetcher")))))
      (condition-case err
          (with-current-buffer (url-retrieve-synchronously api-url)
            (goto-char (point-min))
            (when (re-search-forward "\n\n" nil t)
              (let* ((json-object-type 'alist)
                     (json-data (json-read))
                     (tag-name (cdr (assoc 'tag_name json-data))))
                (if tag-name
                    (progn
                      (message "Found: %s -> %s" repo tag-name)
                      tag-name)
                  (message "Warning: 'tag_name' not found in response to %s." repo)
                  nil))))
        ('error
         (message "ERROR fetching release for %s: %s" repo (error-message-string err))
         nil)))))
