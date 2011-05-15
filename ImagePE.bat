REM ------------------ HOME ---------------------
SET AIKPATH=C:\Program Files\Windows AIK
SET WPEDIR=C:\Build\CURRENT
REM ------------------ WORK ---------------------
REM SET AIKPATH=C:\Program Files\Windows AIK
REM SET WPEDIR=R:\Work\ImagePE\CURRENT

RD /S %WPEDIR%-x86
RD /S %WPEDIR%-x64

REM Put "REM" before the next line if you're not building in VMWare.
robocopy Z:\Documents\btdeploy C:\Build /MIR

REM -- X86 --

call copype.cmd x86 %WPEDIR%-x86
copy %WPEDIR%-x86\winpe.wim %WPEDIR%-x86\ISO\sources\boot.wim
del %WPEDIR%-x86\iso\boot\bootfix.bin
dism /Mount-WIM /WimFile:"%WPEDIR%-x86\iso\sources\boot.wim" /index:1 /MountDir:"%WPEDIR%-x86\mount"

dism /image:%WPEDIR%-x86\mount /add-driver /driver:"%WPEDIR%-x86\..\bin\drivers" /Recurse

dism /image:%WPEDIR%-x86\mount /Add-Package /PackagePath:"%AIKPATH%\Tools\PETools\x86\WinPE_FPs\WinPE-Scripting.cab"
dism /image:%WPEDIR%-x86\mount /Add-Package /PackagePath:"%AIKPATH%\Tools\PETools\x86\WinPE_FPs\en-us\WinPE-Scripting_en-us.cab"


xcopy "%WPEDIR%\..\bin\system32" "%WPEDIR%-x86\mount\windows\system32" /e /v /i /h /r /y /z
xcopy "%WPEDIR%\..\bin\Program Files" "%WPEDIR%-x86\mount\Program Files" /e /v /i /h /r /y /z

dism /unmount-wim /Mountdir:%WPEDIR%-x86\mount /commit
oscdimg -n -lIMAGE_PE -b%WPEDIR%-x86\etfsboot.com %WPEDIR%-x86\ISO %WPEDIR%-x86\winpe_x86.iso

cd ..
