rem Author: Wk19-hub
rem ADB-Logcat-Filter.bat
rem Filter Android Debug Bridge logcat for SCEP/certificate related entries

@echo off
echo Filtering ADB logcat for SCEP/certificate entries...
echo Note: This requires ADB (Android Debug Bridge) to be installed and device connected

adb logcat -v time | findstr /i "scep cert intune KeyChain keystore2"

pause