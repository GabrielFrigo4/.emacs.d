;; ################
;; # C and C++
;; ################

(defun custom-c-and-c++-keywords ()
  '(("\\<\\(int8_t\\|int16_t\\|int32_t\\|int64_t\\)\\>" . font-lock-type-face)
  ("\\<\\(uint8_t\\|uint16_t\\|uint32_t\\|uint64_t\\)\\>" . font-lock-type-face)))

(font-lock-add-keywords
 'c-mode
 (custom-c-and-c++-keywords))

(font-lock-add-keywords
 'c++-mode
 (custom-c-and-c++-keywords))
