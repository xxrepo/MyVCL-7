@echo off
if '%1' EQU '' goto error
set DESTPATHLOC="%CD%"
if '%2' NEQ '' set DESTPATHLOC=%2
if NOT exist %DESTPATHLOC% md %DESTPATHLOC% >nul
if exist *_*.js del /Q/F *_*.js >nul
if exist %DESTPATHLOC%\*_*.js del /Q/F %DESTPATHLOC%\*_*.js >nul
for %%f in (*.js) do rename %%f %%~nf_%1.js >nul
if "%CD%" NEQ %DESTPATHLOC% xcopy /Q/Y *.js %DESTPATHLOC% >nul
@echo *** COMPLETED *** 
goto end

:error
@echo *** INCORRECT VERSION ***

:end
set DESTPATHLOC=
