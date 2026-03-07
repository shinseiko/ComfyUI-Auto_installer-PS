@echo off
setlocal
chcp 65001 >nul

:: ============================================================================
:: File: UmeAiRT-Start-ComfyUI.bat
:: Description: Launcher for ComfyUI (Performance Mode).
::              Thin wrapper — all logic is in scripts\Start-ComfyUI.ps1.
:: Author: UmeAiRT
:: ============================================================================

set "PYTHONPATH="
set "PYTHONNOUSERSITE=1"
set "PYTHONUTF8=1"

:: Prefer PowerShell 7+ (pwsh) if available, fall back to Windows PowerShell 5.1
where pwsh >nul 2>&1 && set "PS_EXE=pwsh" || set "PS_EXE=powershell"

title UmeAiRT ComfyUI
"%PS_EXE%" -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\Start-ComfyUI.ps1" -InstallPath "%~dp0" %*

pause
