@echo off
title Y4hL/unzip

:: Gets Files Path ::
set file_dir=%~dp0

:: Creates random number for folder name ::
set add_dir=%random%

:: Turns on powershell scripts for current user ::
powershell.exe Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;

:: Checks whether or not arguments were given ::
IF [%1] == [] (
	echo Format:
	echo.
	echo path\unzip.cmd zip_file_path destination
	echo.
	timeout /t 10
	goto :eof
)

IF [%2] == [] (
	echo Format:
	echo.
	echo path\unzip.cmd zip_file_path destination
	echo.
	timeout /t 10
	goto :eof
)

:: Gets given arguments ::
set zip=%1
set dest=%2

if not exist "%dest%" md "%dest%"

:: Creates Temporary Directory ::
md %file_dir%\%add_dir% >nul

:: Writes code into %add_dir%\unzipper.ps1 ::
echo expand-archive -path '%zip%' -destinationpath '%dest%' -Force > %file_dir%\%add_dir%\unzipper.ps1

:: Runs Unzipper ::
powershell.exe -File %file_dir%\%add_dir%\unzipper.ps1

:: Deletes Temporary Files ::
del /F /Q %file_dir%\%add_dir%\unzipper.ps1

rd /s /q %file_dir%\%add_dir%

:: End of File ::
:eof
