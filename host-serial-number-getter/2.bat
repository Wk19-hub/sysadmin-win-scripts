rem Author: Wk19-hub
wmic /node:@computerlist.txt bios get SerialNumber /format:htable>ServerSerialNumbers.htm
start "" ServerSerialNumbers.htm
