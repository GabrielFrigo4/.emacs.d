;; ################
;; # C and C++
;; ################


(setq-local custom-c-and-c++-startup
            '(
              ;; Define Variables
              ("\\w" . font-lock-variable-name-face)
              ))

(setq-local custom-c-and-c++-defaults
	          '(
              ;; Constants
              ("\\(\\_<[_]*[A-Z]\\(?:[A-Z0-9_]\\)?+\\)\\_>" . font-lock-constant-face)
              ))

(setq-local custom-c-and-c++-keywords
	          '(
              ;; Input & Output & Error
              ("\\<\\(stdin\\|stdout\\|stderr\\)\\>" . font-lock-variable-name-face)
		          ("\\<\\(STDIN_FILENO\\|STDOUT_FILENO\\|STDERR_FILENO\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FILE\\)\\>" . font-lock-type-face)

              ;; Standard Types
              ("\\<\\(float\\|double\\|int\\)\\>" . font-lock-type-face)
              ("\\<\\(char\\|bool\\|void\\)\\>" . font-lock-type-face)
              ("\\<\\(short\\|long\\)\\>" . font-lock-type-face)
              ("\\<\\(signed\\|unsigned\\)\\>" . font-lock-type-face)

              ;; Types C/C++
              ("\\<\\(size_t\\|ptrdiff_t\\|sig_atomic_t\\)\\>" . font-lock-type-face)
              ("\\<\\(wchar_t\\|wint_t\\)\\>" . font-lock-type-face)

              ;; Types CINT
              ("\\<\\(intmax_t\\|uintmax_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int8_t\\|uint8_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int16_t\\|uint16_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int32_t\\|uint32_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int64_t\\|uint64_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_least8_t\\|uint_least8_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_least16_t\\|uint_least16_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_least32_t\\|uint_least32_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_least64_t\\|uint_least64_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_fast8_t\\|uint_fast8_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_fast16_t\\|uint_fast16_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_fast32_t\\|uint_fast32_t\\)\\>" . font-lock-type-face)
              ("\\<\\(int_fast64_t\\|uint_fast64_t\\)\\>" . font-lock-type-face)
              ("\\<\\(intptr_t\\|uintptr_t\\)\\>" . font-lock-type-face)

              ;; Standard Keyword
              ("\\<\\(const\\|return\\)\\>" . font-lock-keyword-face)

              ;; Constants CLIMITS
              ("\\<\\(CHAR_BIT\\|MB_LEN_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(SCHAR_MIN\\|SCHAR_MAX\\|UCHAR_MAX\\|CHAR_MIN\\|CHAR_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(SHRT_MIN\\|SHRT_MAX\\|USHRT_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_MIN\\|INT_MAX\\|UINT_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(LONG_MIN\\|LONG_MAX\\|ULONG_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(LLONG_MIN\\|LLONG_MAX\\|ULLONG_MAX\\)\\>" . font-lock-builtin-face)

              ;; Constants CFLOAT
              ("\\<\\(FLT_RADIX\\|FLT_ROUNDS\\|FLT_EVAL_METHOD\\|DECIMAL_DIG\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_MANT_DIG\\|DBL_MANT_DIG\\|LDBL_MANT_DIG\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_DIG\\|DBL_DIG\\|LDBL_DIG\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_MIN_EXP\\|DBL_MIN_EXP\\|LDBL_MIN_EXP\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_MIN_10_EXP\\|DBL_MIN_10_EXP\\|LDBL_MIN_10_EXP\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_MAX_EXP\\|DBL_MAX_EXP\\|LDBL_MAX_EXP\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_MAX_10_EXP\\|DBL_MAX_10_EXP\\|LDBL_MAX_10_EXP\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_MAX\\|DBL_MAX\\|LDBL_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_EPSILON\\|DBL_EPSILON\\|LDBL_EPSILON\\)\\>" . font-lock-builtin-face)
              ("\\<\\(FLT_MIN\\|DBL_MIN\\|LDBL_MIN\\)\\>" . font-lock-builtin-face)

              ;; Constants CINT
              ("\\<\\(INTMAX_MIN\\|INTMAX_MAX\\|UINTMAX_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT8_MIN\\|INT8_MAX\\|UINT8_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT16_MIN\\|INT16_MAX\\|UINT16_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT32_MIN\\|INT32_MAX\\|UINT32_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT64_MIN\\|INT64_MAX\\|UINT64_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_LEAST8_MIN\\|INT_LEAST8_MAX\\|UINT_LEAST8_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_LEAST16_MIN\\|INT_LEAST16_MAX\\|UINT_LEAST16_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_LEAST32_MIN\\|INT_LEAST32_MAX\\|UINT_LEAST32_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_LEAST64_MIN\\|INT_LEAST64_MAX\\|UINT_LEAST64_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_FAST8_MIN\\|INT_FAST8_MAX\\|UINT_FAST8_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_FAST16_MIN\\|INT_FAST16_MAX\\|UINT_FAST16_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_FAST32_MIN\\|INT_FAST32_MAX\\|UINT_FAST32_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_FAST64_MIN\\|INT_FAST64_MAX\\|UINT_FAST64_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INTPTR_MIN\\|INTPTR_MAX\\|UINTPTR_MAX\\)\\>" . font-lock-builtin-face)

              ;; Standard CINT
              ("\\<\\(SIZE_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(PTRDIFF_MIN\\|PTRDIFF_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(SIG_ATOMIC_MIN\\|SIG_ATOMIC_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(WCHAR_MIN\\|WCHAR_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(WINT_MIN\\|WINT_MAX\\)\\>" . font-lock-builtin-face)

              ;; Macros CINT
              ("\\<\\(INTMAX_C\\|UINTMAX_C\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT8_C\\|UINT8_C\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT16_C\\|UINT16_C\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT32_C\\|UINT32_C\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT64_C\\|UINT64_C\\)\\>" . font-lock-builtin-face)
              ))

(setq-local custom-c-and-c++-functions
            '(
              ;; Define Functions
              ("\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>\\s-*(" . font-lock-function-name-face)
              ))


;; ################
;; # C
;; ################


(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-startup)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-defaults)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-keywords)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-functions)


;; ################
;; # C++
;; ################


(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-startup)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-defaults)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-keywords)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-functions)
