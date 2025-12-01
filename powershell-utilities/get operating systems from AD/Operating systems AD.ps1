# Author: Wk19-hub
$date = (get-date).AddDays(-90)
$ou='OU=LOCATION,DC=example,DC=company,DC=com'
get-adcomputer -filter {OperatingSystem -notlike "*Windows Server*"}  -searchbase $ou  -properties Lastlogontimestamp,OperatingSystem | 
select name,OperatingSystem |sort name  -descending |export-csv c:\comps.csv
