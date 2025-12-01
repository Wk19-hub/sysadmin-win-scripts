rem Author: Wk19-hub
wmic /node:@computerlist.txt  computersystem get model,name,manufacturer,systemtype,UserName /format:htable>ServerSerialNumbers.htm
start "" ServerSerialNumbers.htm
