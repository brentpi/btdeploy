#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <NamedPipes.au3>

Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=r:\work\koda\forms\ayrshsdeploy.kxf
$Form1_2 = GUICreate("AyrSHS WinPE Environment", 615, 438)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Label1 = GUICtrlCreateLabel("AyrSHS WinPE Environment", 128, 16, 383, 37)
GUICtrlSetFont(-1, 20, 800, 0, "Tahoma")
$Tab1 = GUICtrlCreateTab(16, 64, 585, 353)
$TabSheet1 = GUICtrlCreateTabItem("Computers For Students")
$grpCFSWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 121)
$btnImgCFSWin7 = GUICtrlCreateButton("Image Machine", 48, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFSWin7Click")
$btnImgCFSPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 176, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFSPWin7Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpSettingsCFS = GUICtrlCreateGroup("Settings", 232, 104, 177, 257)
$Label9 = GUICtrlCreateLabel("Session Name:", 248, 128, 75, 17)
$txtCFSGhostSessionName = GUICtrlCreateInput("", 248, 152, 145, 21)
GUICtrlSetOnEvent(-1, "txtCFSGhostSessionNameChange")
$Label10 = GUICtrlCreateLabel("OR", 304, 224, 32, 28)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$btnCFSSelectGhostImage = GUICtrlCreateButton("Select Ghost Image", 248, 304, 145, 33)
GUICtrlSetOnEvent(-1, "btnCFSSelectGhostImageClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpCFSWinXP = GUICtrlCreateGroup("Windows XP", 32, 240, 177, 121)
$btnImgCFSWinXP = GUICtrlCreateButton("Image Machine", 48, 264, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFSWinXPClick")
$btnImgCFSPWinXP = GUICtrlCreateButton("Image Machine -Preserve", 48, 312, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFSPWinXPClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet2 = GUICtrlCreateTabItem("Computers for Teachers")
$grpCFTWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 121)
$btnImgCFTWin7 = GUICtrlCreateButton("Image Machine", 48, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFTWin7Click")
$btnImgCFTPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 176, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFTPWin7Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Settings", 232, 104, 177, 257)
$Label7 = GUICtrlCreateLabel("Session Name:", 248, 128, 75, 17)
$txtCFTGhostSessionName = GUICtrlCreateInput("", 248, 152, 145, 21)
GUICtrlSetOnEvent(-1, "txtCFTGhostSessionNameChange")
$Label8 = GUICtrlCreateLabel("OR", 304, 224, 32, 28)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$btnCFTSelectGhostImage = GUICtrlCreateButton("Select Ghost Image", 248, 304, 145, 33)
GUICtrlSetOnEvent(-1, "btnCFTSelectGhostImageClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpCFTWinXP = GUICtrlCreateGroup("Windows XP", 32, 240, 177, 121)
$btnImgCFTWinXP = GUICtrlCreateButton("Image Machine", 48, 264, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFTWinXPClick")
$btnImgCFTPWinXP = GUICtrlCreateButton("Image Machine -Preserve", 48, 312, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFTPWinXPClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet3 = GUICtrlCreateTabItem("Desktop Machines")
$grpDeskWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 121)
$btnImgDWin7 = GUICtrlCreateButton("Image Machine", 48, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgDWin7Click")
$btnImgDPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 176, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgDPWin7Click")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpDesktopWinXP = GUICtrlCreateGroup("Windows XP", 32, 240, 177, 121)
$btnImgDWinXP = GUICtrlCreateButton("Image Machine", 48, 264, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgDWinXPClick")
$btnImgDPWinXP = GUICtrlCreateButton("Image Machine -Preserve", 48, 312, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgDPWinXPClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpDesktopSettings = GUICtrlCreateGroup("Settings", 232, 104, 177, 257)
$Label5 = GUICtrlCreateLabel("Session Name:", 248, 128, 75, 17)
$txtDesktopSession = GUICtrlCreateInput("", 248, 152, 145, 21)
GUICtrlSetOnEvent(-1, "txtDesktopSessionChange")
$Label6 = GUICtrlCreateLabel("OR", 304, 224, 32, 28)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$btnDesktopGhostSelectImage = GUICtrlCreateButton("Select Ghost Image", 248, 304, 145, 33)
GUICtrlSetOnEvent(-1, "btnDesktopGhostSelectImageClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet4 = GUICtrlCreateTabItem("Other")
GUICtrlSetState(-1,$GUI_SHOW)
$Ghost = GUICtrlCreateGroup("Ghost", 32, 104, 177, 73)
$btnRunGhost = GUICtrlCreateButton("Run Ghost32", 48, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnRunGhostClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpBCD = GUICtrlCreateGroup("BCD", 32, 192, 177, 129)
$btnBCDFix = GUICtrlCreateButton("Fix BCD", 48, 272, 145, 33)
GUICtrlSetOnEvent(-1, "btnBCDFixClick")
$txtBCDDrive = GUICtrlCreateInput("C", 48, 240, 145, 21)
GUICtrlSetOnEvent(-1, "txtBCDDriveChange")
$Label2 = GUICtrlCreateLabel("Drive to fix (ex.colon):", 48, 216, 106, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpRunCMD = GUICtrlCreateGroup("Command Line", 224, 104, 177, 73)
$btnRunCmd = GUICtrlCreateButton("Run Command Line", 240, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnRunCmdClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpFixGrub = GUICtrlCreateGroup("Grub4Dos", 224, 192, 177, 129)
$btnFixGrub4Dos = GUICtrlCreateButton("Fix Grub4Dos Boot Sector", 240, 272, 145, 33)
GUICtrlSetOnEvent(-1, "btnFixGrub4DosClick")
$Label3 = GUICtrlCreateLabel("Fetch Grub4DOS Boot Sector", 240, 216, 145, 17)
$Label4 = GUICtrlCreateLabel("and write to the MBR.", 240, 232, 107, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpGDisk = GUICtrlCreateGroup("GDisk", 416, 104, 169, 273)
$btnDiskWipe1 = GUICtrlCreateButton("Wipe Disk 1", 432, 128, 137, 33)
GUICtrlSetOnEvent(-1, "btnDiskWipe1Click")
$btnUnhideAll = GUICtrlCreateButton("Unhide All", 432, 168, 137, 33)
GUICtrlSetOnEvent(-1, "btnUnhideAllClick")
$btnPartitionCFS = GUICtrlCreateButton("Partition CFS", 432, 208, 137, 33)
GUICtrlSetOnEvent(-1, "btnPartitionCFSClick")
$btnPartitionCFT = GUICtrlCreateButton("Partition CFT", 432, 248, 137, 33)
GUICtrlSetOnEvent(-1, "btnPartitionCFTClick")
$btnPartitionDesktop = GUICtrlCreateButton("Partition Desktop", 432, 288, 137, 33)
GUICtrlSetOnEvent(-1, "btnPartitionDesktopClick")
$btnWipeDiskDOD = GUICtrlCreateButton("Wipe Disk 1 - DOD", 432, 328, 137, 33)
GUICtrlSetOnEvent(-1, "btnWipeDiskDODClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet5 = GUICtrlCreateTabItem("BitTorrent Distribution")
$grpAriaEDA = GUICtrlCreateGroup("Aria2c - Erase, Download, Apply", 32, 104, 177, 153)
$btnEDACFS = GUICtrlCreateButton("Computers for Students", 48, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnEDACFSClick")
$btnEDACFT = GUICtrlCreateButton("Computers for Teachers", 48, 168, 145, 33)
GUICtrlSetOnEvent(-1, "btnEDACFTClick")
$btnEDADesktop = GUICtrlCreateButton("Desktop", 48, 208, 145, 33)
GUICtrlSetOnEvent(-1, "btnEDADesktopClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpAriaED = GUICtrlCreateGroup("Aria2c - Erase, Download", 216, 104, 177, 153)
$btnEDCFS = GUICtrlCreateButton("Computers for Students", 232, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnEDCFSClick")
$btnEDCFT = GUICtrlCreateButton("Computers for Teachers", 232, 168, 145, 33)
GUICtrlSetOnEvent(-1, "btnEDCFTClick")
$btnEDDesktop = GUICtrlCreateButton("Desktop", 232, 208, 145, 33)
GUICtrlSetOnEvent(-1, "btnEDDesktopClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpAriaPD = GUICtrlCreateGroup("Aria2c - Preserve, Download", 400, 104, 177, 153)
$btnPDCFS = GUICtrlCreateButton("Computers for Students", 416, 128, 145, 33)
GUICtrlSetOnEvent(-1, "btnPDCFSClick")
$btnPDCFT = GUICtrlCreateButton("Computers for Teachers", 416, 168, 145, 33)
GUICtrlSetOnEvent(-1, "btnPDCFTClick")
$btnPDDesktop = GUICtrlCreateButton("Desktop", 416, 208, 145, 33)
GUICtrlSetOnEvent(-1, "btnPDDesktopClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
 Sleep(100)
WEnd

;
; AYR STATE HIGH SCHOOL DEPLOYMENT UTILITY
; JANUARY 2011 - VERSION 1.0
; MADE BY BRENT PICKUP
;

#cs ExecCmd Blocks
Func ExecCmd($strCmd)
   	Local $tProcess, $tStartup
   	$tProcess = DllStructCreate($tagPROCESS_INFORMATION)
   	$tStartup = DllStructCreate($tagSTARTUPINFO)
   	DllStructSetData($tStartup, "Size" , DllStructGetSize($tStartup))
   	DllStructSetData($tStartup, "Flags" , $STARTF_USESHOWWINDOW)
   	DllStructSetData($tStartup, "ShowWindow" , 5) ; show window
   	_WinAPI_CreateProcess("", $strCmd, 0, 0, True, 0, 0, "", DllStructGetPtr($tStartup), DllStructGetPtr($tProcess))	
   EndFunc
   
   ; Global 
   
   Func ExecuteCmd($sCmd)
   	Local $tProcess, $tSecurity, $tStartup, $hWritePipe, $hEvent, $iMemo, $pOverlap, $tOverlap, $hPipe, $hReadPipe, $iState, $iToWrite
   
   	; Set up security attributes
   	$tSecurity = DllStructCreate($tagSECURITY_ATTRIBUTES)
   	DllStructSetData($tSecurity, "Length" , DllStructGetSize($tSecurity))
   	DllStructSetData($tSecurity, "InheritHandle", True)
   
   	; Create a pipe for the child process's STDOUT
   	if not _NamedPipes_CreatePipe($hReadPipe, $hWritePipe, $tSecurity) then
   	;LogError("ExecuteCmd ........: _NamedPipes_CreatePipe failed")
   	Return False
   	endif
   
   	; Create child process
   	$tProcess = DllStructCreate($tagPROCESS_INFORMATION)
   	$tStartup = DllStructCreate($tagSTARTUPINFO)
   	DllStructSetData($tStartup, "Size" , DllStructGetSize($tStartup))
   	DllStructSetData($tStartup, "Flags" , BitOR($STARTF_USESTDHANDLES, $STARTF_USESHOWWINDOW))
   	DllStructSetData($tStartup, "ShowWindow" , 5) ; show window
   	DllStructSetData($tStartup, "StdOutput", $hWritePipe)
   	DllStructSetData($tStartup, "StdError" , $hWritePipe)
   	if not _WinAPI_CreateProcess("", $sCmd, 0, 0, True, 0, 0, "", DllStructGetPtr($tStartup), DllStructGetPtr($tProcess)) then
   	;LogError("ExecuteCmd ........: _WinAPI_CreateProcess failed")
   	_WinAPI_CloseHandle($hReadPipe )
   	_WinAPI_CloseHandle($hWritePipe)
   	Return False
   	endif
   	_WinAPI_CloseHandle(DllStructGetData($tProcess, "hProcess"))
   	_WinAPI_CloseHandle(DllStructGetData($tProcess, "hThread" ))
   
   	; Close the write end of the pipe so that we can read from the read end
   	_WinAPI_CloseHandle($hWritePipe)
   
   	;LogMsg("ExecuteCommand ....: " & $sCmd
   	Return True
   EndFunc
#ce

Global $fnCFSGhost, $fnCFTGhost, $fnDesktopGhost

Func PartitionMachine($strType)
	; Clean this up
	Switch $strType
	Case "Desktop"
		$pOne = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /PRI /SZ:100 /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:Boot /y", "X:\", @SW_SHOWNORMAL)
		$pTwo = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /PRI /SZ:50000 /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:System /y", "X:\", @SW_SHOWNORMAL)
		$pThree = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /EXT /NTFS:VISTA /FOR /Q /ALIGN:1MB /y", "X:\", @SW_SHOWNORMAL)
		$pFour = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /LOG /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:Data /y", "X:\", @SW_SHOWNORMAL)
		If ($pOne == 0) Or ($pTwo == 0) Or ($pThree == 0) Or ($pFour == 0) Then
			MsgBox(0, "Error", "Error with Partitioning")
			Return 1
		EndIf		
	Case "CFT"
		$pOne = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /PRI /SZ:100 /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:Boot /y", "X:\", @SW_SHOWNORMAL)
		$pTwo = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /PRI /SZ:50000 /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:System /y", "X:\", @SW_SHOWNORMAL)
		$pThree = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /EXT /NTFS:VISTA /FOR /Q /ALIGN:1MB /y", "X:\", @SW_SHOWNORMAL)
		$pFour = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /LOG /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:Data /y", "X:\", @SW_SHOWNORMAL)
		If ($pOne == 0) Or ($pTwo == 0) Or ($pThree == 0) Or ($pFour == 0) Then
			MsgBox(0, "Error", "Error with Partitioning")
			Return 1
		EndIf
	Case "CFS"
		$pOne = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /PRI /SZ:1000 /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:Recovery /y", "X:\", @SW_SHOWNORMAL)
		$pTwo = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /PRI /SZ:50000 /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:System /y", "X:\", @SW_SHOWNORMAL)
		$pThree = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /PRI /SZ:50000 /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:Home /y", "X:\", @SW_SHOWNORMAL)
		$pFour = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /EXT /NTFS:VISTA /FOR /Q /ALIGN:1MB /y", "X:\", @SW_SHOWNORMAL)
		$pFive = RunWait("X:\Program Files\Ghost\gdisk32.exe 1 /CRE /LOG /NTFS:VISTA /FOR /Q /ALIGN:1MB /V:Data /y", "X:\", @SW_SHOWNORMAL)
		If ($pOne == 0) Or ($pTwo == 0) Or ($pThree == 0) Or ($pFour == 0) Or ($pFive == 0) Then
			MsgBox(0, "Error", "Error with Partitioning")
			Return 1
		EndIf
	EndSwitch
EndFunc
		
Func EraseDownloadImage($strName)
	$outDPart = RunWait("X:\Windows\System32\diskpart.exe /s diskpartAyrSHS.txt", "X:\Program Files\DETA", @SW_SHOWNORMAL)
	If $outDPart <> 0 Then
		MsgBox(0, "Error", "Failed to wipe drive. Exiting.")
		Return 1
	EndIf
	Run("X:\Windows\System32\aria2c.exe --dir=V:\ --file-allocation=none --check-integrity=true --conf=""X:\Program Files\DETA\aria2c.conf"" http://10.148.44.3/deployment/" & $strName & ".torrent", "V:\", @SW_SHOWNORMAL)
	; automatically loads torrent when downloaded.
EndFunc

Func ApplyDownloadImage($strName)
	$outDPart = RunWait("X:\Windows\System32\diskpart.exe /s diskpartAyrSHS.txt", "X:\Program Files\DETA", @SW_SHOWNORMAL)
	If $outDPart <> 0 Then
		MsgBox(0, "Error", "Failed to wipe drive. Exiting.")
		Return 1
	EndIf
	$outDownload = RunWait("X:\Windows\System32\aria2c.exe --dir=V:\ --file-allocation=none --check-integrity=true --conf=""X:\Program Files\DETA\aria2c.conf"" http://10.148.44.3/deployment/" & $strName & ".torrent", "V:\", @SW_SHOWNORMAL)
	; automatically loads torrent when downloaded. this blocks though which is a pain :\
	
	If $outDownload > 0 Then
		; run ghost
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -PRESERVE=V:\" & $strName & ".gho -PRESERVEDIMAGEDELETEAFTERCLONE -PRESERVEDEST=1 -CLONE,mode=RESTORE,src=V:\" & $strName & ".gho,dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf
EndFunc

Func btnBCDFixClick()
	$strLetter = GUICtrlRead($txtBCDDrive)

	If (StringLen($strLetter) > 1) Or (StringLen($strLetter) = 0) Then
		MsgBox(0, "Error", "Please enter a drive letter. No colon")
		Return 1
	EndIf
	
	RunWait("attrib -S -H -R " & $strLetter & ":\Boot\BCD", "X:\", @SW_SHOWNORMAL)
	RunWait("attrib -S -H -R " & $strLetter & ":\Bootmgr", "X:\", @SW_SHOWNORMAL)
	FileDelete($strLetter & ":\Bootmgr")
	FileDelete($strLetter & ":\Boot\BCD")
	Local $bcdReturn = RunWait("bcdboot " & $strLetter & ":\Windows /s " & $strLetter & ":", "X:\", @SW_SHOWNORMAL)
	If $bcdReturn = 0 Then
		MsgBox(0, "Notice:", "Completed BCD Repair successfully", 5)
		Return 0
	Else
		MsgBox(0, "Notice:", "Failed to repair BCD. Error code: " & $bcdReturn)
		Return 1
	EndIf
EndFunc
Func btnCFSSelectGhostImageClick()
	$message = "Select Ghost Image"

	$var = FileOpenDialog($message, "X:\", "Ghost Images (*.gho)", 1)

	If @error Then
		MsgBox(4096,"","No File(s) chosen")
	Else
		$var = StringReplace($var, "|", @CRLF)
		$fnCFSGhost = $var
		;MsgBox(4096,"","You chose " & $var)
	EndIf
EndFunc
Func btnCFTSelectGhostImageClick()
	$message = "Select Ghost Image"

	$var = FileOpenDialog($message, "X:\", "Ghost Images (*.gho)", 1)

	If @error Then
		MsgBox(4096,"","No File(s) chosen")
	Else
		$var = StringReplace($var, "|", @CRLF)
		$fnCFTGhost = $var
		;MsgBox(4096,"","You chose " & $var)
	EndIf
EndFunc
Func btnDesktopGhostSelectImageClick()
	$message = "Select Ghost Image"

	$var = FileOpenDialog($message, "X:\", "Ghost Images (*.gho)", 1)

	If @error Then
		MsgBox(4096,"","No File(s) chosen")
	Else
		$var = StringReplace($var, "|", @CRLF)
		$fnDesktopGhost = $var
		;MsgBox(4096,"","You chose " & $var)
	EndIf
EndFunc
Func btnEDACFSClick()
	ApplyDownloadImage("CFS")
EndFunc
Func btnEDACFTClick()
	ApplyDownloadImage("CFT")
EndFunc
Func btnEDADesktopClick()
	ApplyDownloadImage("Desktop")
EndFunc
Func btnEDCFSClick()
	EraseDownloadImage("CFS")
EndFunc
Func btnEDCFTClick()
	EraseDownloadImage("CFT")
EndFunc
Func btnEDDesktopClick()
	EraseDownloadImage("Desktop")
EndFunc
Func btnFixGrub4DosClick()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnImgCFSPWin7Click()
$strSessionName = GuiCtrlRead($txtCFSGhostSessionName)

If ($strSessionName == "") And ($fnCFSGhost == "") Then
	MsgBox(0, "Error!", "Please either select a Ghost Image or enter a Session ID")
	Return 1
EndIf

If ($strSessionName == "") And ($fnCFSGhost <> "") Then
	; Ghost file is the preferred way. Do that.
	; TODO
EndIf

If ($strSessionName <> "") And ($fnCFSGhost == "") Then
	; Session is the preferred way. Do that.
EndIf
EndFunc
Func btnImgCFSPWinXPClick()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnImgCFSWin7Click()
	Local $strSessionName
	$strSessionName = GuiCtrlRead($txtCFSGhostSessionName)

	If ($strSessionName == "") And ($fnCFSGhost == "") Then
		MsgBox(0, "Error!", "Please either select a Ghost Image or enter a Session ID")
		Return 1
	EndIf

	If ($strSessionName == "") And ($fnCFSGhost <> "") Then
		; Ghost file is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnDesktopGhost & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf

	If ($strSessionName <> "") And ($fnCFSGhost == "") Then
		; Session is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf
EndFunc
Func btnImgCFSWinXPClick()
	Local $strSessionName
	$strSessionName = GuiCtrlRead($txtCFSGhostSessionName)

	If ($strSessionName == "") And ($fnCFSGhost == "") Then
		MsgBox(0, "Error!", "Please either select a Ghost Image or enter a Session ID")
		Return 1
	EndIf

	If ($strSessionName == "") And ($fnCFSGhost <> "") Then
		; Ghost file is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnDesktopGhost & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf

	If ($strSessionName <> "") And ($fnCFSGhost == "") Then
		; Session is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf
EndFunc
Func btnImgCFTPWin7Click()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnImgCFTPWinXPClick()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnImgCFTWin7Click()
	Local $strSessionName
	$strSessionName = GuiCtrlRead($txtCFTGhostSessionName)

	If ($strSessionName == "") And ($fnCFTGhost == "") Then
		MsgBox(0, "Error!", "Please either select a Ghost Image or enter a Session ID")
		Return 1
	EndIf

	If ($strSessionName == "") And ($fnCFTGhost <> "") Then
		; Ghost file is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnDesktopGhost & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf

	If ($strSessionName <> "") And ($fnCFTGhost == "") Then
		; Session is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf
EndFunc
Func btnImgCFTWinXPClick()
	Local $strSessionName
	$strSessionName = GuiCtrlRead($txtCFTGhostSessionName)

	If ($strSessionName == "") And ($fnCFTGhost == "") Then
		MsgBox(0, "Error!", "Please either select a Ghost Image or enter a Session ID")
		Return 1
	EndIf

	If ($strSessionName == "") And ($fnCFTGhost <> "") Then
		; Ghost file is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnDesktopGhost & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf

	If ($strSessionName <> "") And ($fnCFTGhost == "") Then
		; Session is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf
EndFunc
Func btnImgDPWin7Click()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnImgDPWinXPClick()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnImgDWin7Click()
	Local $strSessionName
	$strSessionName = GuiCtrlRead($txtDesktopSession)

	If ($strSessionName == "") And ($fnDesktopGhost == "") Then
		MsgBox(0, "Error!", "Please either select a Ghost Image or enter a Session ID")
		Return 1
	EndIf

	If ($strSessionName == "") And ($fnDesktopGhost <> "") Then
		; Ghost file is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnDesktopGhost & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf

	If ($strSessionName <> "") And ($fnDesktopGhost == "") Then
		; Session is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf
EndFunc
Func btnImgDWinXPClick()
	Local $strSessionName
	$strSessionName = GuiCtrlRead($txtDesktopSession)

	If ($strSessionName == "") And ($fnDesktopGhost == "") Then
		MsgBox(0, "Error!", "Please either select a Ghost Image or enter a Session ID")
		Return 1
	EndIf

	If ($strSessionName == "") And ($fnDesktopGhost <> "") Then
		; Ghost file is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnDesktopGhost & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf

	If ($strSessionName <> "") And ($fnDesktopGhost == "") Then
		; Session is the preferred way. Do that.
		Run("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "X:\", @SW_SHOWNORMAL)
	EndIf
EndFunc
Func btnPDCFSClick()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnPDCFTClick()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnPDDesktopClick()
	MsgBox(0, "Notice", "This feature is incomplete")
EndFunc
Func btnRunCmdClick()
	Run("cmd")
EndFunc
Func btnRunGhostClick()
	; asynchronous. don't wait for ghost to do its business.
	Run("X:\Program Files\Ghost\Ghost32.exe", "X:\")
EndFunc
Func Form1Close()
Exit(0)
EndFunc
Func btnPartitionCFSClick()
PartitionMachine("CFS")
EndFunc
Func btnPartitionCFTClick()
PartitionMachine("CFT")
EndFunc
Func btnPartitionDesktopClick()
PartitionMachine("Desktop")
EndFunc
Func btnUnhideAllClick()
	; dont bother error checking here -- there will be failures on some because the partitions won't be present.
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /~HIDE /P:1 /Y", "X:\", @SW_SHOWNORMAL)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /~HIDE /P:2 /Y", "X:\", @SW_SHOWNORMAL)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /~HIDE /P:3 /Y", "X:\", @SW_SHOWNORMAL)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /~HIDE /P:4 /Y", "X:\", @SW_SHOWNORMAL)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /~HIDE /P:0 /Y", "X:\", @SW_SHOWNORMAL)
EndFunc
Func btnWipeDiskDODClick()
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /DISKWIPE /CUSTOM:3 /Y", "X:\", @SW_SHOWNORMAL)
EndFunc
Func btnDiskWipe1Click()
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /DISKWIPE /Y", "X:\", @SW_SHOWNORMAL)
EndFunc
Func txtBCDDriveChange()

EndFunc
Func txtCFSGhostSessionNameChange()

EndFunc
Func txtCFTGhostSessionNameChange()

EndFunc
Func txtDesktopSessionChange()

EndFunc
