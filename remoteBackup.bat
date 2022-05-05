@echo off

REM Copy single [.ext] file into other destination folder

set LOGFILE=backup.log
call :LOG >> %LOGFILE%
exit /B

:LOG

setlocal
set srcDir="C:\source"
set destdir="C:\bkp"
set ext=mbsb

echo:
echo:
echo:
echo **********************************
echo:
@echo Started: %date% %time%

set lastmod=
set destfilepath=
set srcfilepath=

pushd %srcDir%
FOR /F "delims=" %%I IN ('DIR "*.%ext%" /A-D /B /O:D') DO SET "lastmod=%%I"

echo:
echo Locate the newest *.%ext% file: "%lastmod%"

if "%lastmod%"=="" (
    echo Could not locate any .%ext% file. Exiting backup...
    goto :exit
)

pushd %destdir%
for %%A in ("%~f1.\%lastmod%") do set destfilepath="%%~fA"

pushd %srcDir%
for %%A in ("%~f1.\%lastmod%") do set srcfilepath="%%~fA"

echo Checking if old backup alredy exist...
echo:

if exist %destfilepath% (
    echo %destfilepath% already exist.
    echo:
    goto :exit
    
) else (
   
    pushd %destdir%
    @REM echo Removing all files and folders inside first....
    @REM for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)
    echo Removing old .%ext% files first...
    for /F "delims=" %%i in ('dir /b') do (del "%%i" /s/q)

    echo Starts copy....
    pushd %srcDir%

    copy /z "%lastmod%" %destDir%
    echo: 
    goto :exit
)

:exit
@echo Completed: %date% %time%



