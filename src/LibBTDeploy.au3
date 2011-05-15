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
#include <Misc.au3>

Global $arrAlphabet[26] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
Global Const $strDeploymentHost = IniRead("X:\Program Files\BTDeploy\Settings.ini", "Main", "DeploymentHost", "")
Global Const $strCFSMOEIndex = IniRead("X:\Program Files\BTDeploy\Settings.ini", "ImageX", "CFSMOEIndex", "1")
Global Const $strCFSDataIndex = IniRead("X:\Program Files\BTDeploy\Settings.ini", "ImageX", "CFSDataIndex", "2")
Global Const $strDesktopMOEIndex = IniRead("X:\Program Files\BTDeploy\Settings.ini", "ImageX", "DesktopMOEIndex", "1")
Global Const $strDesktopDataIndex = IniRead("X:\Program Files\BTDeploy\Settings.ini", "ImageX", "DesktopDataIndex", "2")
Global Const $strCFTMOEIndex = IniRead("X:\Program Files\BTDeploy\Settings.ini", "ImageX", "CFTMOEIndex", "1")
Global Const $strCFTDataIndex = IniRead("X:\Program Files\BTDeploy\Settings.ini", "ImageX", "CFTDataIndex", "2")
Global Const $strRebootOnCompletion = IniRead("X:\Program Files\BTDeploy\Settings.ini", "Main", "RebootOnCompletion", "No")

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

Func PartitionMachine($strType, $bEnableOutput = True)
	Local $outDownload, $outPartition

	$outDownload = RunWait("X:\Windows\System32\aria2c.exe --dir=X:\ --file-allocation=none --check-integrity=true --conf=""X:\Program Files\BTDeploy\aria2c.conf"" " & $strDeploymentHost & $strType & "/disk.wipe.txt", "X:\", @SW_SHOWNORMAL)
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

	If $bPreserve = False Then
		; if we don't want to preserve D:
		If PartitionMachine($strName, False) = 0 Then
			_DebugReport("EraseDownloadApplyWIM: Failed to partition machine.  Check download on server, or presence of gdisk32.")
			Return 0
		EndIf
	EndIf

	$drvSystem = FindDriveByLabel("System")
	$drvData = FindDriveByLabel("Data")
	$drvRecovery = FindDriveByLabel("Reserved")
	; no longer "recovery" really... it's the BCD partition as defined by microsoft.
	; it used to be my custom recovery part in dual boot.
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
	; checks to see if output of "imagex /info" contains <NAME>Data.
	; you can apply it to System as well.
	If ImageX_Check($strName, "Data") = 1 Then
		_DebugReport("Data Image present and applying.")
		ImageX_Apply($strName, "Data")
	EndIf

	; This part handles our bootloader.  Some notes:
	; - Possibly breaks BitLocker -- though, dont think youd want to use it on a Desktop/CFS/CFT anyway.
	; - Right way to do it according to microsoft.
	; - OVERWRITES the boot sector on the "SYSTEM" partition (determined by the setup) to one of Windows Vista/7
	; - Runs BCDBoot to copy BOOTMGR into place and configure it.

	If RunWaitCheck("X:\Windows\System32\bootsect.exe /nt60 SYS /FORCE /MBR", "Failed to write boot sector.") = 0 Then Return 0
	RunWaitCheck("X:\Windows\System32\bcdboot.exe " & $drvSystem & "Windows /l en-au", "Error updating BCD")

	; This should work for all DETA image types.  Contact me if it doesnt. bpick36@eq.edu.au
	If FileExists($drvSystem & "Build") Or FileExists($drvSystem & "CFSBuild") Then
		_DebugReport("EraseDownloadApplyWIM: Successfully Imaged Drive!")
		MsgBox(0, "Success!", "Imaged Drive!", 20)
		DirRemove($drvData & $strName, True)
		DirRemove($drvData & ".aria2", True)
		FileDelete($drvData & $strName & ".torrent")
		If $strRebootOnCompletion = "Yes" Then
			Shutdown(6) ; force a reboot.  codes 2+4
		EndIf
		Return 1
	Else
		DirRemove($drvData & $strName, True)
		DirRemove($drvData & ".aria2", True)
		FileDelete($drvData & $strName & ".torrent")
		_DebugReport("EraseDownloadApplyWIM: Something went wrong.  Check this log.")
		MsgBox(16, "Error.", "Somethings wrong -- please check the log for info.")
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

Func ImageX_Check($strName, $strPartition)
	;
	$drvData = FindDriveByLabel("Data")
	_DebugReport("Checking Image for: " & $strPartition)
	Local $foo = Run(@ComSpec & " /c " & "X:\Windows\System32\imagex.exe /info " & $drvData & $strName & "\Image.WIM ", @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	Local $line
	While 1
		$line = StdoutRead($foo)
		If @error Then ExitLoop
		If StringInStr($line, "<NAME>" & $strPartition, 0) Then Return 1
	Wend

	_DebugReport("Partition not present in image: " & $strPartition)
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

	Local $foo = Run(@ComSpec & " /c " & "X:\Windows\System32\aria2c.exe --dir=" & $strOut & " --file-allocation=none --check-integrity=true --conf=""X:\Program Files\BTDeploy\aria2c.conf"" " & $strURL, $strOut, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
	Local $line
	Local $tSeedMin = 0
	$dll = DllOpen("user32.dll")
	
	While 1
		$line = StdoutRead($foo)
		If @error Then ExitLoop
		$arrPercent = _StringBetween($line, "MiB(", ") ")
		$arrTimeLeft = _StringBetween($line, "ETA:", "]")

		If StringInStr($line, "Seeding") Then
			;
			If (_IsPressed(43, $dll)) Then
				$ariaPID = ProcessExists("aria2c.exe")
				If $ariaPID Then ProcessClose($ariaPID)
			EndIf
			ProgressSet(100, "100% complete - seeding for 5 min...")
		EndIf

		If (IsArray($arrPercent) = 1) And (IsArray($arrTimeLeft) = 1) Then
			; set progress.
			ProgressSet(Number($arrPercent[0]), Number($arrPercent[0]) & "% complete - " & $arrTimeLeft[0] & " remaining.")
		EndIf
	Wend

	DllClose($dll)
	_DebugReport("Destroyed progress for: " & $strURL)
	ProgressOff()
EndFunc

Func CreateBCDStore($strDrive)
	; *********************
	; *** THIS IS HERE FOR ARCHIVAL PURPOSES.
	; *********************
	; This function isn't used anymore, but it's still here because it took so long to create and fine
	; tune.  So, i'm leaving it in the hope that it might help someone else in the future.
	; ---
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
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} path \Windows\system32\winload.exe", "Failed to set winload path.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} systemroot \Windows", "Failed to set windows path.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} locale en-US", "Failed to set locale - osloader.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /set {" & $bcdGuid & "} recoveryenabled No", "Failed to set recovery disabled. - osloader.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /displayorder {" & $bcdGuid & "}", "Failed to set display order.", $strDrive & "Windows\System32") = 0 Then Return 0
	If RunWaitCheck("bcdedit /store " & $strDrive & "Boot\BCD /default {" & $bcdGuid & "}", "Failed to set default.", $strDrive & "Windows\System32") = 0 Then Return 0
	Return 1
EndFunc   ;==>CreateBCDStore