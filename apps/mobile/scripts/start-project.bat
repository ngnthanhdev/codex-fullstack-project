@echo off
setlocal

set TEMPLATE_DIR=%~dp0..
set /p PROJECT_NAME=Project name: 

if "%PROJECT_NAME%"=="" (
  echo Project name is required.
  exit /b 1
)

set TARGET_DIR=%cd%\%PROJECT_NAME%

if exist "%TARGET_DIR%" (
  echo Target already exists: %TARGET_DIR%
  exit /b 1
)

xcopy "%TEMPLATE_DIR%" "%TARGET_DIR%" /E /I /H /Y /EXCLUDE:%TEMPLATE_DIR%\.gitignore >nul
if exist "%TARGET_DIR%\.git" rmdir /S /Q "%TARGET_DIR%\.git"
if exist "%TARGET_DIR%\node_modules" rmdir /S /Q "%TARGET_DIR%\node_modules"
if exist "%TARGET_DIR%\.expo" rmdir /S /Q "%TARGET_DIR%\.expo"

pushd "%TARGET_DIR%"
git init
git branch -M main
popd

echo Project created: %TARGET_DIR%
echo Open this folder in Codex IDE and ask Codex to read AGENTS.md.
