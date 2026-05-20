@echo off
set "DIR=%~dp0"
emacs --batch -l "%DIR%indent-all.el"
