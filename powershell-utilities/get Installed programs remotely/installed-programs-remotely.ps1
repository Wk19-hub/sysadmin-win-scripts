# Author: Wk19-hub
# This function will return the logged-on status of a local or remote computer
# Version 1.0
# Sample usage:
# GetRemoteLogonStatus '<remoteComputerName>'

function GetRemoteLogonStatus ($computer = 'localhost') {
    if (Test-Connection $computer -Count 2 -Quiet) {
        try {
            $user = $null
            $user = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $computer | Select-Object -ExpandProperty username -ErrorAction Stop
        }
        catch { "Not logged on"; return }
        try {
            if ((Get-Process logonui -ComputerName $computer -ErrorAction Stop) -and ($user)) {
                "Workstation locked by $user"
            }
        }
        catch { if ($user) { "$user logged on" } }
    }
    else { "$computer Offline" }
}
