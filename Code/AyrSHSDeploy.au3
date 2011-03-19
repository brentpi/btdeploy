#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=Z:\Documents\btdeploy\Program Files\DETA\AyrSHSDeploy.exe
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

; when updating form code. be sure to remove the absolute positioning and just leave:
; $Form1_2 = GUICreate("AyrSHS WinPE Environment", 615, 438)

Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=r:\work\koda\forms\ayrshsdeploy.kxf
$Form1_2 = GUICreate("AyrSHS WinPE Environment", 615, 438)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
$Label1 = GUICtrlCreateLabel(IniRead("X:\Program Files\DETA\Settings.ini", "Main", "GuiMainLabel", "AyrSHS WinPE Environment"), 128, 16, 383, 37)
GUICtrlSetFont(-1, 20, 800, 0, "Tahoma")
$Tab1 = GUICtrlCreateTab(16, 64, 585, 353, $WS_GROUP)
GUICtrlSetResizing(-1, $GUI_DOCKWIDTH+$GUI_DOCKHEIGHT)
$TabSheet1 = GUICtrlCreateTabItem("Computers For Students")
$grpCFSWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 257)
$btnImgCFSWin7 = GUICtrlCreateButton("Image Machine", 48, 264, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnImgCFSWin7Click")
$btnImgCFSPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 304, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnImgCFSPWin7Click")
$radCFSGhost = GUICtrlCreateRadio("Ghost", 48, 136, 113, 17)
$radCFSTorrent = GUICtrlCreateRadio("Torrent", 48, 160, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpSettingsCFS = GUICtrlCreateGroup("Settings", 232, 104, 177, 257)
$Label9 = GUICtrlCreateLabel("Session Name:", 248, 128, 75, 17, $WS_GROUP)
$txtCFSGhostSessionName = GUICtrlCreateInput("", 248, 152, 145, 21, BitOR($ES_AUTOHSCROLL,$WS_GROUP))
GUICtrlSetOnEvent(-1, "txtCFSGhostSessionNameChange")
$Label10 = GUICtrlCreateLabel("OR", 304, 224, 32, 28, $WS_GROUP)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$btnCFSSelectGhostImage = GUICtrlCreateButton("Select Ghost Image", 248, 304, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnCFSSelectGhostImageClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet2 = GUICtrlCreateTabItem("Computers for Teachers")
$grpCFTWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 257)
$btnImgCFTWin7 = GUICtrlCreateButton("Image Machine", 48, 264, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnImgCFTWin7Click")
$btnImgCFTPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 304, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnImgCFTPWin7Click")
$radCFTGhost = GUICtrlCreateRadio("Ghost", 48, 136, 113, 17)
$radCFTTorrent = GUICtrlCreateRadio("Torrent", 48, 160, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Settings", 232, 104, 177, 257)
$Label7 = GUICtrlCreateLabel("Session Name:", 248, 128, 75, 17, $WS_GROUP)
$txtCFTGhostSessionName = GUICtrlCreateInput("", 248, 152, 145, 21, BitOR($ES_AUTOHSCROLL,$WS_GROUP))
GUICtrlSetOnEvent(-1, "txtCFTGhostSessionNameChange")
$Label8 = GUICtrlCreateLabel("OR", 304, 224, 32, 28, $WS_GROUP)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$btnCFTSelectGhostImage = GUICtrlCreateButton("Select Ghost Image", 248, 304, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnCFTSelectGhostImageClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet3 = GUICtrlCreateTabItem("Desktop Machines")
$grpDeskWin7 = GUICtrlCreateGroup("Windows 7", 32, 104, 177, 257)
$btnImgDWin7 = GUICtrlCreateButton("Image Machine", 48, 264, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnImgDWin7Click")
$btnImgDPWin7 = GUICtrlCreateButton("Image Machine -Preserve", 48, 304, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnImgDPWin7Click")
$radDesktopGhost = GUICtrlCreateRadio("Ghost", 48, 136, 113, 17)
$radDesktopTorrent = GUICtrlCreateRadio("Torrent", 48, 160, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpDesktopSettings = GUICtrlCreateGroup("Settings", 232, 104, 177, 257)
$Label5 = GUICtrlCreateLabel("Session Name:", 248, 128, 75, 17, $WS_GROUP)
$txtDesktopSession = GUICtrlCreateInput("", 248, 152, 145, 21, BitOR($ES_AUTOHSCROLL,$WS_GROUP))
GUICtrlSetOnEvent(-1, "txtDesktopSessionChange")
$Label6 = GUICtrlCreateLabel("OR", 304, 224, 32, 28, $WS_GROUP)
GUICtrlSetFont(-1, 16, 400, 0, "MS Sans Serif")
$btnDesktopGhostSelectImage = GUICtrlCreateButton("Select Ghost Image", 248, 304, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnDesktopGhostSelectImageClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$TabSheet4 = GUICtrlCreateTabItem("Utilities")
GUICtrlSetState(-1,$GUI_SHOW)
$Ghost = GUICtrlCreateGroup("Ghost", 32, 104, 177, 73)
$btnRunGhost = GUICtrlCreateButton("Run Ghost32", 48, 128, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnRunGhostClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpBCD = GUICtrlCreateGroup("BCD", 32, 192, 177, 129)
$btnBCDFix = GUICtrlCreateButton("Fix BCD", 48, 272, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnBCDFixClick")
$txtBCDDrive = GUICtrlCreateInput("C", 48, 240, 145, 21, BitOR($ES_AUTOHSCROLL,$WS_GROUP))
GUICtrlSetOnEvent(-1, "txtBCDDriveChange")
$Label2 = GUICtrlCreateLabel("Drive to fix (ex.colon):", 48, 216, 106, 17, $WS_GROUP)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpRunCMD = GUICtrlCreateGroup("Command Line", 224, 104, 177, 73)
$btnRunCmd = GUICtrlCreateButton("Run Command Line", 240, 128, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnRunCmdClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpGDisk = GUICtrlCreateGroup("GDisk", 416, 104, 169, 297)
$btnDiskWipe1 = GUICtrlCreateButton("Wipe Disk 1", 432, 128, 137, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnDiskWipe1Click")
$btnUnhideAll = GUICtrlCreateButton("Unhide All", 432, 168, 137, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnUnhideAllClick")
$btnPartitionCFS = GUICtrlCreateButton("Partition CFS", 432, 208, 137, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnPartitionCFSClick")
$btnPartitionCFT = GUICtrlCreateButton("Partition CFT", 432, 248, 137, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnPartitionCFTClick")
$btnPartitionDesktop = GUICtrlCreateButton("Partition Desktop", 432, 288, 137, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnPartitionDesktopClick")
$btnWipeDiskDOD = GUICtrlCreateButton("Wipe Disk 1 - DOD", 432, 328, 137, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnWipeDiskDODClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpRunExplorer = GUICtrlCreateGroup("Explorer", 32, 328, 177, 73)
$btnRunExplorer = GUICtrlCreateButton("Run Explorer", 48, 352, 145, 33, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnRunExplorerClick")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$grpReboot = GUICtrlCreateGroup("Reboot", 224, 328, 177, 73)
$btnReboot = GUICtrlCreateButton("Reboot", 240, 352, 145, 33, $WS_GROUP)
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

Global Const $strDeploymentHost = IniRead("X:\Program Files\DETA\Settings.ini", "Main", "DeploymentHost", "http://drop.edgiest.net/brent/")
Global Const $strCFSMOEIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFSMOEIndex", "1")
Global Const $strCFSDataIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFSDataIndex", "2")
Global Const $strDesktopMOEIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "DesktopMOEIndex", "1")
Global Const $strDesktopDataIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "DesktopDataIndex", "2")
Global Const $strCFTMOEIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFTMOEIndex", "1")
Global Const $strCFTDataIndex = IniRead("X:\Program Files\DETA\Settings.ini", "ImageX", "CFTDataIndex", "2")
	_DebugReportVar("strDeploymentHost", $strDeploymentHost)
; *******************************************************************

While 1
	Sleep(100)
WEnd

; ****************************************************
; ********** BTDEPLOY - BRENT PICKUP 2011 ************
; ****************************************************
; THIS IS CUSTOMISED FOR MY ENVIRONMENT.  IT WILL NOT
; WORK IN YOURS OUT OF THE BOX. MAYBE.
; ****************************************************
; TODO:
; * Remove all code marked as old without breaking anything.
; * Make everything generic and support most general configs.
; * Look into being able to provide the basics in a zip [inc imagex] -- but not ghost.
; ****************************************************
; ****************************************************
; ****************************************************

Func PartitionMachine($strType, $bEnableOutput = True)
	Local $outDownload, $outPartition

	$outDownload = RunWait("X:\Windows\System32\aria2c.exe --dir=X:\ --file-allocation=none --check-integrity=true --conf=""X:\Program Files\DETA\aria2c.conf"" " & $strDeploymentHost & $strType & "/disk.wipe.txt", "X:\", @SW_SHOWNORMAL)
	If ($outDownload = 0) And (@error <> 0) Then
		If $bEnableOutput Then
			_DebugReport("Download of partition script failed.", True)
		EndIf
		Return 0
	EndIf
	; assume disk partition info is at X:\disk.wipe.txt
	$outPartition = RunWait("diskpart /s X:\disk.wipe.txt", "X:\", @SW_SHOWNORMAL)
	If ($outPartition = 0) And (@error <> 0) Then
		If $bEnableOutput Then
			_DebugReport("Partitioning failed. See diskpart", True)
		EndIf
		Return 0
	EndIf

	If $bEnableOutput Then
		_DebugReport("Successfully partitioned drive.")
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
	; This is the new non-dual boot method.
	Local $outDownload, $outPartition, $outTorrent, $outApplySystem, $outApplyRecovery
	Local $outApplyData, $outApplyHome
	Local $drvSystem, $drvRecovery, $drvData, $outSetPartActive

	If PartitionMachine($strName, False) = 0 Then
		_DebugReport("EraseDownloadApplyWIM: Failed to partition machine.  Check download on server, or presence of gdisk32.")
		;MsgBox(16, "Error!", "Failed to partition machine.  Check download on server, or presence of gdisk32.")
		Return 0
	EndIf

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

	GrabFile($strDeploymentHost & $strName & ".torrent", $drvData)

	; ALL Images will be called "Image.WIM"
	; ie: D:\CFS\Image.WIM

	If FileExists($drvData & $strName & "\Image.WIM") == 0 Then
		; error in torrent DL?
		_DebugReport("EraseDownloadApplyWIM: Image should be at: " & $drvData & $strName & "\Image.WIM but isnt.")
		MsgBox(16, "Error!", "Image does not exist after download.")
		Return 0
	EndIf

	; Apply Image.
	ImageX_Apply($strName, "System")
	ImageX_Apply($strName, "Reserved")
	ImageX_Apply($strName, "Data")

	; This part fixes the BCD.  Merge this code into the BCD Fix function when it is tested and proven mature.  Otherwise revert to old code.
	; hopefully this is more precise.

	RunWaitCheck("bcdboot " & $drvSystem & "Windows /s " & StringLeft($drvSystem, 2), "Error updating MOE BCD")
	; BCDBOOT should be sufficient.  IT runs a 'locate' to find winload, etc on first boot.
	If RunWaitCheck("X:\Windows\System32\bootsect.exe /nt60 SYS /FORCE /MBR", "Failed to write boot sector.") = 0 Then Return 0

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

Func ImageX_Apply($strName, $strPartition)
	;
	ProgressOn("Applying " & $strPartition & " Image", "Work in progress...", "0 percent complete")

	$drvData = FindDriveByLabel("Data")
	_DebugReport("Starting ImageX_Apply for: " & $strPartition)
	Local $foo = Run(@ComSpec & " /c " & "X:\Windows\System32\imagex.exe /apply " & $drvData & $strName & "\Image.WIM " & GetIndexOfWim($strName, $strPartition) & " " & FindDriveByLabel($strPartition), @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	Local $line
	While 1
		$line = StdoutRead($foo)
		If @error Then ExitLoop
		$iPercent = Number(StringRegExpReplace($line, "[\[\] %]", ""))
		$arrTimeRem = _StringBetween($line, "progress: ", " remaining")
		; should only be one result.
		If IsArray($arrTimeRem) = 1 Then
			ProgressSet($iPercent, $iPercent & "% complete - " & $arrTimeRem[0] & " remaining.")
		EndIf
	Wend

	_DebugReport("Destroyed progress for: " & $strPartition)
	ProgressOff()
EndFunc

Func GetIndexOfWim($strName, $strPartition)
	; standard config is System:1 Data:2
	Switch $strName
	Case "CFS"
		Switch $strPartition
		Case "System"
			Return $strCFSMOEIndex
		Case "Data"
			Return $strCFSDataIndex
		EndSwitch
	Case "Desktop"
		Switch $strPartition
		Case "System"
			Return $strDesktopMOEIndex
		Case "Data"
			Return $strDesktopDataIndex
		EndSwitch
	Case "CFT"
		Switch $strPartition
		Case "System"
			Return $strCFTMOEIndex
		Case "Data"
			Return $strCFTDataIndex
		EndSwitch
	EndSwitch
EndFunc

Func GrabFile($strURL, $strOut)
	ProgressOn("Downloading " & $strURL, "Work in progress...", "0 percent complete")

	Local $foo = Run(@ComSpec & " /c " & "X:\Windows\System32\aria2c.exe --dir=" & $strOut & " --file-allocation=none --check-integrity=true --conf=""X:\Program Files\DETA\aria2c.conf"" " & $strURL, $strOut, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	Local $line
	Local $tSeedMin = 0
	While 1
		$line = StdoutRead($foo)
		If @error Then ExitLoop
		$arrPercent = _StringBetween($line, "MiB(", ") ")
		$arrTimeLeft = _StringBetween($line, "ETA:", "]")

		If StringInStr($line, "Seeding") Then
			;
			ProgressSet(100, "100% complete - seeding for 5 min...")
		EndIf

		If (IsArray($arrPercent) = 1) And (IsArray($arrTimeLeft) = 1) Then
			; set progress.
			ProgressSet(Number($arrPercent[0]), Number($arrPercent[0]) & "% complete - " & $arrTimeLeft[0] & " remaining.")
		EndIf
	Wend

	_DebugReport("Destroyed progress for: " & $strURL)
	ProgressOff()
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

Func FixBCDDrive($strDrive, $bFixSector)
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
		$outBootSect = RunWait("X:\Windows\System32\bootsect.exe /nt60 " & $strLetter & ":\ /MBR /FORCE", "X:\", @SW_SHOWNORMAL)
	Else
		$outBootSect = RunWait("X:\Windows\System32\bootsect.exe /nt60 " & $strLetter & ":\ /FORCE", "X:\", @SW_SHOWNORMAL)
	EndIf
	If $outBootSect == 0 Then
		MsgBox(0, "Error!", "Failed to fix boot sector")
		Return 0
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
	FixBCDDrive($strLetter, True)

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

	If $bGhost = True Then
		; do our ghosty stuff.
		;
		If $strSessionName = "" Then Return 0
		If $fnVar <> "" Then
			RunWaitCheck("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnVar & ",dst=1", "Ghosting failed. Refer to Ghosterr.txt.")
		Else
			RunWaitCheck("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "Ghosting failed. Refer to Ghosterr.txt.")
		EndIf
	ElseIf $bTorrent = True Then
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