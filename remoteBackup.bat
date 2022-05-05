REM Copy the most recent database backups from their folders 
@echo off

REM Copy File in one destination to another --------------------------------------------

setlocal
set srcDir="C:\source"
set destdir="C:\bkp"

set lastmod=
set destfilepath=
set ext=bak

pushd %srcDir%
FOR /F "delims=" %%I IN ('DIR "*.*" /A-D /B /O:D') DO SET "lastmod=%%I"
echo Locate the most recently changed *.%ext% file: %lastmod%

if "%lastmod%"=="" (
    echo Could not locate any .%ext% file. Exiting backup...
    goto :eof
)

echo Set backup dest filepath...
cd /d %destdir%
for %%A in ("%~f1.\%lastmod%") do set destfilepath="%%~fA"

echo Checking if old backup alredy exist...
if exist %destfilepath% (
    echo %destfilepath% already exist.
    goto :eof
    
) else (
   
    echo Removing all files and folders inside first....
    cd /d %destdir%
    for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

    echo Backup does not exist. Starts copy....
    cd /d %srcDir%
    copy /z "%lastmod%" "%destDir%"

)
