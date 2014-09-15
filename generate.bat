@echo off
setlocal enableextensions enabledelayedexpansion
perl randomRes.pl
start rungenerate

:checkFileSize
set file="res-poetryOutput.txt"
set maxbytesize=1024

FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

if %size% LSS %maxbytesize% (
	goto checkFileSize
) ELSE (
	echo.Killing rungenerate.bat Task.....
	taskkill /F /FI "WindowTitle eq PoetryGenExe*" /T
	echo.Done Killing
)