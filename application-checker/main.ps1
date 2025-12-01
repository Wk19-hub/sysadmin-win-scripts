# Author: Wk19-hub
$computers = Get-Content -Path ./computers.txt
$app = Read-Host -Prompt "Enter the application name" 


foreach ($c in $computers){
    if (Test-Connection -ComputerName $c -Count 1 -Quiet) {
         $data = Invoke-Command -ArgumentList $app -ComputerName $c {Get-Package | 
            Where-Object Name -like "*$($args[0])*"} | Select-Object PSComputerName, Name, Version

         if ($data) {
            if (Test-Path ".\output.csv") {
                Remove-Item ".\output.csv"
                $data | Export-Csv -Path ".\output.csv" -Append -NoTypeInformation
            }
            else {
                $data | Export-Csv -Path ".\output.csv" -Append -NoTypeInformation
            }
         }
                       
    }      
}
