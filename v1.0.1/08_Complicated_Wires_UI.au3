#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <08_Complicated_Wires.au3>

Global $aComplicatedWiresUI[1] = ["hwnd|id"]
Global Enum $idBtnComplicatedWiresRED = 1, $idBtnComplicatedWiresBLUE, $idBtnComplicatedWiresLED, $idBtnComplicatedWiresSTAR, _
	$idBtnComplicatedWiresSubmit, $idBtnComplicatedWiresReset, $idLblComplicatedWiresSolution, $idComplicatedWiresLast
ReDim $aComplicatedWiresUI[$idComplicatedWiresLast]
Global $sComplicatedWiresValue = ""

Func _ComplicatedWires_UI_Create()
	GUICtrlCreateTabItem("Complicated Wires")
	GUICtrlCreateGroup("Enter the Details of Each Wire", 64, 112, 481, 147, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aComplicatedWiresUI[$idBtnComplicatedWiresRED] = GUICtrlCreateButton("&RED", 172, 136, 81, 33)
	GUICtrlSetOnEvent(-1, "_ComplicatedWires_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0xFF0000)
	GUICtrlSetCursor(-1, 0)
	$aComplicatedWiresUI[$idBtnComplicatedWiresBLUE] = GUICtrlCreateButton("&BLUE", 172, 176, 81, 33)
	GUICtrlSetOnEvent(-1, "_ComplicatedWires_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0x0000FF)
	GUICtrlSetCursor(-1, 0)
	$aComplicatedWiresUI[$idBtnComplicatedWiresLED] = GUICtrlCreateButton("&LED", 356, 136, 81, 33)
	GUICtrlSetOnEvent(-1, "_ComplicatedWires_EventHandler")
	GUICtrlSetCursor(-1, 0)
	$aComplicatedWiresUI[$idBtnComplicatedWiresSTAR] = GUICtrlCreateButton("&STAR", 356, 176, 81, 33)
	GUICtrlSetOnEvent(-1, "_ComplicatedWires_EventHandler")
	GUICtrlSetCursor(-1, 0)
	$aComplicatedWiresUI[$idBtnComplicatedWiresSubmit] = GUICtrlCreateButton("Submit", 256, 224, 97, 25, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetOnEvent(-1, "_ComplicatedWires_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 4, "Calibri")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aComplicatedWiresUI[$idLblComplicatedWiresSolution] = GUICtrlCreateLabel("", 44, 271, 501, 37, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 400, 4, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aComplicatedWiresUI[$idBtnComplicatedWiresReset] = GUICtrlCreateButton("Reset (Esc)", 504, 48, 73, 25)
	GUICtrlSetOnEvent(-1, "_ComplicatedWires_EventHandler")
	GUICtrlSetCursor(-1, 0)
EndFunc   ;==>_ComplicatedWires_UI_Create

Func _ComplicatedWires_TabEvent()
	_ComplicatedWires_SetHotKeys()
EndFunc

Func _ComplicatedWires_EventHandler()
	Switch @GUI_CtrlId
		Case $aComplicatedWiresUI[$idBtnComplicatedWiresReset]
			_ComplicatedWires_UI_Reset()
		Case $aComplicatedWiresUI[$idBtnComplicatedWiresBLUE]
			If Not StringInstr($sComplicatedWiresValue,"B") Then $sComplicatedWiresValue &= "B"
			GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresBLUE], $GUI_DISABLE)
		Case $aComplicatedWiresUI[$idBtnComplicatedWiresRED]
			If Not StringInstr($sComplicatedWiresValue,"R") Then $sComplicatedWiresValue &= "R"
			GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresRED], $GUI_DISABLE)
		Case $aComplicatedWiresUI[$idBtnComplicatedWiresLED]
			If Not StringInstr($sComplicatedWiresValue,"L") Then $sComplicatedWiresValue &= "L"
			GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresLED], $GUI_DISABLE)
		Case $aComplicatedWiresUI[$idBtnComplicatedWiresSTAR]
			If Not StringInstr($sComplicatedWiresValue,"S") Then $sComplicatedWiresValue &= "S"
			GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresSTAR], $GUI_DISABLE)
		Case $aComplicatedWiresUI[$idBtnComplicatedWiresSubmit]
			_ComplicatedWires_Show_Solution(_ComplicatedWires_Eval($sComplicatedWiresValue))
	EndSwitch
EndFunc

Func _ComplicatedWires_SetHotKeys()
	Local $aComplicatedWiresHotKeys[][2] = [["{esc}", $aComplicatedWiresUI[$idBtnComplicatedWiresReset]], ["r", $aComplicatedWiresUI[$idBtnComplicatedWiresRED]], _
		["b", $aComplicatedWiresUI[$idBtnComplicatedWiresBLUE]], ["s", $aComplicatedWiresUI[$idBtnComplicatedWiresSTAR]], ["l", $aComplicatedWiresUI[$idBtnComplicatedWiresLED]], _
		["{enter}", $aComplicatedWiresUI[$idBtnComplicatedWiresSubmit]]]
	GUISetAccelerators($aComplicatedWiresHotKeys)
EndFunc

Func _ComplicatedWires_UI_Reset()
	$sComplicatedWiresValue = ""
	_ComplicatedWires_Show_Solution("")
	_ComplicatedWires_EnableAllButtons()
EndFunc

Func _ComplicatedWires_Show_Solution($sString)
	GUICtrlSetData($aComplicatedWiresUI[$idLblComplicatedWiresSolution],$sString)
	$sComplicatedWiresValue = ""
EndFunc

Func _ComplicatedWires_EnableAllButtons()
	GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresBLUE], $GUI_ENABLE)
	GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresRED], $GUI_ENABLE)
	GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresLED], $GUI_ENABLE)
	GUICtrlSetState($aComplicatedWiresUI[$idBtnComplicatedWiresSTAR], $GUI_ENABLE)
EndFunc
