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

(setq-local custom-c-and-c++-constants
	          '(
              ;; Input & Output & Error
              ("\\<\\(STDIN_FILENO\\|STDOUT_FILENO\\|STDERR_FILENO\\)\\>" . font-lock-builtin-face)
              
              ;; CLIMITS
              ("\\<\\(CHAR_BIT\\|MB_LEN_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(SCHAR_MIN\\|SCHAR_MAX\\|UCHAR_MAX\\|CHAR_MIN\\|CHAR_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(SHRT_MIN\\|SHRT_MAX\\|USHRT_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(INT_MIN\\|INT_MAX\\|UINT_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(LONG_MIN\\|LONG_MAX\\|ULONG_MAX\\)\\>" . font-lock-builtin-face)
              ("\\<\\(LLONG_MIN\\|LLONG_MAX\\|ULLONG_MAX\\)\\>" . font-lock-builtin-face)

              ;; CFLOAT
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

              ;; CINT
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

(setq-local custom-c-and-c++-types
	          '(
              ;; Microsoft
              ("\\<\\(ATOM\\|BOOL\\|BOOLEAN\\|BYTE\\|USN\\|WCHAR\\|WORD\\|WPARAM\\)\\>" . font-lock-type-face)
              ("\\<\\(CCHAR\\|CHAR\\|COLORREF\\|DWORD\\|DWORDLONG\\|DWORD_PTR\\)\\>" . font-lock-type-face)
              ("\\<\\(DWORD32\\|DWORD64\\|FLOAT\\|HACCEL\\|HALF_PTR\\|HANDLE\\|HBITMAP\\)\\>" . font-lock-type-face)
              ("\\<\\(HBRUSH\\|HCOLORSPACE\\|HCONV\\|HCONVLIST\\|HCURSOR\\|HDC\\|HDDEDATA\\)\\>" . font-lock-type-face)
              ("\\<\\(HDESK\\|HDROP\\|HDWP\\|HENHMETAFILE\\|HFILE\\|HFONT\\|HGDIOBJ\\)\\>" . font-lock-type-face)
              ("\\<\\(HGLOBAL\\|HHOOK\\|HICON\\|HINSTANCE\\|HKEY\\|HKL\\|HLOCAL\\)\\>" . font-lock-type-face)
              ("\\<\\(HMENU\\|HMETAFILE\\|HMODULE\\|HMONITOR\\|HPALETTE\\|HPEN\\|HRESULT\\)\\>" . font-lock-type-face)
              ("\\<\\(HRGN\\|HRSRC\\|HSZ\\|HWINSTA\\|HWND\\|INT\\|INT_PTR\\)\\>" . font-lock-type-face)
              ("\\<\\(INT8\\|INT16\\|INT32\\|INT64\\|LANGID\\|LCID\\|LCTYPE\\)\\>" . font-lock-type-face)
              ("\\<\\(LGRPID\\|LONG\\|LONGLONG\\|LONG_PTR\\|LONG32\\|LONG64\\|LPARAM\\)\\>" . font-lock-type-face)
              ("\\<\\(LPBOOL\\|LPBYTE\\|LPCOLORREF\\|LPCSTR\\|LPCTSTR\\|LPCVOID\\|LPCWSTR\\)\\>" . font-lock-type-face)
              ("\\<\\(LPDWORD\\|LPHANDLE\\|LPINT\\|LPLONG\\|LPSTR\\|LPTSTR\\|LPVOID\\)\\>" . font-lock-type-face)
              ("\\<\\(LPWORD\\|LPWSTR\\|LRESULT\\|PBOOL\\|PBOOLEAN\\|PBYTE\\|PCHAR\\)\\>" . font-lock-type-face)
              ("\\<\\(PCSTR\\|PCTSTR\\|PCWSTR\\|PDWORD\\|PDWORDLONG\\|PDWORD_PTR\\|PDWORD32\\)\\>" . font-lock-type-face)
              ("\\<\\(PDWORD64\\|PFLOAT\\|PHALF_PTR\\|PHANDLE\\|PHKEY\\|PINT\\|PINT_PTR\\)\\>" . font-lock-type-face)
              ("\\<\\(PINT8\\|PINT16\\|PINT32\\|PINT64\\|PLCID\\|PLONG\\|PLONGLONG\\)\\>" . font-lock-type-face)
              ("\\<\\(PLONG_PTR\\|PLONG32\\|PLONG64\\|POINTER_32\\|POINTER_64\\|POINTER_SIGNED\\|POINTER_UNSIGNED\\)\\>" . font-lock-type-face)
              ("\\<\\(PSHORT\\|PSIZE_T\\|PSSIZE_T\\|PSTR\\|PTBYTE\\|PTCHAR\\|PTSTR\\)\\>" . font-lock-type-face)
              ("\\<\\(PUCHAR\\|PUHALF_PTR\\|PUINT\\|PUINT_PTR\\|PUINT8\\|PUINT16\\|PUINT32\\)\\>" . font-lock-type-face)
              ("\\<\\(PUINT64\\|PULONG\\|PULONGLONG\\|PULONG_PTR\\|PULONG32\\|PULONG64\\|PUSHORT\\)\\>" . font-lock-type-face)
              ("\\<\\(PVOID\\|PWCHAR\\|PWORD\\|PWSTR\\|QWORD\\|SC_HANDLE\\|SC_LOCK\\)\\>" . font-lock-type-face)
              ("\\<\\(SERVICE_STATUS_HANDLE\\|SHORT\\|SIZE_T\\|SSIZE_T\\|TBYTE\\|TCHAR\\|UCHAR\\)\\>" . font-lock-type-face)
              ("\\<\\(UHALF_PTR\\|UINT\\|UINT_PTR\\|UINT8\\|UINT16\\|UINT32\\|UINT64\\)\\>" . font-lock-type-face)
              ("\\<\\(ULONG\\|ULONGLONG\\|ULONG_PTR\\|ULONG32\\|ULONG64\\|UNICODE_STRING\\|USHORT\\)\\>" . font-lock-type-face)
              ("\\<\\(__int8\\|__int16\\|__int32\\|__int64\\)\\>" . font-lock-type-face)
              ("\\<\\(__ptr32\\|__ptr64\\|__sptr\\|__uptr\\)\\>" . font-lock-type-face)
              
              ;; Input & Output & Error
              ("\\<\\(stdin\\|stdout\\|stderr\\)\\>" . font-lock-variable-name-face)
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
              ))

(setq-local custom-c-and-c++-functions
            '(
              ;; Define Functions
              ("\\(\\_<\\(?:\\sw\\|\\s_\\)+\\)\\_>\\s-*(" 1 font-lock-function-name-face)
              ))

(setq-local custom-c-and-c++-keywords
	          '(
              ;; Microsoft
              ("\\<\\(WINAPI\\|APIENTRY\\|CALLBACK\\|CONST\\|VOID\\)\\>" . font-lock-builtin-face)
              ("\\<\\(__stdcall\\|__cdecl\\|__nullterminated\\|vararg\\)\\>" . font-lock-keyword-face)
              ))

(setq-local custom-c-keywords
	          '(
              ;; C Keywords
              ("\\<\\(auto\\|break\\|case\\|const\\|continue\\|default\\|do\\|else\\)\\>" . font-lock-keyword-face)
              ("\\<\\(auto\\|enum\\|extern\\|for\\|goto\\|if\\|register\\|return\\)\\>" . font-lock-keyword-face)
              ("\\<\\(static\\|struct\\|switch\\|union\\|volatile\\|while\\|typedef\\)\\>" . font-lock-keyword-face)
              ("\\<\\(sizeof\\)\\>" . font-lock-keyword-face)
              ))

(setq-local custom-c++-keywords
	          '(
              ;; C++ Keywords
              ("\\<\\(auto\\|break\\|case\\|const\\|continue\\|default\\|do\\|else\\)\\>" . font-lock-keyword-face)
              ("\\<\\(auto\\|enum\\|extern\\|for\\|goto\\|if\\|register\\|return\\)\\>" . font-lock-keyword-face)
              ("\\<\\(static\\|struct\\|switch\\|union\\|volatile\\|while\\|typedef\\)\\>" . font-lock-keyword-face)
              ("\\<\\(asm\\|catch\\|delete\\|friend\\|inline\\|new\\|operator\\)\\>" . font-lock-keyword-face)
              ("\\<\\(private\\|protected\\|public\\|register\\|static\\|template\\|this\\)\\>" . font-lock-keyword-face)
              ("\\<\\(throw\\|try\\|virtual\\)\\>" . font-lock-keyword-face)
              ("\\<\\(sizeof\\)\\>" . font-lock-keyword-face)
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
 custom-c-and-c++-constants)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-types)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-functions)

(font-lock-add-keywords
 'c-mode
 custom-c-and-c++-keywords)

(font-lock-add-keywords
 'c-mode
 custom-c-keywords)


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
 custom-c-and-c++-constants)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-types)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-functions)

(font-lock-add-keywords
 'c++-mode
 custom-c-and-c++-keywords)

(font-lock-add-keywords
 'c++-mode
 custom-c++-keywords)
