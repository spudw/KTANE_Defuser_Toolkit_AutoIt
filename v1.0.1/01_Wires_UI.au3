#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <01_Wires.au3>

Global $aWiresUI[1] = ["hwnd|id"]
Global Enum $idBtnWiresRED = 1, $idBtnWiresBLUE, $idBtnWiresYELLOW, $idBtnWiresBLACK, $idBtnWiresWHITE, $idLblWiresSerialQuestion, _
		$idBtnWiresSerialQuestionYes, $idBtnWiresSerialQuestionNo, $idBtnWiresReset, $idLblWiresSolution, $idLblWiresCount, $idWiresLast
ReDim $aWiresUI[$idWiresLast]
Global Const $WIRES_MSG_COUNT = "Number of Wires Input: "

Func _Wires_UI_Create()
	GUICtrlCreateTabItem("Wires")
	GUICtrlSetOnEvent(-1, "_Wires_EventHandler")
	GUICtrlCreateGroup("Enter the Wire Colors in Order from Top to Bottom", 64, 136, 481, 67, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	$aWiresUI[$idBtnWiresRED] = _Wires_UI_Create_Button("&RED", 84, 160, 81, 33, 0xFF0000, 0xFFFFFF)
	$aWiresUI[$idBtnWiresBLUE] = _Wires_UI_Create_Button("&BLUE", 175, 160, 81, 33, 0x0000FF, 0xFFFFFF)
	$aWiresUI[$idBtnWiresYELLOW] = _Wires_UI_Create_Button("&YELLOW", 265, 160, 81, 33, 0xFFFF00)
	$aWiresUI[$idBtnWiresBLACK] = _Wires_UI_Create_Button("BLAC&K", 444, 160, 81, 33, 0x000000, 0xFFFFFF)
	$aWiresUI[$idBtnWiresWHITE] = _Wires_UI_Create_Button("&WHITE", 354, 160, 81, 33, 0xFFFFFF)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aWiresUI[$idLblWiresSerialQuestion] = GUICtrlCreateLabel("Is the last digit of the Serial Number Odd?", 128, 226, 262, 22)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetState(-1, $GUI_HIDE)
	$aWiresUI[$idBtnWiresSerialQuestionYes] = _Wires_UI_Create_Button("Y&es", 400, 223, 49, 25)
	GUICtrlSetState(-1, $GUI_HIDE)
	$aWiresUI[$idBtnWiresSerialQuestionNo] = _Wires_UI_Create_Button("&No", 456, 223, 49, 25)
	GUICtrlSetState(-1, $GUI_HIDE)
	$aWiresUI[$idBtnWiresReset] = _Wires_UI_Create_Button("Reset (Esc)", 504, 48, 73, 25)
	$aWiresUI[$idLblWiresSolution] = GUICtrlCreateLabel("Solution Text", 64, 261, 481, 37, $SS_CENTER)
	GUICtrlSetFont(-1, 20, 400, 4, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetState(-1, $GUI_HIDE)
	$aWiresUI[$idLblWiresCount] = GUICtrlCreateLabel($WIRES_MSG_COUNT & "0", 64, 106, 481, 20, $SS_CENTER)
	GUICtrlSetFont(-1, 11, 800, 0, "Calibri")
EndFunc   ;==>_Wires_UI_Create

Func _Wires_UI_Create_Button($sLabel, $iLeft, $iTop, $iWidth, $iHeight, $iBackColor = Default, $iForeColor = Default)
	Local $idBtnID = GUICtrlCreateButton($sLabel, $iLeft, $iTop, $iWidth, $iHeight)
	GUICtrlSetOnEvent(-1, "_Wires_EventHandler")
	If $iForeColor <> Default Then GUICtrlSetColor(-1, $iForeColor)
	If $iBackColor <> Default Then GUICtrlSetBkColor(-1, $iBackColor)
	GUICtrlSetCursor(-1, 0)
	Return $idBtnID
EndFunc

Func _Wires_EventHandler()
	Switch @GUI_CtrlId
		Case $aWiresUI[$idBtnWiresBLACK]
			_Wires_BlackButton()
		Case $aWiresUI[$idBtnWiresBLUE]
			_Wires_BlueButton()
		Case $aWiresUI[$idBtnWiresRED]
			_Wires_RedButton()
		Case $aWiresUI[$idBtnWiresReset]
			_Wires_ResetButton()
		Case $aWiresUI[$idBtnWiresSerialQuestionNo]
			_Wires_SerialNoButton()
		Case $aWiresUI[$idBtnWiresSerialQuestionYes]
			_Wires_SerialYesButton()
		Case $aWiresUI[$idBtnWiresWHITE]
			_Wires_WhiteButton()
		Case $aWiresUI[$idBtnWiresYELLOW]
			_Wires_YellowButton()
	EndSwitch
EndFunc   ;==>_Wires_EventHandler

Func _Wires_TabEvent()
	_Wires_SetHotKeys()
EndFunc   ;==>_Wires_TabEvent

Func _Wires_UI_Reset()
	$sWiresWireSequence = ""
	$sWiresSerialOdd = ""
	_Wires_Show_Serial_Question(False)
	_Wires_Show_Solution(False)
	_Wires_Enable_Buttons()
	_Wires_Update_Count(0)
EndFunc   ;==>_Wires_UI_Reset

Func _Wires_BlackButton()
	$sWiresWireSequence &= "K"
	$sWiresSerialOdd = ""
	_Wires_EvalWires()
EndFunc   ;==>_Wires_BlackButton

Func _Wires_BlueButton()
	$sWiresWireSequence &= "B"
	$sWiresSerialOdd = ""
	_Wires_EvalWires()
EndFunc   ;==>_Wires_BlueButton

Func _Wires_RedButton()
	$sWiresWireSequence &= "R"
	$sWiresSerialOdd = ""
	_Wires_EvalWires()
EndFunc   ;==>_Wires_RedButton

Func _Wires_WhiteButton()
	$sWiresWireSequence &= "W"
	$sWiresSerialOdd = ""
	_Wires_EvalWires()
EndFunc   ;==>_Wires_WhiteButton

Func _Wires_YellowButton()
	$sWiresWireSequence &= "Y"
	$sWiresSerialOdd = ""
	_Wires_EvalWires()
EndFunc   ;==>_Wires_YellowButton

Func _Wires_ResetButton()
	_Wires_UI_Reset()
EndFunc   ;==>_Wires_ResetButton

Func _Wires_SerialNoButton()
	$sWiresSerialOdd = "N"
	_Wires_Show_Serial_Question(False)
	_Wires_EvalWires()
EndFunc   ;==>_Wires_SerialNoButton

Func _Wires_SerialYesButton()
	$sWiresSerialOdd = "Y"
	_Wires_Show_Serial_Question(False)
	_Wires_EvalWires()
EndFunc   ;==>_Wires_SerialYesButton

Func _Wires_Enable_Buttons($iState = $GUI_ENABLE)
	If $iState <> $GUI_ENABLE Then $iState = $GUI_DISABLE
	GUICtrlSetState($aWiresUI[$idBtnWiresRED], $iState)
	GUICtrlSetState($aWiresUI[$idBtnWiresBLUE], $iState)
	GUICtrlSetState($aWiresUI[$idBtnWiresYELLOW], $iState)
	GUICtrlSetState($aWiresUI[$idBtnWiresBLACK], $iState)
	GUICtrlSetState($aWiresUI[$idBtnWiresWHITE], $iState)
EndFunc   ;==>_Wires_Enable_Buttons

Func _Wires_EvalWires()
	Local $iWireStringLength = StringLen($sWiresWireSequence)
	_Wires_Update_Count($iWireStringLength)
	If $iWireStringLength = 6 Then _Wires_Enable_Buttons(0)
	If $iWireStringLength >= 3 Then
		Local $sResult = _Wires_EvaluateWireSequence()
		If $sResult Then
			_Wires_Show_Solution($sResult)
		Else
			_Wires_Show_Serial_Question()
		EndIf
	EndIf
EndFunc   ;==>_Wires_EvalWires

Func _Wires_Show_Serial_Question($iState = $GUI_SHOW)
	If $iState <> $GUI_SHOW Then $iState = $GUI_HIDE
	GUICtrlSetState($aWiresUI[$idLblWiresSerialQuestion], $iState)
	GUICtrlSetState($aWiresUI[$idBtnWiresSerialQuestionNo], $iState)
	GUICtrlSetState($aWiresUI[$idBtnWiresSerialQuestionYes], $iState)
	If $iState = $GUI_SHOW Then _Wires_Show_Solution(False)
EndFunc   ;==>_Wires_Show_Serial_Question

Func _Wires_Show_Solution($sSolution)
	If $sSolution Then
		GUICtrlSetData($aWiresUI[$idLblWiresSolution], $sSolution)
		GUICtrlSetState($aWiresUI[$idLblWiresSolution], $GUI_SHOW)
		_Wires_Show_Serial_Question(False)
		;_Wires_Enable_Buttons(0)
	Else
		GUICtrlSetState($aWiresUI[$idLblWiresSolution], $GUI_HIDE)
	EndIf
EndFunc   ;==>_Wires_Show_Solution

Func _Wires_SetHotKeys()
	Local $aWiresHotKeys[][2] = [["{esc}", $aWiresUI[$idBtnWiresReset]], ["r", $aWiresUI[$idBtnWiresRED]], ["b", $aWiresUI[$idBtnWiresBLUE]], ["k", $aWiresUI[$idBtnWiresBLACK]], _
			["y", $aWiresUI[$idBtnWiresYELLOW]], ["w", $aWiresUI[$idBtnWiresWHITE]], ["e", $aWiresUI[$idBtnWiresSerialQuestionYes]], ["n", $aWiresUI[$idBtnWiresSerialQuestionNo]]]
	GUISetAccelerators($aWiresHotKeys)
EndFunc   ;==>_Wires_SetHotKeys

Func _Wires_Update_Count($iCount)
	GUICtrlSetData($aWiresUI[$idLblWiresCount], $WIRES_MSG_COUNT & $iCount & " " & $sWiresWireSequence)
EndFunc
