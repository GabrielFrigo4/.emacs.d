@echo off
rem ----------------------------------------------------------------
rem Utility: Emacs Configuration Auto-Indenter
rem ----------------------------------------------------------------
set "DIR=%~dp0"
emacs --batch -l "%DIR%indent-all.el"
