#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=R:\Work\ImagePE\Program Files\DETA\AyrSHSDeploy.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <NamedPipes.au3>
#include <Array.au3>
#include <Constants.au3>
#include <String.au3>
#include <Debug.au3>

Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=r:\work\koda\forms\ayrshsdeploy.kxf
$Form1_2 = GUICreate("AyrSHS WinPE Environment", 615, 438)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Label1 = GUICtrlCreateLabel(IniRead("X:\Program Files\DETA\Settings.ini", "Main", "GuiMainLabel", "AyrSHS WinPE Environment"), 128, 16, 383, 37)
GUICtrlSetFont(-1, 20, 800, 0, "Tahoma")
$Tab1 = GUICtrlCreateTab(16, 64, 585, 353)
$TabSheet1 = GUICtrlCreateTabItem("Computers For Students")
$grpCFSWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 257)
$btnImgCFSWin7 = GUICtrlCreateButton("Image Machine", 48, 264, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFSWin7Click")
$btnImgCFSPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 304, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFSPWin7Click")
$radCFSGhost = GUICtrlCreateRadio("Ghost", 48, 136, 113, 17)
$radCFSTorrent = GUICtrlCreateRadio("Torrent", 48, 160, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
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
$TabSheet2 = GUICtrlCreateTabItem("Computers for Teachers")
$grpCFTWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 257)
$btnImgCFTWin7 = GUICtrlCreateButton("Image Machine", 48, 256, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFTWin7Click")
$btnImgCFTPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 304, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgCFTPWin7Click")
$radCFTGhost = GUICtrlCreateRadio("Ghost", 48, 136, 113, 17)
$radCFTTorrent = GUICtrlCreateRadio("Torrent", 48, 160, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
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
$TabSheet3 = GUICtrlCreateTabItem("Desktop Machines")
$grpDeskWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 257)
$btnImgDWin7 = GUICtrlCreateButton("Image Machine", 48, 256, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgDWin7Click")
$btnImgDPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 304, 145, 33)
GUICtrlSetOnEvent(-1, "btnImgDPWin7Click")
$radDesktopGhost = GUICtrlCreateRadio("Ghost", 48, 136, 113, 17)
$radDesktopTorrent = GUICtrlCreateRadio("Torrent", 48, 160, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
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
$TabSheet4 = GUICtrlCreateTabItem("Utilities")
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
$grpGDisk = GUICtrlCreateGroup("GDisk", 416, 104, 169, 297)
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
$grpRunExplorer = GUICtrlCreateGroup("Explorer", 32, 328, 177, 73)
$btnRunExplorer = GUICtrlCreateButton("Run Explorer", 48, 352, 145, 33)
GUICtrlSetOnEvent(-1, "btnRunExplorerClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpReboot = GUICtrlCreateGroup("Reboot", 224, 328, 177, 73)
$btnReboot = GUICtrlCreateButton("Reboot", 240, 352, 145, 33)
GUICtrlSetOnEvent(-1, "btnRebootClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $fnCFSGhost, $fnCFTGhost, $fnDesktopGhost
Global $arrAlphabet[26] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
_DebugSetup("BTDeploy Debug Output", True)
; ******************************************************************
; UPDATE WITH YOUR OWN DEPLOYMENT HOST.
; THIS IS WHERE YOUR TORRENTS ARE.
; ******************************************************************
; Global Const $strDeploymentHost = "http://10.148.44.3/deployment/"
; Global Const $strDeploymentHost = "http://brentp.net/deployment/"
;Global Const $strDeploymentHost = "http://drop.edgiest.net/brent/"
;_DebugReportVar("strDeploymentHost", $strDeploymentHost)

	Global Const $strDeploymentHost = IniRead("X:\Program Files\DETA\Settings.ini", "Main", "DeploymentHost", "http://drop.edgiest.net/brent/")
	Global Const $strCFSHomeIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFSHomeIndex", "3")
	Global Const $strCFSMOEIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFSMOEIndex", "2")
	Global Const $strCFSRecoveryIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFSRecoveryIndex", "1")
	Global Const $strCFSDataIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFSDataIndex", "4")
	Global Const $strDesktopMOEIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "DesktopMOEIndex", "2")
	Global Const $strDesktopRecoveryIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "DesktopRecoveryIndex", "1")
	Global Const $strDesktopDataIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "DesktopDataIndex", "3")
	Global Const $strCFTMOEIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFTMOEIndex", "2")
	Global Const $strCFTRecoveryIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFTRecoveryIndex", "1")
	Global Const $strCFTDataIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFTDataIndex", "3")
	_DebugReportVar("strDeploymentHost", $strDeploymentHost)
; *******************************************************************

While 1
	Sleep(100)
WEnd

; ****************************************************
; ********** BTDEPLOY - BRENT PICKUP 2011 ************
; ****************************************************
; THIS IS CUSTOMISED FOR MY ENVIRONMENT.  IT WILL NOT
; WORK IN YOURS OUT OF THE BOX.
; ****************************************************
; TODO:
; * Update BCD Function for new more-precise bcd fixes.
; * Remove all old ghost stuff and move the BitTorrent stuff to their respective tabs (CFT, CFS, etc).
; * Perhaps implement parsing to dynamically get images from the server.  Could be done via INI File?
; * Remove all code marked as old without breaking anything.
; ****************************************************
; ****************************************************
; ****************************************************

Func PartitionMachine($strType, $bEnableOutput = True)
	Local $outDownload, $outPartition

	$outDownload = RunWait("X:\Windows\System32\aria2c.exe --dir=X:\ --file-allocation=none --check-integrity=true --conf=""X:\Program Files\DETA\aria2c.conf"" " & $strDeploymentHost & $strType & "/disk.wipe.txt", "X:\", @SW_SHOWNORMAL)
	If ($outDownload = 0) And (@error <> 0) Then
		If $bEnableOutput Then
			;MsgBox(0, "Download Failed", "Download of partition info failed.")
			_DebugReport("Download of partition script failed.", True)
		EndIf
		Return 0
	EndIf
	; assume disk partition info is at X:\disk.wipe.txt
	; now run gdisk32.
	;$outPartition = RunWait("X:\Program Files\Ghost\Gdisk32.exe 1 /BATCH:X:\disk.wipe.txt", "X:\", @SW_SHOWNORMAL)
	$outPartition = RunWait("diskpart /s X:\disk.wipe.txt", "X:\", @SW_SHOWNORMAL)
	If ($outPartition = 0) And (@error <> 0) Then
		If $bEnableOutput Then
			;MsgBox(0, "Error", "Partitioning failed.  See Gdisk32 for more info.")
			_DebugReport("Partitioning failed. See GDisk32.", True)
		EndIf
		Return 0
	EndIf

	If $bEnableOutput Then
		_DebugReport("Successfully partitioned drive.")
		;MsgBox(0, "Success!", "Partitioned machine!")
	EndIf
	Return 1
EndFunc   ;==>PartitionMachine

Func FindDriveByLabel($strLabel)
	;
	Local $curIndex, $curDrive
	$curIndex = 0
	Do
		$curDrive = DriveGetLabel($arrAlphabet[$curIndex] & ":\")
		If $curDrive == $strLabel Then
			_DebugReport("FindDriveByLabel: " & $strLabel & " = " & $arrAlphabet[$curIndex] & ":\")
			Return $arrAlphabet[$curIndex] & ":\"
		EndIf
		$curIndex = $curIndex + 1
	Until $curIndex = 26
	_DebugReport("FindDriveByLabel: Could not find " & $strLabel)
	Return ""
EndFunc   ;==>FindDriveByLabel

Func ApplyWIMImage($strName, $bPreserve)
	Local $outDownload, $outPartition, $outTorrent, $outApplySystem, $outApplyRecovery
	Local $outApplyData, $outApplyHome
	Local $drvSystem, $drvHome, $drvRecovery, $drvData, $outSetPartActive

	If PartitionMachine($strName, False) = 0 Then
		_DebugReport("EraseDownloadApplyWIM: Failed to partition machine.  Check download on server, or presence of gdisk32.")
		;MsgBox(16, "Error!", "Failed to partition machine.  Check download on server, or presence of gdisk32.")
		Return 0
	EndIf

	If $strName == "CFS" Then
		$drvSystem = FindDriveByLabel("System")
		$drvData = FindDriveByLabel("Data")
		$drvHome = FindDriveByLabel("Home")
		$drvRecovery = FindDriveByLabel("Reserved")

		If ($drvSystem == "") Or ($drvData == "") Or ($drvHome == "") Or ($drvRecovery == "") Then
			_DebugReport("EraseDownloadApplyWIM: Failed to detect partitions.")
			_DebugReportVar("drvSystem", $drvSystem)
			_DebugReportVar("drvData", $drvData)
			_DebugReportVar("drvHome", $drvHome)
			_DebugReportVar("drvRecovery", $drvRecovery)
			MsgBox(16, "Error", "Failed to detect partitions. Please try again.")
			Return 0
		EndIf
	Else
		$drvSystem = FindDriveByLabel("System")
		$drvData = FindDriveByLabel("Data")
		$drvRecovery = FindDriveByLabel("Reserved")
		If ($drvSystem == "") Or ($drvData == "") Or ($drvRecovery == "") Then
			_DebugReport("EraseDownloadApplyWIM: Failed to detect partitions.")
			_DebugReportVar("drvSystem", $drvSystem)
			_DebugReportVar("drvData", $drvData)
			_DebugReportVar("drvRecovery", $drvRecovery)
			MsgBox(16, "Error", "Failed to detect partitions. Please try again.")
			Return 0
		EndIf
	EndIf


	$outTorrent = RunWait("X:\Windows\System32\aria2c.exe --dir=" & $drvData & " --file-allocation=none --check-integrity=true --conf=""X:\Program Files\DETA\aria2c.conf"" " & $strDeploymentHost & $strName & ".torrent", $drvData, @SW_SHOWNORMAL)
	If ($outTorrent = 0) And (@error <> 0) Then
		; error in torrent download :(
		_DebugReport("EraseDownloadApplyWIM: Error downloading torrent.  Download Location = " & $drvData)
		MsgBox(16, "Error", "Error downloading torrent.  Tried to download to: " & $drvData)
		Return 0
	EndIf

	; ALL Images will be called "Image.WIM"
	; ie: D:\CFS\Image.WIM

	If FileExists($drvData & $strName & "\Image.WIM") == 0 Then
		; error in torrent DL?
		_DebugReport("EraseDownloadApplyWIM: Image should be at: " & $drvData & $strName & "\Image.WIM but isnt.")
		MsgBox(16, "Error!", "Image does not exist after download.")
		Return 0
	EndIf

	; Apply Image.
	If RunWaitCheck("X:\Windows\System32\imagex.exe /apply " & $drvData & $strName & "\Image.WIM " & GetIndexOfWim($strName, "System") & " " & $drvSystem, "Error applying System partition") = 0 Then Return 0
	;If RunWaitCheck("X:\Windows\System32\imagex.exe /apply " & $drvData & $strName & "\Image.WIM 1 " & $drvSystem, "Error applying System partition") = 0 Then Return 0

	If RunWaitCheck("X:\Windows\System32\imagex.exe /apply " & $drvData & $strName & "\Image.WIM " & GetIndexOfWim($strName, "Reserved") & " " & $drvRecovery, "Error applying Recovery partition") = 0 Then Return 0

	;If $strName == "CFS" Then
	If RunWaitCheck("X:\Windows\System32\imagex.exe /apply " & $drvData & $strName & "\Image.WIM " & GetIndexOfWim($strName, "Data") & " " & $drvData, "Error applying Data partition") = 0 Then Return 0
	;Else
	;	If RunWaitCheck("X:\Windows\System32\imagex.exe /apply " & $drvData & $strName & "\Image.WIM 3 " & $drvData, "Error applying Data partition") = 0 Then Return 0
	;EndIf

	If $strName == "CFS" Then
		If RunWaitCheck("X:\Windows\System32\imagex.exe /apply " & $drvData & $strName & "\Image.WIM " & GetIndexOfWim($strName, "Home") & " " & $drvHome, "Failed to apply Home Partition") = 0 Then Return 0
	EndIf

	; This part fixes the BCD.  Merge this code into the BCD Fix function when it is tested and proven mature.  Otherwise revert to old code.
	; hopefully this is more precise.

	If $strName == "CFS" Then
		; Unhide drives.
		RunWaitCheck("attrib -S -H -R " & $drvSystem & "Boot\BCD", "Failed to remove attributes on System BCD")
		RunWaitCheck("attrib -S -H -R " & $drvHome & "Boot\BCD", "Failed to remove attributes on Home BCD")
		FileDelete($drvSystem & "Boot\BCD")
		FileDelete($drvHome & "Boot\BCD")
		RunWaitCheck("X:\Program Files\Ghost\Gdisk32.exe 1 /ACT /P:3", "Failed to activate System partition")
		RunWaitCheck("bcdboot " & $drvSystem & "Windows /l en-us", "Failed to run bcdboot for system.")
		RunWaitCheck("X:\Program Files\Ghost\Gdisk32.exe 1 /ACT /P:4", "Failed to activate Home partition")
		RunWaitCheck("bcdboot " & $drvHome & "Windows /l en-us", "Failed to run bcdboot for Home")
		RunWaitCheck("X:\Program Files\Ghost\Gdisk32.exe 1 /ACT /P:3", "Failed to activate System partition")
		#cs
		If (GrabFile($strDeploymentHost & $strName & "/stage2.txt", "X:\") = 0) Or (GrabFile($strDeploymentHost & $strName & "/stage3.txt", "X:\") = 0) Or (GrabFile($strDeploymentHost & $strName & "/stage4.txt", "X:\") = 0) Then
			_DebugReport("Failed to DL partition scripts.")
			Return 0
		EndIf
		RunWaitCheck("diskpart /s X:\stage2.txt", "Error running stage 2 partition stuff.")
		$drvSystem = FindDriveByLabel("System")
		$drvData = FindDriveByLabel("Data")
		$drvHome = FindDriveByLabel("Home")
		$drvRecovery = FindDriveByLabel("Reserved")
		RunWaitCheck("bcdboot " & $drvHome & "Windows /s " & StringLeft($drvHome, 2), "Error updating Home BCD")
		If CreateBCDStore($drvHome) = 0 Then Return 0
		RunWaitCheck("diskpart /s X:\stage3.txt", "Error running stage 3 partition stuff.")
		$drvSystem = FindDriveByLabel("System")
		$drvData = FindDriveByLabel("Data")
		$drvHome = FindDriveByLabel("Home")
		$drvRecovery = FindDriveByLabel("Reserved")
		RunWaitCheck("bcdboot " & $drvSystem & "Windows /s " & StringLeft($drvSystem, 2), "Error updating MOE BCD")
		If CreateBCDStore($drvSystem) = 0 Then Return 0
		RunWaitCheck("diskpart /s X:\stage4.txt", "Error running stage 4 partition stuff.")
		$drvSystem = FindDriveByLabel("System")
		$drvData = FindDriveByLabel("Data")
		$drvHome = FindDriveByLabel("Home")
		$drvRecovery = FindDriveByLabel("Reserved")
		#ce
		;If RunWaitCheck("X:\Program Files\MBRFix\MBRFix.exe /drive 0 /partition 3 setactivepartition /yes", "Couldnt set active partition.") = 0 Then Return 0
		If RunWaitCheck("X:\Program Files\Grubinst\grubinst.exe (hd0)", "Couldnt write grub boot sector.") = 0 Then Return 0
		; we are back to how we were before.
	Else
		RunWaitCheck("bcdboot " & $drvSystem & "Windows /s " & StringLeft($drvSystem, 2), "Error updating MOE BCD")
		; BCDBOOT should be sufficient.  IT runs a 'locate' to find winload, etc on first boot. Probably not for CFS though.
		;If CreateBCDStore($drvSystem) = 0 Then Return 0
		; If RunWaitCheck("X:\Windows\System32\bootsect.exe " & $drvSystem & "Windows /s " & StringLeft($drvSystem, 2) & " /FORCE /MBR", "Failed to write boot sector.") = 0 Then Return 0
		If RunWaitCheck("X:\Windows\System32\bootsect.exe /nt60 SYS /FORCE /MBR", "Failed to write boot sector.") = 0 Then Return 0
	EndIf

	If FileExists($drvSystem & "Build") Then
		_DebugReport("EraseDownloadApplyWIM: Successfully Imaged Drive!")
		MsgBox(0, "Success!", "Imaged Drive!")
		DirRemove($drvData & $strName, True)
		DirRemove($drvData & ".aria2", True)
		FileDelete($drvData & $strName & ".torrent")
		Return 1
	Else
		DirRemove($drvData & $strName, True)
		DirRemove($drvData & ".aria2", True)
		FileDelete($drvData & $strName & ".torrent")
		_DebugReport("EraseDownloadApplyWIM: Something went wrong.  Check this log.")
		MsgBox(16, "Error.", "Something went screwy -- dont know what.")
		Return 0
	EndIf
EndFunc   ;==>EraseDownloadApplyWIM

Func GetIndexOfWim($strName, $strPartition)
	;
	Switch $strName
	Case "CFS"
		Switch $strPartition
		Case "System"
			Return $strCFSMOEIndex
		Case "Home"
			Return $strCFSHomeIndex
		Case "Data"
			Return $strCFSDataIndex
		Case "Reserved"
			Return $strCFSRecoveryIndex
		EndSwitch
	Case "Desktop"
		Switch $strPartition
		Case "System"
			Return $strDesktopMOEIndex
		Case "Data"
			Return $strDesktopDataIndex
		Case "Reserved"
			Return $strDesktopRecoveryIndex
		EndSwitch
	Case "CFT"
		Switch $strPartition
		Case "System"
			Return $strCFTMOEIndex
		Case "Data"
			Return $strCFTDataIndex
		Case "Reserved"
			Return $strCFTRecoveryIndex
		EndSwitch
	EndSwitch
EndFunc

Func GrabFile($strURL, $strOut)
	Local $outFile
	$outFile = RunWait("X:\Windows\System32\aria2c.exe --dir=" & $strOut & " --file-allocation=none --check-integrity=true --conf=""X:\Program Files\DETA\aria2c.conf"" " & $strURL, $strOut, @SW_SHOWNORMAL)
	If ($outFile = 0) And (@error <> 0) Then
		; error in torrent download :(
		_DebugReport("GrabFile: Error downloading file.  URL = " & $strURL & " Path = " & $strOut)
		Return 0
	EndIf
	Return 1
EndFunc

Func CreateBCDStore($strDrive)
	; *********************
	; *** NO USE FOR THIS AS OF 12/02
	; *********************
	; This Function creates a blank bcd store from scratch on the specified drive, and also copies the bcd files.
	RunWaitCheck("attrib -S -H -R " & $strDrive & "Boot\BCD", "Failed to remove BCD Attributes", $strDrive & "Windows\System32")
	FileDelete($strDrive & "Boot\BCD")
	If RunWaitCheck("bcdedit /createstore " & $strDrive & "Boot\BCD", "Failed to create temporary BCD store", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /create {bootmgr} /d ""Windows Boot Manager""", "Failed to create bootmgr entry in BCD store.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {bootmgr} device partition=" & StringLeft($strDrive, 2), "Failed to set BCD partition.", $strDrive & "Windows\System32") = 0 Then Return 0
	;If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {bootmgr} device locate=unknown", "Failed to set BCD partition.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {bootmgr} locale en-US", "Failed to set locale.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /timeout 10", "Failed to set timeout", $strDrive & "Windows\System32") = 0 Then Return 0
	; needs to run in C:\Windows\System32, assuming C: = the partition. this is because bcdedit is not in winpe by default.
	;If FileExists($strDrive & "Boot\BCD") = 0 Then
	;	_DebugReport("Cant find BCD store..", True)
	;EndIf
	Local $bcdTries = 0
	Do
		$bcdTries = $bcdTries + 1
		If $bcdTries > 300 Then
			; we've been waiting 5 minutes...
			_DebugReport("Attempted BCD check for 5 minutes... doesnt look like its going to work.  Failing gracefully.")
			Return 0
		EndIf
		; we wait until then. Note: This section is a potential hang risk.
		_DebugReport("Cant find BCD Store at '" & $strDrive & "Boot\BCD' Sleeping for 1 sec and trying again....")
		Sleep(1000)
	Until FileExists($strDrive & "Boot\BCD") = 1

	FileDelete("X:\BCDOut.txt")

	Local $bcdCreateOut = RunWait(@ComSpec & " /c bcdedit /store " & $strDrive & "Boot\BCD /create /d ""Windows 7 Enterprise Edition"" /application osloader > X:\BCDOut.txt 2>&1", $strDrive & "Windows\System32")
	Local $line, $bcdOutStr, $bcdGuid

	$bcdOutTxt = FileOpen("X:\BCDOut.txt", 0)

	If $bcdOutTxt = -1 Then
		_DebugReport("Failed to open BCD Output Text file.")
		Return 0
	EndIf

	$contents = FileRead($bcdOutTxt)
	_DebugReport("File contents: " & $contents)

	FileClose($bcdOutTxt)
	Local $arrGuid = _StringBetween($contents, "{", "}")
	_DebugReportVar("arrGuid", $arrGuid)
	;_ArrayDisplay($arrGuid)
	; should only be one result.
	If IsArray($arrGuid) = 0 Or StringLen($arrGuid[0]) <> 36 Then
		_DebugReportVar("arrGuid", $arrGuid)
		_DebugReport("BCD Output: " & $bcdOutStr)
		_DebugReport("Failed to create OSLOADER. See above")
		MsgBox(16, "Error!", "Failed to create osloader?")
		Return 0
	Else
		$bcdGuid = $arrGuid[0]
	EndIf

	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} device partition=" & StringLeft($strDrive, 2), "Failed to set device partition in OSLOADER", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} osdevice partition=" & StringLeft($strDrive, 2), "Failed to set osdevice partition in OSLOADER", $strDrive & "Windows\System32") = 0 Then Return 0
	;If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} device locate=\windows\system32\winload.exe", "Failed to set device partition in OSLOADER", $strDrive & "Windows\System32") = 0 Then Return 0
	;If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} osdevice locate=\windows", "Failed to set osdevice partition in OSLOADER", $strDrive & "Windows\System32") = 0 Then Return 0

	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} path \Windows\system32\winload.exe", "Failed to set winload path.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} systemroot \Windows", "Failed to set windows path.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} locale en-US", "Failed to set locale - osloader.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} recoveryenabled No", "Failed to set recovery disabled. - osloader.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /displayorder {" & $bcdGuid & "}", "Failed to set display order.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /default {" & $bcdGuid & "}", "Failed to set default.", $strDrive & "Windows\System32") = 0 Then Return 0
	Return 1
	#cs BCD Commands.
		del C:\boot\bcd
		bcdedit /createstore c:\boot\bcd.temp
		bcdedit.exe /store c:\boot\bcd.temp /create {bootmgr} /d "Windows Boot Manager"
		bcdedit.exe /import c:\boot\bcd.temp
		bcdedit.exe /set {bootmgr} device partition=C:
		bcdedit.exe /set {bootmgr} locale en-US
		bcdedit.exe /timeout 10
		del c:\boot\bcd.temp
		--- OS --
		bcdedit.exe /create /d "Windows 7 Enterprise Edition" /application osloader
		bcdedit.exe /set {c0dfc4fa-cb21-11dc-81bf-005056c00008} device partition=C:
		bcdedit.exe /set {c0dfc4fa-cb21-11dc-81bf-005056c00008} osdevice partition=C:
		bcdedit.exe /set {c0dfc4fa-cb21-11dc-81bf-005056c00008} path \Windows\system32\winload.exe
		bcdedit.exe /set {c0dfc4fa-cb21-11dc-81bf-005056c00008} systemroot \Windows
		bcdedit.exe /set {c0dfc4fa-cb21-11dc-81bf-005056c00008} locale en-US
		--- DISPLAY --
		bcdedit.exe /displayorder {c0dfc4fa-cb21-11dc-81bf-005056c00008}
		bcdedit.exe /default {c0dfc4fa-cb21-11dc-81bf-005056c00008}
	#ce
EndFunc   ;==>CreateBCDStore

Func RunWaitCheck($strCmd, $strErrorMsgBox, $strPath = "X:\")
	; Function that all error checking is done in.
	; **********************************************
	; DO NOT BREAK THIS FUNCTION. THIS IS WHERE ALL LOGIC IN THE PROGRAM IS DONE.
	; BREAK THIS, AND BREAK EVERYTHING.
	; **********************************************
	Local $outCmd
	$outCmd = RunWait($strCmd, $strPath, @SW_SHOWNORMAL)
	If ($outCmd = 0) And (@error <> 0) Then
		_DebugReport($strErrorMsgBox, True)
		MsgBox(16, "Error", $strErrorMsgBox)
		Return 0
	Else
		_DebugReport($strCmd & " SUCCESSFUL")
		Return 1
	EndIf
EndFunc   ;==>RunWaitCheck

Func FixBCDDrive($strDrive, $bFixSector, $bCFSWipe)
	Local $strLetter, $outBootSect

	; lazy.
	$strLetter = $strDrive

	If (StringLen($strLetter) > 1) Or (StringLen($strLetter) = 0) Then
		MsgBox(0, "Error", "Please enter a drive letter. No colon")
		Return 1
	EndIf

	RunWait("attrib -S -H -R " & $strLetter & ":\Boot\BCD", "X:\", @SW_SHOWNORMAL)
	RunWait("attrib -S -H -R " & $strLetter & ":\Bootmgr", "X:\", @SW_SHOWNORMAL)
	FileDelete($strLetter & ":\Bootmgr")
	FileDelete($strLetter & ":\Boot\BCD")
	Local $bcdReturn = RunWait("bcdboot " & $strLetter & ":\Windows /s " & $strLetter & ":", "X:\", @SW_SHOWNORMAL)

	If $bFixSector == True Then
		If $bCFSWipe == True Then
			$outBootSect = RunWait("X:\Windows\System32\bootsect.exe /nt60 " & $strLetter & ":\ /FORCE", "X:\", @SW_SHOWNORMAL)
		Else
			$outBootSect = RunWait("X:\Windows\System32\bootsect.exe /nt60 " & $strLetter & ":\ /MBR /FORCE", "X:\", @SW_SHOWNORMAL)
		EndIf
		If $outBootSect == 0 Then
			MsgBox(0, "Error!", "Failed to fix boot sector")
			Return 0
		EndIf
	EndIf

	If $bcdReturn = 0 Then
		MsgBox(0, "Notice:", "Completed BCD Repair successfully", 5)
		Return 0
	Else
		MsgBox(0, "Notice:", "Failed to repair BCD. Error code: " & $bcdReturn)
		Return 1
	EndIf
EndFunc   ;==>FixBCDDrive

Func btnBCDFixClick()
	Local $strLetter

	$strLetter = GUICtrlRead($txtBCDDrive)
	CreateBCDStore($strLetter & ":\")
	;FixBCDDrive($strLetter, False, False)

EndFunc   ;==>btnBCDFixClick

Func btnCFSSelectGhostImageClick()
	Local $message, $var
	$message = "Select Ghost Image"

	$var = FileOpenDialog($message, "X:\", "Ghost Images (*.gho)", 1)

	If @error Then
		MsgBox(4096, "", "No File(s) chosen")
	Else
		$var = StringReplace($var, "|", @CRLF)
		$fnCFSGhost = $var
		;MsgBox(4096,"","You chose " & $var)
	EndIf
EndFunc   ;==>btnCFSSelectGhostImageClick
Func btnCFTSelectGhostImageClick()
	Local $message, $var
	$message = "Select Ghost Image"

	$var = FileOpenDialog($message, "X:\", "Ghost Images (*.gho)", 1)

	If @error Then
		MsgBox(4096, "", "No File(s) chosen")
	Else
		$var = StringReplace($var, "|", @CRLF)
		$fnCFTGhost = $var
		;MsgBox(4096,"","You chose " & $var)
	EndIf
EndFunc   ;==>btnCFTSelectGhostImageClick
Func btnDesktopGhostSelectImageClick()
	Local $message, $var
	$message = "Select Ghost Image"

	$var = FileOpenDialog($message, "X:\", "Ghost Images (*.gho)", 1)

	If @error Then
		MsgBox(4096, "", "No File(s) chosen")
	Else
		$var = StringReplace($var, "|", @CRLF)
		$fnDesktopGhost = $var
		;MsgBox(4096,"","You chose " & $var)
	EndIf
EndFunc   ;==>btnDesktopGhostSelectImageClick
Func btnFixGrub4DosClick()
	If RunWaitCheck("X:\Program Files\Grubinst\grubinst.exe (hd0)", "Couldnt write grub boot sector.") = 0 Then Return 0
EndFunc   ;==>btnFixGrub4DosClick
Func GenericApplyImage($radTorrent, $radGhost, $txtGhost, $fnVar, $strType, $bPreserve)
	; radTorrent = radiobox of torrent.
	; radiobox of ghost
	; txtbox with ghost session name
	; type of image.
	Local $bTorrent, $bGhost, $strSessionName
	If GuiCtrlRead($radTorrent) = $GUI_CHECKED Then $bTorrent = True
	If GuiCtrlRead($radGhost) = $GUI_CHECKED Then $bGhost = True
	$strSessionName = GUICtrlRead($txtGhost)
	; got all of the nececssary info.

	If $radGhost = True Then
		; do our ghosty stuff.
		;
		If $strSessionName = "" Then Return 0
		If $fnVar <> "" Then
			RunWaitCheck("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnVar & ",dst=1", "Ghosting failed. Refer to Ghosterr.txt.")
		Else
			RunWaitCheck("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "Ghosting failed. Refer to Ghosterr.txt.")
		EndIf
	ElseIf $radTorrent = True Then
		; do our torrenty stuff.
		;
		ApplyWIMImage($strType, $bPreserve)
	Else
		Return 0
	EndIf

EndFunc

Func btnImgCFSPWin7Click()
	GenericApplyImage($radCFSTorrent, $radCFSGhost, $txtCFSGhostSessionName, $fnCFSGhost, "CFS", True)
EndFunc   ;==>btnImgCFSPWin7Click
Func btnImgCFSWin7Click()
	GenericApplyImage($radCFSTorrent, $radCFSGhost, $txtCFSGhostSessionName, $fnCFSGhost, "CFS", False)
EndFunc   ;==>btnImgCFSWin7Click
Func btnImgCFTPWin7Click()
	GenericApplyImage($radCFTTorrent, $radCFTGhost, $txtCFTGhostSessionName, $fnCFTGhost, "CFT", True)
EndFunc   ;==>btnImgCFTPWin7Click
Func btnImgCFTWin7Click()
	GenericApplyImage($radCFTTorrent, $radCFTGhost, $txtCFTGhostSessionName, $fnCFTGhost, "CFT", False)
EndFunc   ;==>btnImgCFTWin7Click
Func btnImgDPWin7Click()
	GenericApplyImage($radDesktopTorrent, $radDesktopGhost, $txtDesktopSession, $fnDesktopGhost, "Desktop", True)
EndFunc   ;==>btnImgDPWin7Click
Func btnImgDWin7Click()
	GenericApplyImage($radDesktopTorrent, $radDesktopGhost, $txtDesktopSession, $fnDesktopGhost, "Desktop", False)
EndFunc   ;==>btnImgDWin7Click
Func btnRunCmdClick()
	Run("cmd")
EndFunc   ;==>btnRunCmdClick
Func btnRunGhostClick()
	; asynchronous. don't wait for ghost to do its business.
	Run("X:\Program Files\Ghost\Ghost32.exe", "X:\")
EndFunc   ;==>btnRunGhostClick
Func Form1Close()
	Exit (0)
EndFunc   ;==>Form1Close
Func btnPartitionCFSClick()
	PartitionMachine("CFS")
EndFunc   ;==>btnPartitionCFSClick
Func btnPartitionCFTClick()
	PartitionMachine("CFT")
EndFunc   ;==>btnPartitionCFTClick
Func btnPartitionDesktopClick()
	PartitionMachine("Desktop")
EndFunc   ;==>btnPartitionDesktopClick
Func btnUnhideAllClick()
	; dont bother error checking here -- there will be failures on some because the partitions won't be present.
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /-HIDE /P:1 /Y", "X:\", @SW_HIDE)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /-HIDE /P:2 /Y", "X:\", @SW_HIDE)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /-HIDE /P:3 /Y", "X:\", @SW_HIDE)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /-HIDE /P:4 /Y", "X:\", @SW_HIDE)
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /-HIDE /P:0 /Y", "X:\", @SW_HIDE)
	MsgBox(0, "Notice", "Done!")
EndFunc   ;==>btnUnhideAllClick
Func btnWipeDiskDODClick()
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /DISKWIPE /CUSTOM:3 /Y", "X:\", @SW_SHOWNORMAL)
EndFunc   ;==>btnWipeDiskDODClick
Func btnDiskWipe1Click()
	Run("X:\Program Files\Ghost\gdisk32.exe 1 /DEL /ALL", "X:\", @SW_SHOWNORMAL)
EndFunc   ;==>btnDiskWipe1Click
Func txtBCDDriveChange()

EndFunc   ;==>txtBCDDriveChange

Func btnRunExplorerClick()
	Run("X:\Program Files\ExplorerPlusPlus\Explorer++.exe", "X:\", @SW_SHOWNORMAL)
EndFunc   ;==>btnRunExplorerClick

Func btnRebootClick()
	;
	If MsgBox(16 + 4 + 256, "Confirm", "Do you really wish to reboot?") = 6 Then
		Run("wpeutil reboot")
	Else
		Return 0
	EndIf
EndFunc
Func txtCFSGhostSessionNameChange()

EndFunc   ;==>txtCFSGhostSessionNameChange
Func txtCFTGhostSessionNameChange()

EndFunc   ;==>txtCFTGhostSessionNameChange
Func txtDesktopSessionChange()

EndFunc   ;==>txtDesktopSessionChange