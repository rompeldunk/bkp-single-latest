@echo off

REM Copy single [.ext] file into other destination folder

setlocal
set srcDir="C:\source"
set destdir="C:\bkp"
set ext=bak

set LOGFILE=batch.log
call :LOG >> %LOGFILE%
exit /B

:LOG

echo:
echo:
echo:
echo **********************************
echo:
@echo Started: %date% %time%

set lastmod=
set destfilepath=

pushd %srcDir%
FOR /F "delims=" %%I IN ('DIR "*.*" /A-D /B /O:D') DO SET "lastmod=%%I"

echo:
echo Locate the newest *.%ext% file: "%lastmod%"

if "%lastmod%"=="" (
    echo Could not locate any .%ext% file. Exiting backup...
    goto :exit
)

cd /d %destdir%
for %%A in ("%~f1.\%lastmod%") do set destfilepath="%%~fA"

echo Checking if old backup alredy exist...
echo:

if exist %destfilepath% (
    echo %destfilepath% already exist.
    echo:
    goto :exit
    
) else (
   
    echo Removing all files and folders inside first....
    cd /d %destdir%
    for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

    echo Backup does not exist. Starts copy....
    cd /d %srcDir%
    copy /z "%lastmod%" "%destDir%"
    echo: 
    goto :exit
)

:exit
@echo Completed: %date% %time%



