gwmi win32_pagefilesetting
$pf=gwmi win32_pagefilesetting
$pf.Delete()

#Remove CD and Floppy
reg add HKLM\System\CurrentControlSet\Services\cdrom /t REG_DWORD /v "Start" /d 4 /f
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\flpydisk /t REG_DWORD /v "Start" /d 4 /f

Restart-Computer