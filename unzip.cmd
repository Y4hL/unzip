@echo off
title Y4hL/unzip

set file_dir=%~dp0

:: Turns on powershell scripts for current user ::
powershell.exe Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;

IF [%1] == [] goto :ask
IF [%2] == [] goto :ask

set zip=%1
set dest=%2

goto :zip
:ask

set /p zip=Path to Zip: 
set /p dest= Path to Destination: 

:: Creates Temporary Directory ::
md tmp >nul

:: Writes code into tmp\unzipper.ps1 ::
echo expand-archive -path '%zip%' -destinationpath '%dest%' > %file_dir%\tmp\unzipper.ps1

:: Runs Unzipper ::
powershell.exe -File %file_dir%\tmp\unzipper.ps1

:: Deletes Temporary Files ::
del /F /Q %file_dir%\tmp\unzipper.ps1
rd /s /q tmp
