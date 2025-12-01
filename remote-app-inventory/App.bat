rem Author: Wk19-hub
wmic /node:%1 product get name, version, vendor /format:htable>app.htm

