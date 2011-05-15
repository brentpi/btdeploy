#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
Opt("GUIOnEventMode", 1)
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Build Switcher", 352, 217, 192, 124)
GUISetOnEvent($GUI_EVENT_CLOSE, "Form1Close")
GUISetOnEvent($GUI_EVENT_MINIMIZE, "Form1Minimize")
GUISetOnEvent($GUI_EVENT_MAXIMIZE, "Form1Maximize")
GUISetOnEvent($GUI_EVENT_RESTORE, "Form1Restore")
$btnCFS = GUICtrlCreateButton("CFS", 64, 24, 217, 41, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnCFSClick")
$btnCFT = GUICtrlCreateButton("CFT", 64, 79, 217, 41, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnCFTClick")
$btnDesktop = GUICtrlCreateButton("Desktop", 63, 134, 217, 41, $WS_GROUP)
GUICtrlSetOnEvent(-1, "btnDesktopClick")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	Sleep(100)
WEnd

Func btnCFSClick()
	SwitchBuild("CFS")
	MsgBox(0, "Notice", "Switched Build Type to CFS", 10)
EndFunc
Func btnCFTClick()
	SwitchBuild("CFT")
	MsgBox(0, "Notice", "Switched Build Type to CFT", 10)
EndFunc
Func btnDesktopClick()
	SwitchBuild("WIM")
	MsgBox(0, "Notice", "Switched Build Type to Desktop", 10)
EndFunc
Func Form1Close()
Exit(0)
EndFunc
Func Form1Maximize()

EndFunc
Func Form1Minimize()

EndFunc
Func Form1Restore()

EndFunc
Func SwitchBuild($strBuild)
	If FileExists("C:\" & $strBuild & "Build") Then
		Local $outCmd
		$outCmd = RegWrite("HKLM\Software\SOE", "Build identifier", "REG_SZ", $strBuild)
		If $outCmd = 1 Then
			; move builder.
			DirMove("C:\Build", "C:\Build.old", 1)
			DirMove("C:\" & $strBuild & "Build", "C:\Build", 1)
		EndIf
	Else
		MsgBox(4096, "Error", "Joiner for workstation type wasn't found.  Must already be that type.")
	EndIf
	Run("C:\Build\wksJoiner.exe")
EndFunc