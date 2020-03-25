:: Purpose:       Sub-script that installs Spybot Search and Destroy v2.4
:: Requirements:  1. Administrator access
::		  2. Install file (spybot-2.4.exe) from (https://www.safer-networking.org/mirrors24/)
::                3. Called from tron.bat. If you try to run this script directly it will error out
:: Author:        khaosnmt on reddit.com/r/TronScript ( scooter at fisi.net )
::
:: Version:       1.0.2 + Fix bug in if/else statement
::		  1.0.0 + Initial write
@echo off

:::::::::::::::::::::
:: PREP AND CHECKS ::
:::::::::::::::::::::
set STAGE_8_SCRIPT_VERSION=1.0
set STAGE_8_SCRIPT_DATE=2016-11-29

title Tron v%SCRIPT_VERSION% [stage_8_custom_scripts] [Spybot Search and Destroy]

:: Quick check to see if we inherited the appropriate variables from Tron.bat
if /i "%LOGFILE%"=="" (
	color 0c
	echo.
	echo  ERROR
	echo.
	echo   You cannot run this script directly - it must be
	echo   called from Tron.bat during a Tron run.
	echo.
	echo   Navigate to Tron's root folder and execute Tron.bat
	echo.
	pause
	exit /b 1
)

call functions\log.bat "%CUR_DATE% %TIME%   stage_8_custom_scripts begin..."

:: If Spybot is NOT installed, install it first
if not exist "%ProgramFiles(x86)%\Spybot - Search & Destroy 2\SDWelcome.exe" (
	call functions\log.bat "%CUR_DATE% %TIME%    Spybot installation not detected. Installing now."
	start /wait "stage_8_custom_scripts\spybot-2.4.exe" /SP- /VERYSILENT /SUPRESSMSGBOXES /NORESTART
)

:: Run Spybot Updater and open the Scanner window
call functions\log.bat "%CUR_DATE% %TIME%    Spybot installation detected successfully. Launching updater."
start /wait "%ProgramFiles(x86)%\Spybot - Search & Destroy 2\SDUpdate.exe"

call functions\log.bat "%CUR_DATE% %TIME%    Spybot updater window closed. Launching Scanner."
start /wait "%ProgramFiles(x86)%\Spybot - Search & Destroy 2\SDScan.exe"
call functions\log.bat "%CUR_DATE% %TIME%    Done."
call functions\log.bat "%CUR_DATE% %TIME% !  NOTE: You must manually click SCAN in the Spybot window!"
