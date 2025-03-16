@echo off
setlocal enabledelayedexpansion

set "section=%1"
set "command=%2"
set "number=%1"

for /f "delims=0123456789" %%a in ("!number:~-1!") do (
	set "number=!number:~0,-1!"
)

wsl w3m "https://www.man7.org/linux/man-pages/man%number%/%command%.%section%.html"

endlocal
