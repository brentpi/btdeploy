REM ------------------ HOME ---------------------
SET AIKPATH=D:\Program Files\Windows AIK
SET WPEDIR=R:\Work\ImagePE\CURRENT
REM ------------------ WORK ---------------------
REM SET AIKPATH=C:\Program Files\Windows AIK
REM SET WPEDIR=R:\Work\ImagePE\CURRENT

RD /S %WPEDIR%-x86
RD /S %WPEDIR%-x64

REM -- X86 --

call copype.cmd x86 %WPEDIR%-x86
copy %WPEDIR%-x86\winpe.wim %WPEDIR%-x86\ISO\sources\boot.wim
del %WPEDIR%-x86\iso\boot\bootfix.bin
dism /Mount-WIM /WimFile:"%WPEDIR%-x86\iso\sources\boot.wim" /index:1 /MountDir:"%WPEDIR%-x86\mount"

dism /image:%WPEDIR%-x86\mount /add-driver /driver:"R:\Work\ImagePE\drivers\intel\sata\iaahci.inf"
dism /image:%WPEDIR%-x86\mount /add-driver /driver:"R:\Work\ImagePE\Drivers\VBoxGuest\VBoxGuest.inf"
dism /image:%WPEDIR%-x86\mount /add-driver /driver:"R:\Work\ImagePE\Drivers\VBoxMouse\VBoxMouse.inf"
dism /image:%WPEDIR%-x86\mount /add-driver /driver:"R:\Work\ImagePE\Drivers\VBoxVideo\VBoxVideo.inf"
dism /image:%WPEDIR%-x86\mount /add-driver /driver:"R:\Work\ImagePE\Drivers\NetKVM\Vista\x86\netkvm.inf"

dism /image:%WPEDIR%-x86\mount /Add-Package /PackagePath:"%AIKPATH%\Tools\PETools\x86\WinPE_FPs\WinPE-Scripting.cab"
dism /image:%WPEDIR%-x86\mount /Add-Package /PackagePath:"%AIKPATH%\Tools\PETools\x86\WinPE_FPs\en-us\WinPE-Scripting_en-us.cab"


xcopy "%WPEDIR%\..\system32" "%WPEDIR%-x86\mount\windows\system32" /e /v /i /h /r /y /z
xcopy "%WPEDIR%\..\Program Files" "%WPEDIR%-x86\mount\Program Files" /e /v /i /h /r /y /z

dism /unmount-wim /Mountdir:%WPEDIR%-x86\mount /commit
oscdimg -n -lIMAGE_PE -b%WPEDIR%-x86\etfsboot.com %WPEDIR%-x86\ISO %WPEDIR%-x86\winpe_x86.iso

REM -- X64 --

call copype.cmd amd64 %WPEDIR%-x64
copy %WPEDIR%-x64\winpe.wim %WPEDIR%-x64\ISO\sources\boot.wim
del %WPEDIR%-x64\iso\boot\bootfix.bin
dism /Mount-WIM /WimFile:"%WPEDIR%-x64\iso\sources\boot.wim" /index:1 /MountDir:"%WPEDIR%-x64\mount"

dism /image:%WPEDIR%-x64\mount /add-driver /driver:"R:\Work\ImagePE\drivers\intel\sata\iaahci.inf"
dism /image:%WPEDIR%-x86\mount /add-driver /driver:"R:\Work\ImagePE\Drivers\NetKVM\Vista\amd64\netkvm.inf"

xcopy "%WPEDIR%\..\system32" "%WPEDIR%-x64\mount\windows\system32" /e /v /i /h /r /y /z
xcopy "%WPEDIR%\..\Program Files" "%WPEDIR%-x64\mount\Program Files" /e /v /i /h /r /y /z

dism /unmount-wim /Mountdir:%WPEDIR%-x64\mount /commit
oscdimg -n -lIMAGE_PE -b%WPEDIR%-x64\etfsboot.com %WPEDIR%-x64\ISO %WPEDIR%-x64\winpe_x64.iso
cd ..