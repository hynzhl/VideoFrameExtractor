@echo off
echo Deploying Qt dependencies...
echo.

set QT_DIR=D:\Qt\5.15.2\msvc2019_64
set BUILD_DIR=build\Release
set DEPLOY_DIR=deploy

if not exist %BUILD_DIR%\VideoFrameExtractor.exe (
    echo Error: Application not found. Please build the project first.
    pause
    exit /b 1
)

REM Create deploy directory
if not exist %DEPLOY_DIR% mkdir %DEPLOY_DIR%

REM Copy executable
copy %BUILD_DIR%\VideoFrameExtractor.exe %DEPLOY_DIR%\

REM Run windeployqt
echo Running windeployqt...
call %QT_DIR%\bin\windeployqt.exe --release --qmldir=%CD%\qml %DEPLOY_DIR%\VideoFrameExtractor.exe

echo.
echo Deployment complete!
echo The application and all required files are in the '%DEPLOY_DIR%' folder.
echo.
echo To run the application, execute: %DEPLOY_DIR%\VideoFrameExtractor.exe
pause
