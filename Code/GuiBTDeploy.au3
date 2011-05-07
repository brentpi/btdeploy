#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=Y:\Documents\btdeploy\Program Files\DETA\AyrSHSDeploy.exe
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
#include "LibBTDeploy.au3"

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

_DebugSetup("BTDeploy Debug Output", True)
_DebugReportVar("strDeploymentHost", $strDeploymentHost)

While 1
	Sleep(100)
WEnd

; ****************************************************
; ********** BTDEPLOY - BRENT PICKUP 2011 ************
; ****************************************************
; Note: all of this is customised for my environment (by default)
; most changes you need to get it to work in yours are able
; to be made by editing the ini file in "\Program Files\DETA\" on the WIM.
; If you want to adjust the "Seed time", just change the aria2c.conf.
; There is no "hardcoded" value in this script.
; ****************************************************
; TODO:
; * Remove all code marked as old without breaking anything.
; * Make everything generic and support most general configs.
; * Look into being able to provide the basics in a zip [inc imagex] -- but not ghost.
; ****************************************************
; ****************************************************
; ****************************************************

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
			RunWaitCheck("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=" & $fnVar & ",dst=1", "Ghosting failed. Refer to X:\Ghosterr.txt.")
		Else
			RunWaitCheck("X:\Program Files\Ghost\Ghost32.exe -BATCH -CLONE,mode=RESTORE,src=@MC" & $strSessionName & ",dst=1", "Ghosting failed. Refer to X:\Ghosterr.txt.")
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