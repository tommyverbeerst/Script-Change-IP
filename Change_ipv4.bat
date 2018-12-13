@ECHO off
cls
:start
ECHO.
Echo Instellen van IPv4 adres van netwerkkaart Ethernet_2_prog
ECHO 1. Static IP Profinet 172.16.0.0
ECHO 2. Static IP 192.168.0.0
ECHO 3. Static IP Robot service 192.168.125.0
ECHO 4. DHCP
ECHO 5. Exit
set choice=
set /p choice=Selecteer 1 - 5 en druk enter.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto con1
if '%choice%'=='2' goto con2
if '%choice%'=='3' goto con3
if '%choice%'=='4' goto autosearch
if '%choice%'=='5' goto end
ECHO "%choice%" is not valid, try again
ECHO.
goto start

:con1
ECHO Connecting Connection 1
netsh interface ipv4 set address "Ethernet_2_prog" static 172.16.210.141 255.255.0.0 172.16.0.1 
goto end

:con2
ECHO Connecting Connection 2
netsh interface ipv4 set address "Ethernet_2_prog" static 192.168.0.141 255.255.255.0 192.168.0.1 
goto end

:con3
ECHO Connecting Connection 3
netsh interface ipv4 set address "Ethernet_2_prog" static 192.168.125.141 255.255.255.0 192.168.125.1 
goto end

:autosearch
ECHO obtaining auto ip
netsh interface ipv4 set address "Ethernet_2_prog" dhcp 

goto end

:end

echo Ipgegevens worden opgevraagd (duurt 5s) of druk enter
timeout /t 5

:info
netsh interface ipv4 show address "Ethernet_2_prog" 


set choice2=
set /p choice2=Druk enter om te eindigen of selecteer 1 - 5 en druk enter.
if '%choice2%'=='1' goto con1
if '%choice2%'=='2' goto con2
if '%choice2%'=='3' goto con3
if '%choice2%'=='4' goto autosearch
if '%choice2%'=='5' goto end

ECHO.
