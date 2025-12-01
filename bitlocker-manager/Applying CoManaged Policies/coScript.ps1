# Author: Wk19-hub
$computers = Get-Content -Path ".\computers.txt"

$comanaged = @()
$unmanaged = @()
$pw = pwd
if (get-module -name configurationmanager) {
    cd usa:\ > $null
}
else {
    cd $env:SMS_ADMIN_UI_PATH\..
    Import-Module .\ConfigurationManager.psd1
    cd usa:\ > $null
}


foreach ($computer in $computers) {
    Write-Host "Starting $computer" -ForegroundColor Green
    if ((get-cmdevice -name $computer).isactive) {
        $resourceID = get-cmdevice -Name $computer | select-object -expandproperty resourceid
        Add-CMDeviceCollectionDirectMembershipRule -resourceid $resourceID -CollectionName CoManaged_Devices
        $comanaged += $computer
        }
    else {
        $unmanaged += $computer
        }
}

cd $pw
$comanaged >> ".\comanaged.txt"
$unmanaged >> ".\unmanaged.txt"
