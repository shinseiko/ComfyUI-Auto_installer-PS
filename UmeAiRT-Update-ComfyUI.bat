@echo off
setlocal
chcp 65001 >nul
set "PYTHONPATH="
set "PYTHONNOUSERSITE=1"
set "PYTHONUTF8=1"
where pwsh >nul 2>&1 && set "PS_EXE=pwsh" || set "PS_EXE=powershell"
title UmeAiRT ComfyUI Updater
"%PS_EXE%" -ExecutionPolicy Bypass -File "%~dp0scripts\Update-ComfyUI.ps1" %*
if %errorlevel% neq 0 pause
