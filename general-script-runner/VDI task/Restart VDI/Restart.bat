rem Author: Wk19-hub

For /F "delims=" %%G in (Restart.txt) Do shutdown -m \\%%G -r -f
