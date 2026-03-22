@echo off
setlocal
chcp 65001 >nul
set "PYTHONPATH="
set "PYTHONNOUSERSITE=1"
set "PYTHONUTF8=1"
where pwsh >nul 2>&1 && set "PS_EXE=pwsh" || set "PS_EXE=powershell"
set "INSTALL_DIR=%~dp0"
if "%INSTALL_DIR:~-1%"=="\" set "INSTALL_DIR=%INSTALL_DIR:~0,-1%"
set "INSTALL_DIR=%INSTALL_DIR:\=/%"
title UmeAiRT Bootstrap

echo ================================================================================
echo   UmeAiRT Bootstrap -- Download fresh copies of all scripts
echo ================================================================================
echo.
echo   Run this to repair a broken or out-of-date install before updating.
echo   After this completes, run UmeAiRT-Update-ComfyUI.bat normally.
echo.

:: If Bootstrap-Downloader.ps1 is missing (completely broken install),
:: download it from the upstream default before proceeding.
if not exist "%INSTALL_DIR%\scripts\Bootstrap-Downloader.ps1" (
    echo [INFO] Bootstrap-Downloader.ps1 not found. Fetching from upstream...
    if not exist "%INSTALL_DIR%\scripts" mkdir "%INSTALL_DIR%\scripts"
    "%PS_EXE%" -ExecutionPolicy Bypass -Command "$url = 'https://raw.githubusercontent.com/UmeAiRT/ComfyUI-Auto_installer/main/scripts/Bootstrap-Downloader.ps1'; Invoke-WebRequest -Uri $url -OutFile '%INSTALL_DIR%/scripts/Bootstrap-Downloader.ps1' -UseBasicParsing -ErrorAction Stop"
    if %errorlevel% neq 0 (
        echo.
        echo [ERROR] Could not download Bootstrap-Downloader.ps1.
        echo         Check your internet connection and try again.
        pause
        exit /b 1
    )
    echo [OK] Bootstrap-Downloader.ps1 downloaded.
    echo.
)

"%PS_EXE%" -ExecutionPolicy Bypass -File "%INSTALL_DIR%\scripts\Bootstrap-Downloader.ps1" -InstallPath "%INSTALL_DIR%" %*

if %errorlevel% neq 0 (
    echo.
    echo [WARN] Bootstrap completed with download errors.
    echo        Some files may not have been updated. Check logs\bootstrap.log.
    pause
    exit /b 1
)

echo.
echo [OK] All scripts are up to date.
echo      You can now run UmeAiRT-Update-ComfyUI.bat to update ComfyUI.
echo.
pause
