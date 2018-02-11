#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=RES\favicon.ico
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze1.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze2.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze3.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze4.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze5.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze6.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze7.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze8.JPG, RT_RCDATA
;#AutoIt3Wrapper_Res_File_Add=.\RES\Maze9.JPG, RT_RCDATA
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


#Region - Default Includes
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <GuiTab.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPIRes.au3>
#include <Array.au3>
#EndRegion


#Region - KTANEDT Custom Includes
#include <01_Wires_UI.au3>
#include <02_The_Button_UI.au3>
#include <03_Keypads_UI.au3>
#include <04_Simon_Says_UI.au3>
#include <05_Whos_on_First_UI.au3>
#include <06_Memory_UI.au3>
#include <07_Morse_Code_UI.au3>
#include <08_Complicated_Wires_UI.au3>
#include <09_Wire_Sequences_UI.au3>
#include <10_Mazes_UI.au3>
#include <11_Passwords_UI.au3>
#EndRegion


#Region - Variables and Constants
Global $aGUI["hwnd|id"]
Global Enum $idTabCtrl = 1, $idGUILast
ReDim $aGUI[$idGUILast]
Global $aTabs[] = ["Wires","TheButton","Keypads","SimonSays","WhosOnFirst","Memory","MorseCode","ComplicatedWires","WireSequences","Mazes","Passwords"]
;_ArraySort($aTabs)
#EndRegion


#Region - Main
	Opt("GUIOnEventMode",1)
	Opt("GUICloseOnESC", 0)

	_CreateGUI()
	_Wires_TabEvent()

	While 1
		Sleep(10)
	WEnd
#EndRegion


#Region - Functions
Func _CreateGUI()
	GUICreate("KTANE_Defuser_Toolkit", 815, 437)
	$aGUI[$idTabCtrl] = GUICtrlCreateTab(24, 16, 761, 401)
	GUICtrlSetOnEvent(-1, "_GUI_EventHandler")
	For $iTab = 0 to UBound($aTabs) -1
		Execute("_" & $aTabs[$iTab] & "_UI_Create()")
	Next
	GUICtrlCreateTabItem("")
	GUISetOnEvent($GUI_EVENT_CLOSE, "_GUI_EventHandler")
	GUISetState(@SW_SHOW)
	GUIRegisterMsg($WM_COMMAND, "_WM_COMMAND")
EndFunc

Func _GUI_EventHandler()
	Select
        Case @GUI_CtrlId = $GUI_EVENT_CLOSE
            GUIDelete()
            Exit
		Case $aGUI[$idTabCtrl]
			Local $iActiveTabIndex = GUICtrlRead($aGUI[$idTabCtrl])
			$i = Execute("_" & $aTabs[$iActiveTabIndex] & "_TabEvent()")
	EndSelect
EndFunc

Func _Tab_Move($iMove)
	Local $iTabCount = _GUICtrlTab_GetItemCount($aGUI[$idTabCtrl])
	Local $iActiveTabIndex = _GUICtrlTab_GetCurFocus($aGUI[$idTabCtrl])
	;Switch $iMove
	;	Case $iMove = 1
			If $iActiveTabIndex + $iMove = $iTabCount Then
				$iMove = 0
			ElseIf $iActiveTabIndex + $iMove < 0 Then
				$iMove = $iTabCount - 1
			Else
				$iMove = $iActiveTabIndex + $iMove
			EndIf
	;	Case $iMove = -1

	;EndSwitch
	_GUICtrlTab_SetCurFocus($aGUI[$idTabCtrl],$iMove)
EndFunc

Func _WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	Local $idFrom = BitAND($wParam, 0xFFFF)
	Local $iCode = BitShift($wParam, 16)
	If _WinAPI_GetClassName($lParam) = "Edit" Then
		If $iCode = $EN_UPDATE Then
			Switch $idFrom
				Case $aMemoryUI[$idInputMemoryDisplayNumber] To $aMemoryUI[$idInputMemoryNumber4]
					Return GUICtrlSetState($idFrom + 1, $GUI_FOCUS)
				Case $aPasswordsUI[$idInputPasswords00] To $aPasswordsUI[$idInputPasswords45]
					Return GUICtrlSetState($idFrom + 1, $GUI_FOCUS)
			EndSwitch
		EndIf
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc
#EndRegion
