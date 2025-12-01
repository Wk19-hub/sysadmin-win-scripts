rem Author: Wk19-hub
@Echo off
Title FIRST ASSET clean up Bash 
Echo ===================================================
Echo *     FIRST ASSET Temp Files Cleanup              *

Echo -------Starting the clean up please wait...-------
echo.

taskkill /F /IM iexplore.exe
taskkill /F /IM FA.exe
taskkill /F /IM Firefox.exe
taskkill /F /IM MicrosoftEdge.exe
taskkill /F /IM Chrome.exe
taskkill /F /IM javaw.exe
taskkill /F /IM EXTRA.exe
taskkill /F /IM geckodriver.exe
Del /S /F /Q %temp%
Del /S /F /Q %Windir%\Temp
del /q/f/s %TEMP%\*
del /s /q C:\Users\\%username%\AppData\Local\Microsoft\Windows\History\low\* /ah
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2

set IEResult=%ERRORLEVEL%
echo.

cd %temp%
del %temp%\*.* /f /s /q 
for /D %%f in (%temp%\*) do rmdir "%%f" /s /q

del c:\windows\temp\*.* /f /s /q
for /D %%f in (c:\windows\temp\*) do rmdir "%%f" /s /q

del C:\Windows\Prefetch\*.* /f /s /q
for /D %%f in (C:\Windows\Prefetch\*) do rmdir "%%f" /s /q

RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2


:: Execute Killing IE processes
if "%IEResult%"=="0" (

	taskkill /f /im iexplore.exe >> log.txt
	echo IE process killed. >> log.txt
	echo IE process killed.

) else (
		echo IE is not running. >> log.txt
        echo IE is not running.
)

echo.



:: Execute Deleting of History form AppData.

echo Checking if "C:\Users\\%username%\AppData\Local\Microsoft\Windows\History\low\* /ah" folder is exist or not.... >> log.txt
IF EXIST "C:\Users\\%username%\AppData\Local\Microsoft\Windows\History\low\* /ah" (
echo Deleting WinHistory file. >> log.txt
Del /s /q C:\Users\\%username%\AppData\Local\Microsoft\Windows\History\low\* /ah >>log.txt
FOR /D %%i IN (C:\Users\\%username%\AppData\Local\Microsoft\Windows\History\low\* /ah ) DO RD /S /Q "%%i"
set WinHistoryresult=%ERRORLEVEL%



IF %ERRORLEVEL% EQU 0 ( 
	echo WinHistory file is deleted sucesfully. >> log.txt 
	echo WinHistory file is deleted sucesfully.
	)
IF %ERRORLEVEL% EQU 1	(
		echo Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe. >> log.txt 
		echo Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe.
	)
	
IF %ERRORLEVEL% EQU 2	(
		echo System cannot find the file in that specified location. >> log.txt 
		echo System cannot find the file in that specified location.
	)
IF %ERRORLEVEL% EQU 3	(
		echo System cannot find the specified path.>> log.txt 
		echo System cannot find the specified path.
	)
	
) 
) ELSE (
echo C:\Users\\%username%\AppData\Local\Microsoft\Windows\History\low\* /ah:- already deleted. >> log.txt 
echo WinHistory file is deleted sucesfully.
set WinHistoryresult=0
)
echo.



:: Execute ClearMyTracksByProcess 255
echo Cheking ClearMyTracksByProcess 255 is exist or not....>> log.txt
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255.>>log.txt

set ClearMyTracksByProc255result=%ERRORLEVEL%
if "%ClearMyTracksByProc255result%"=="0" ( 
	echo ClearMyTracksByProcess 255 exceuted. >> log.txt 
	echo ClearMyTracksByProcess 255 exceuted.
) else ( 
		echo ClearMyTracksByProcess 255 failed.  >> log.txt 
		echo  ClearMyTracksByProcess 255 failed.
	)
echo.


:: Execute ClearMyTracksByProcess 9
echo Cheking ClearMyTracksByProcess 9 is exist or not.... >> log.txt
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 9.>>log.txt
set ClearMyTracksByProcessresult=%ERRORLEVEL%

if "%ClearMyTracksByProcessresult%"=="0" ( 
	echo ClearMyTracksByProcess 9 exceuted. >> log.txt 
	echo ClearMyTracksByProcess 9 exceuted.
) else ( 
		echo ClearMyTracksByProcess 9  failed.  >> log.txt 
		echo  ClearMyTracksByProcess 9 failed.
	)
echo.


:: Execute Deleting BIN folder fo First-ASSET from ProgramData
echo Checking if "C:\ProgramData\FIRSTASSET\BIN" folder is exist or not.... >> log.txt
IF EXIST "C:\ProgramData\FIRSTASSET\BIN" (
echo Deleting BIN folder form First-ASSET. >> log.txt
rmdir /s /q C:\ProgramData\FIRSTASSET\BIN\ >>log.txt
FOR /D %%i IN (C:\ProgramData\FIRSTASSET\BIN\*) DO RD /S /Q "%
FOR /D %%i IN (C:\ProgramData\FIRSTASSET\Profile\*) DO RD /S /Q "%%i"
set DelBINresult=%ERRORLEVEL%

IF %ERRORLEVEL% EQU 0 ( 
	echo BIN folder from First-ASSET is deleted sucesfully. >> log.txt 
	echo BIN folder from First-ASSET is deleted sucesfully.
IF %ERRORLEVEL% EQU 1	(
		echo Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe. >> log.txt 
		echo Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe.
	)
	
IF %ERRORLEVEL% EQU 2	(
		echo System cannot find the file in that specified location. >> log.txt 
		echo System cannot find the file in that specified location.
	)
IF %ERRORLEVEL% EQU 3	(
		echo System cannot find the specified path. >> log.txt 
		echo System cannot find the specified path.
	)
	
) 
) ELSE (
echo C:\ProgramData\FIRSTASSET\BIN this folder is already deleted. >> log.txt 
 echo BIN folder form First-ASSET is already deleted.
)
echo.



:: Execute Deleting Asset folder form Documents folder
echo Checking if "C:\Documents\ASSET\" folder is exist or not.... >> log.txt
IF EXIST "%userprofile%\Documents\ASSET\*" (
echo Deleting ASSET folder form Documents. >> log.txt
FOR /D %%i IN (%userprofile%\Documents\ASSET\*) DO RD /S /Q "%%i"
DEL /Q %userprofile%\Documents\ASSET\*.* 
set DelAssetResult=%ERRORLEVEL%

IF %ERRORLEVEL% EQU 0 ( 
echo Asset folder form Documents is deleted sucesfully. >> log.txt 
	echo Asset folder form Documents is deleted sucesfully.
IF %ERRORLEVEL% EQU 1	(
		echo Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe. >> log.txt 
		echo Incorrect function. Indicates that Action has attempted to execute non-recognized command in Windows command prompt cmd.exe.
	)
	
IF %ERRORLEVEL% EQU 2	(
		echo System cannot find the file in that specified location. >> log.txt 
		echo System cannot find the file in that specified location.
	)
IF %ERRORLEVEL% EQU 3	(
		echo System cannot find the specified path. >> log.txt 
		echo System cannot find the specified path.
	)
	
) 
) ELSE (
echo C:\Documents\ASSET\ this folder is already deleted. >> log.txt 
 echo ASSET folder form Documents is already deleted.
)
	
)
echo.


:: Execute ipconfig /flushdns
echo Executing  ipconfig /flushdns >> log.txt
ipconfig /flushdns
ipconfig /renew
set flushdnsresult=%ERRORLEVEL%

if "%flushdnsresult%"=="0" ( 
	echo ipconfig flush has been done sucesfully.>> log.txt
	echo ipconfig flush has been done sucesfully.
) else ( 
		echo ipconfig flush failed.  >> log.txt 
		echo  ipconfig flush failed.
	)
echo.


::Execute Display Status of the all commands 
echo Status of all the Commands execution is :-
if "%IEResult%"=="0" (
echo IE Process                      SUCCESS   
echo.
GOTO :endIE   
)
echo.
) else (
	echo IE Process                  Process Not Running
echo.
)  
:endIE

if "%WinHistoryresult%"=="0" (
echo WinHistory                      SUCCESS   
echo.
) else (
echo WinHistory                      FAILED
echo.
)

if "%ClearMyTracksByProc255result%"=="0" (
echo ClearMyTracksByProc255          SUCCESS   
echo.
) else (
echo ClearMyTracksByProc255          FAILED
echo.
)

if "%ClearMyTracksByProcessresult%"=="0" (
echo ClearMyTracksByProc9            SUCCESS   
echo.
) else (
echo ClearMyTracksByProc9            FAILED
echo.
)

if "%DelBINresult%"=="0" (
echo FA_Bin_Del                      SUCCESS   
echo.
) else (
echo FA_Bin_Del                      FAILED
echo.
)


if "%DelAssetResult%"=="0" (
echo Doc_Asset_Del                   SUCCESS   
echo.
) else (
echo Doc_Asset_Del                   FAILED
echo.
)


if "%flushdnsresult%"=="0" (
echo FlushDNS                        SUCCESS   
echo.
) else (
echo FlushDNS                        FAILED
echo.
)
  echo.
 
 
 
:: Execute Restart Command
echo Executing Restart Command. >> log.txt
setlocal
:PROMPT

:: Execute cleanmgr /VERYLOWDISK
echo Executing cleanmgr /VERYLOWDISK >> log.txt
cleanmgr /sagerun:11


timeout 5
exit /b






