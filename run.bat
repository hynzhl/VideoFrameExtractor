@echo off
echo Checking for FFmpeg...
where ffmpeg >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo WARNING: FFmpeg is not installed or not in PATH!
    echo.
    echo This application requires FFmpeg to extract video frames.
    echo Please download FFmpeg from: https://ffmpeg.org/download.html
    echo.
    echo After downloading, please:
    echo 1. Extract the FFmpeg archive
    echo 2. Add the 'bin' folder to your system PATH, or
    echo 3. Place ffmpeg.exe in the same directory as this application
    echo.
    pause
    exit /b 1
)

echo FFmpeg found! Starting application...
echo.

start "" "build\Release\VideoFrameExtractor.exe"
