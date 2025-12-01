# Author: Wk19-hub
Import-Module .\GetConnected.ps1
New-Item -ItemType File -Path .\unmanaged.txt -Force >> $null
New-Item -ItemType File -Path .\inactive.txt -Force >> $null
$allstats = @()
$pw = pwd
function Get-OU($objectPath) {
    $OU = $objectPath.split("/")
    $suffix = "DC=example,DC=company,DC=COM"
    foreach ($item in $OU[-($OU.count - 1)..-1]) {
        $suffix = "OU=$item," + $suffix
    }
    return $suffix
}
$objectPath = Read-Host -Prompt "Give me the OU path"
$out = Get-OU($objectPath)
$computers = Get-ADComputer -Filter * -SearchBase $out | Select-Object -ExpandProperty Name | sort 
foreach ($computer in $computers) {
    $stats = [PSCustomObject]@{
        MachineName = "$computer";
        TPMReady = "$null";
        UEFI = "$null";
        SCCMActive = "$null";
        CoManaged = "$null";
        AzureAD = "$null";
        SecureBoot = "$null"
    }
    $session = Connect-Machine -ComputerName $computer
    if ($session) {
        $stats.TPMReady = (Invoke-Command -Session $session {get-tpm}).TPMReady 2> $null
        $bcdedit = Invoke-Command -Session $session {bcdedit} 2> $null
        if ($bcdedit -match '.*path.*efi') {
            $stats.UEFI = "True"
        }
        else {
            $stats.UEFI = "False"
        }
        if (Test-Path $env:SMS_ADMIN_UI_PATH\..) {
            if (Get-Module -Name ConfigurationManager) {
                if (Get-PSDrive -Name USA 2> $null) {
                    cd usa:\
                }
                else {
                    New-PSDrive -Name "USA" -PSProvider "AdminUI.PS.Provider\CMSite" -Root "ROCJFSSCM01.company.example.com " -Description "Primary Site" >> $null
                    cd USA:\
                }
                cd USA:\
            }
            else {
                cd $env:SMS_ADMIN_UI_PATH\.. 
                Import-Module .\ConfigurationManager.psd1
                New-PSDrive -Name "USA" -PSProvider "AdminUI.PS.Provider\CMSite" -Root "ROCJFSSCM01.company.example.com " -Description "Primary Site" >> $null
                cd USA:\
                cd usa:\
            }
        }
        else {
            Write-Host "The Configuration Manager Console is not installed on this machine" -ForegroundColor Red 
        }
        if ((Get-CMDevice -Name $computer).isactive) {
            $stats.SCCMActive = "True"
            $stats.CoManaged = (Get-CMDevice -Name $computer).comanaged
            if (! $stats.CoManaged) {
                $computer >> "$pw\unmanaged.txt"
            }
        }
        else {
            $stats.SCCMActive = "False"
            $stats.CoManaged = "False"
            $computer >> "$pw\inactive.txt"
        }
        cd $pw
        $dsregcmd = Invoke-Command -Session $session {dsregcmd /status}
        if ($dsregcmd -match '.*AzureAdJoined : YES.*') {
            $stats.AzureAD = "True"
        }
        else {
            $stats.AzureAD = "False"
        }
        $stats.SecureBoot = Invoke-Command -Session $session {Confirm-SecureBootUEFI}
        $allstats += $stats
    }
}
$allstats | Export-Csv -Path .\Report.csv -NoTypeInformation


