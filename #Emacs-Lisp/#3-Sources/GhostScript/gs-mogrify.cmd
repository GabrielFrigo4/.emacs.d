@echo off
setlocal enabledelayedexpansion

REM Run GhostScript
rungs.exe %*

REM Get PNG Path
set "arg1=%~1"
for /f "tokens=2 delims==" %%A in ("%arg1%") do set "path=%%A"
set "path=!path:%%d=*!

REM Command List
REM [212;42] => 170
REM [28;7] => 21
mogrify.exe -fuzz 0% -fill "RGB(42,42,42)" -opaque "RGB(28,28,28)" -format png "!path!"
mogrify.exe -fuzz 1% -fill "RGB(93,93,93)" -opaque "RGB(22,22,22)" -format png "!path!"
mogrify.exe -fuzz 2% -fill "RGB(127,127,127)" -opaque "RGB(17,17,17)" -format png "!path!"
mogrify.exe -fuzz 2% -fill "RGB(144,144,144)" -opaque "RGB(15,15,15)" -format png "!path!"
mogrify.exe -fuzz 2% -fill "RGB(161,161,161)" -opaque "RGB(13,13,13)" -format png "!path!"
mogrify.exe -fuzz 3% -fill "RGB(178,178,178)" -opaque "RGB(11,11,11)" -format png "!path!"
mogrify.exe -fuzz 3% -fill "RGB(195,195,195)" -opaque "RGB(9,9,9)" -format png "!path!"
mogrify.exe -fuzz 3% -fill "RGB(212,212,212)" -opaque "RGB(7,7,7)" -format png "!path!"

endlocal
