rem Author: Wk19-hub
FOR F %%G in (DU.txt) Do (
sc %%G config RemoteRegistry start= auto
sc %%G start RemoteRegistry
Delprof2 c%%G u
)
