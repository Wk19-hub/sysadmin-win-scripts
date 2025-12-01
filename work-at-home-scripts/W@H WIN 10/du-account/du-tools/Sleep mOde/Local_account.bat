rem Author: Wk19-hub


@echo off

cmd /c powercfg /x -hibernate-timeout-ac 0

cmd /c powercfg /x -hibernate-timeout-dc 0

cmd /c powercfg /x -disk-timeout-ac 0

cmd /c powercfg /x -disk-timeout-dc 0

cmd /c powercfg /x -monitor-timeout-ac 0

cmd /c powercfg /x -monitor-timeout-dc 0

cmd /c Powercfg /x -standby-timeout-ac 0

cmd /c powercfg /x -standby-timeout-dc 0

GOTO END

:END

