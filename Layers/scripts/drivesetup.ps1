Get-Partition -DiskNumber 1 | Set-Partition -NewDriveLetter Y
wmic pagefileset create name="Y:\pagefile.sys"

$size = Get-PartitionSupportedSize -DriveLetter C
Resize-Partition -DriveLetter C -Size $size.SizeMax

Get-Disk | Where-Object PartitionStyle -Eq 'RAW' | Initialize-Disk

New-Partition -DiskNumber 2 -DriveLetter D -UseMaximumSize
New-Partition -DiskNumber 3 -DriveLetter E -UseMaximumSize
New-Partition -DiskNumber 4 -DriveLetter F -UseMaximumSize -ErrorAction SilentlyContinue
New-Partition -DiskNumber 5 -DriveLetter G -UseMaximumSize -ErrorAction SilentlyContinue
New-Partition -DiskNumber 6 -DriveLetter H -UseMaximumSize -ErrorAction SilentlyContinue
New-Partition -DiskNumber 7 -DriveLetter I -UseMaximumSize -ErrorAction SilentlyContinue
New-Partition -DiskNumber 8 -DriveLetter T -UseMaximumSize -ErrorAction SilentlyContinue
New-Partition -DiskNumber 9 -DriveLetter X -UseMaximumSize -ErrorAction SilentlyContinue


Format-Volume -DriveLetter D,E -FileSystem NTFS -Confirm:$false

Format-Volume -DriveLetter F,G,H,I,T,X -FileSystem NTFS -ErrorAction SilentlyContinue -Confirm:$false

#SCCM setup

C:\Windows\Temp\ccmsetup\Client\CCMSetup.exe /noservice /MP:ACE2PSC07310001.itservices.sbc.com SMSSITECODE=N00 SMSSLP=ACE2PSC07310001.itservices.sbc.com