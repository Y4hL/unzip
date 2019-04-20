@echo off
title Y4hL/unzip

:: Creates random number for folder name ::
set unzip_add_dir=%random%

:: Turns on powershell scripts for current user ::
powershell.exe Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force;

:: Checks whether or not arguments were given ::
IF [%~1] == [] (
	echo Format:
	echo.
	echo "path\unzip.cmd" "zip_file_path" "destination"
	echo.
	timeout /t 10
	goto :eof
)

IF [%~2] == [] (
	echo Format:
	echo.
	echo "path\unzip.cmd" "zip_file_path" "destination"
	echo.
	timeout /t 10
	goto :eof
)

:: Gets given arguments ::
set unzip_zip=%~1
set unzip_dest=%~2

:: Removing Single and Double Quotes from unzip_zip parameter ::
set unzip_zip=%unzip_zip:'=%
set unzip_zip=%unzip_zip:"=%

:: Removing Single and Double Quotes from unzip_dest parameter ::
set unzip_dest=%unzip_dest:'=%
set unzip_dest=%unzip_dest:"=%

if not exist "%unzip_dest%" md "%unzip_dest%"

:: Creates Temporary Directory ::
md "%~dp0\%unzip_add_dir%" >nul

:: Writes code into %add_dir%\unzipper.ps1 ::
echo expand-archive -path '%unzip_zip%' -destinationpath '%unzip_dest%' -Force > "%~dp0\%unzip_add_dir%\unzipper.ps1"

:: Runs Unzipper ::
powershell.exe -File "%~dp0\%unzip_add_dir%\unzipper.ps1" >nul

:: Deletes Temporary Files ::
del /F /Q "%~dp0\%unzip_add_dir%\unzipper.ps1" >nul

rd /s /q "%~dp0\%unzip_add_dir%" >nul

:: End of File ::
:eof
