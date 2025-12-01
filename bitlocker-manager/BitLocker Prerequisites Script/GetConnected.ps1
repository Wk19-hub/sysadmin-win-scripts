# Author: Wk19-hub
function Connect-Machine {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [string] $ComputerName = "localhost"
    )
    process {
        if (Test-Connection -ComputerName $ComputerName -Quiet -Count 1) {
            if (Test-WSMan -ComputerName $ComputerName 2> $null) {
                $ops = New-PSSessionOption -OperationTimeout 1000
                $PSSession = New-PSSession -ComputerName $ComputerName -SessionOption $ops 2> $null
                if ($PSSession) {
                    Write-Host "Connected to $ComputerName successfully." -ForegroundColor DarkGreen
                    return $PSSession
                }
                else {
                    Write-Host "Can't access [$ComputerName] machine, Please check your permissions" -ForegroundColor DarkRed
                }
            }
            else {
                sc.exe \\$ComputerName start winrm >> $null 2> $null 
                if ($LASTEXITCODE -eq 0) {
                    sc.exe \\$ComputerName config winrm start=auto >> $null 2> $null 
                    $ops = New-PSSessionOption -OperationTimeout 1000
                    $PSSession = New-PSSession -ComputerName $ComputerName -SessionOption $ops 2> $null
                    if ($PSSession) {
                        Write-Host "Connected to $ComputerName successfully." -ForegroundColor DarkGreen
                        return $PSSession
                    }
                    else {
                        Write-Host "Can't access [$ComputerName] machine, Please check your permissions" -ForegroundColor DarkRed
                    } 
                }
                else {
                    Write-Host "Can't access [$ComputerName] machine, Please check your permissions" -ForegroundColor DarkRed
                }
            }
        }
        else {
            Write-Host "Can't access [$ComputerName] machine, because it's Offline" -ForegroundColor Red
        }
    }
}



