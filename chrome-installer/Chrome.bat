rem Author: Wk19-hub
CD /d "C:\Program Files (x86)\Google\Chrome\Application"
for /r %%f IN (setup.ex?) DO  (
   "%%f" --uninstall --force-uninstall --multi-install --chrome --system-level
)
