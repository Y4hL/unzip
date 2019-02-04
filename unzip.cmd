@echo off
title Y4hL/unzip

set file_dir=%~dp0

:: Turns on powershell scripts for current user ::
powershell.exe Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;

IF [%1] == [] (
	echo Format:
	echo.
	echo path\unzip.cmd zip_file_path destination
	echo.
	echo Press any button to continue
	pause >nul
	goto :eof
)

IF [%2] == [] (
	echo Format:
	echo.
	echo path\unzip.cmd zip_file_path destination
	echo.
	echo Press any button to continue
	pause >nul
	goto :eof
)

set zip=%1
set dest=%2

if not exist "%dest%" md "%dest%"

:: Creates Temporary Directory ::
md %file_dir%\tmp >nul

:: Writes code into tmp\unzipper.ps1 ::
echo expand-archive -path '%zip%' -destinationpath '%dest%' -Force > %file_dir%\tmp\unzipper.ps1

:: Runs Unzipper ::
powershell.exe -File %file_dir%\tmp\unzipper.ps1

:: Deletes Temporary Files ::
del /F /Q %file_dir%\tmp\unzipper.ps1

rd /s /q %file_dir%\tmp

:eof
