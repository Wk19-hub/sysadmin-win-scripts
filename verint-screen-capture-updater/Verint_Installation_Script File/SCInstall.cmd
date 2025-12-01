
cmd /c msiexec.exe /X {4257CA95-6507-4647-8ADB-156865A6E3AB} /quiet /norestart
cmd /c msiexec.exe /X {BF67250A-330C-4589-A4A2-F68481909D0C} /quiet /norestart
cmd /c msiexec.exe /X {2561D83E-86A8-4007-A103-683A290B6C68} /quiet /norestart
cmd /c msiexec.exe /X {3FF6EDA4-D9DF-4DD4-8E0C-3AE33B8B5892} /quiet /norestart
cmd /c msiexec.exe /X {7C2C3F09-8827-4876-B6D0-247E0596F776} /quiet /norestart
cmd /c msiexec.exe /X {7E579EA1-060D-4286-A22A-9C8D507AA967} /quiet /norestart
cmd /c msiexec.exe /X {C92C14EC-62A8-43FB-8FCA-B8619803587D} /quiet /norestart
cmd /c msiexec.exe /X {E473C64C-48DF-4205-AE89-1093ABF80BEE} /quiet /norestart
cmd /c msiexec.exe /X {E58D792A-B6E8-45A0-9F91-726DDD4E8EA1} /quiet /norestart
cmd /c msiexec.exe /X {F894CFF6-1501-43C1-8C51-69E769C4CD21} /quiet /norestart
cmd /c MsiExec.exe /X {8633CDF2-03D2-4262-94F1-BEA4190B6B85} /quiet /norestart

cmd /c rmdir /s /q "C:\CaptureService"
cmd /c reg delete HKLM\SOFTWARE\Wow6432Node\Witness /f
cmd /c reg delete "HKLM\SOFTWARE\Wow6432Node\Witness Systems" /f
cmd /c reg delete HKLM\SOFTWARE\Witness /f
cmd /c reg delete "HKLM\SOFTWARE\Witness Systems" /f

cmd /c msiexec -i "C:\Installs\Verint.msi" /quiet /qn USE_COMMAND_LINE=1 AGENT_MONITORING_ENABLED=FALSE SENDFQDN=1 ASC=0 CONN_INTG_SVC=TRUE  INTG_SERVERS=server1.example.com:29522,server2.example.com:29522 CONN_INTG_CLD=TRUE INTG_CLOUD=server1.example.com:29435,server2.example.com:29435 CONN_SEC_INTG_CLD=TRUE  SEC_INTG_CLOUD=server1.example.com:29436,server2.example.com:29436 /L*v c:\ScreenCapture.txt

exit