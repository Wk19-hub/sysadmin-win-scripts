rem Author: Wk19-hub

For /F "delims=" %%G in (restart.txt) Do shutdown -m \\%%G -r -f
