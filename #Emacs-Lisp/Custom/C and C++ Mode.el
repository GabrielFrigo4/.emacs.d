;; ################
;; # C and C++
;; ################


(setq-local custom-c-and-c++-defaults
	          '(
              ()
              ))

(setq-local custom-c-and-c++-keywords
	          '(
              ("\\<\\(stdin\\|stdout\\|stderr\\)\\>" . font-lock-variable-name-face)
		          ("\\<\\(STDIN_FILENO\\|STDOUT_FILENO\\|STDERR_FILENO\\)\\>" . font-lock-constant-face)
		          ("\\<\\(int8_t\\|int16_t\\|int32_t\\|int64_t\\)\\>" . font-lock-type-face)
		          ("\\<\\(uint8_t\\|uint16_t\\|uint32_t\\|uint64_t\\)\\>" . font-lock-type-face)
              ("\\<\\(printf\\|scanf\\|fopen\\|malloc\\|free\\)\\>" . font-lock-builtin-face)
              ("\\<\\(cin\\|wcin\\|cout\\|wcout\\|cerr\\|wcerr\\)\\>" . font-lock-builtin-face)
              ))

(setq-local custom-c-and-c++-functions
            '(
              ("\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ))

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-defaults)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-keywords)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-functions)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-keywords)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-functions)
