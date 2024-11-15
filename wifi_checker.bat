@echo off

set IP_adr=8.8.8.8

:loop

for /f "tokens=2 delims=:" %%i in ('netsh wlan show interfaces ^| findstr "SSID"') do (
    set "SSID=%%i"
)
set "SSID=%SSID:~1%"

echo Connected Network: %SSID%



PING -n 1 %IP_adr%> nul
IF ERRORLEVEL 1 (echo network: %SSID% has lost connection.)

timeout /t 2 >nul
goto loop
