#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <02_The_Button.au3>

Global $aTheButtonUI[1] = ["hwnd|id"]
Global Enum $idBtnTheButtonColorBLUE = 1, $idBtnTheButtonColorRED, $idBtnTheButtonColorWHITE, $idBtnTheButtonColorYELLOW, _
	$idBtnTheButtonIndicatorBLUE, $idBtnTheButtonIndicatorOTHER, $idBtnTheButtonIndicatorYELLOW, $idBtnTheButtonReset, $idGrpTheButton, _
	$idBtnTheButtonTextABORT, $idBtnTheButtonTextDETONATE, $idBtnTheButtonTextHOLD, $idBtnTheButtonTextPRESS, $idLblTheButtonSolution, $idTheButtonLast
ReDim $aTheButtonUI[$idTheButtonLast]
Global Enum Step *2 $THEBUTTON_BLUE, $THEBUTTON_RED, $THEBUTTON_WHITE, $THEBUTTON_YELLOW
Global Enum Step *2 $THEBUTTON_ABORT, $THEBUTTON_DETONATE, $THEBUTTON_HOLD, $THEBUTTON_PRESS
Global Enum Step *2 $THEBUTTON_BLUE_INDICATOR, $THEBUTTON_OTHER_INDICATOR, $THEBUTTON_YELLOW_INDICATOR
Global Static $THEBUTTON_MSG_GROUP_DEFAULT = "Enter the Color and Text of the Button"
Global Static $THEBUTTON_MSG_INDICATOR_COLOR = "What is the Color of the Lit Indicator?"
Global Enum $THEBUTTON_HOTKEYS_DEFAULT = 1, $THEBUTTON_HOTKEYS_INDICATORS

Func _TheButton_UI_Create()
	GUICtrlCreateTabItem("The Button")
	$aTheButtonUI[$idGrpTheButton] = GUICtrlCreateGroup($THEBUTTON_MSG_GROUP_DEFAULT, 164, 94, 481, 195, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aTheButtonUI[$idBtnTheButtonColorWHITE] = _TheButton_UI_Create_Button("&WHITE", 224, 119, 81, 33, 0xFFFFFF, 0x000000)
	$aTheButtonUI[$idBtnTheButtonColorBLUE] = _TheButton_UI_Create_Button("&BLUE", 224, 159, 81, 33, 0x0000FF, 0xFFFFFF)
	$aTheButtonUI[$idBtnTheButtonColorYELLOW] = _TheButton_UI_Create_Button("&YELLOW", 224, 199, 81, 33, 0xFFFF00)
	$aTheButtonUI[$idBtnTheButtonColorRED] = _TheButton_UI_Create_Button("&RED", 224, 239, 81, 33, 0xFF0000, 0xFFFFFF)
	$aTheButtonUI[$idBtnTheButtonTextPRESS] = _TheButton_UI_Create_Button("&PRESS", 504, 119, 81, 33)
	$aTheButtonUI[$idBtnTheButtonTextHOLD] = _TheButton_UI_Create_Button("&HOLD", 504, 159, 81, 33)
	$aTheButtonUI[$idBtnTheButtonTextDETONATE] = _TheButton_UI_Create_Button("&DETONATE", 504, 199, 81, 33)
	$aTheButtonUI[$idBtnTheButtonTextABORT] = _TheButton_UI_Create_Button("&ABORT", 504, 239, 81, 33)
	$aTheButtonUI[$idBtnTheButtonIndicatorBLUE] = _TheButton_UI_Create_Button("&BLUE", 368, 143, 81, 33, 0x0000FF, 0xFFFFFF)
	GUICtrlSetState(-1, $GUI_HIDE)
	$aTheButtonUI[$idBtnTheButtonIndicatorYELLOW] = _TheButton_UI_Create_Button("&YELLOW", 368, 183, 81, 33, 0xFFFF00)
	GUICtrlSetState(-1, $GUI_HIDE)
	$aTheButtonUI[$idBtnTheButtonIndicatorOTHER] = _TheButton_UI_Create_Button("&OTHER", 368, 223, 81, 33)
	GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aTheButtonUI[$idLblTheButtonSolution] = GUICtrlCreateLabel("", 194, 303, 431, 57, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 400, 4, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aTheButtonUI[$idBtnTheButtonReset] = _TheButton_UI_Create_Button("Reset (Esc)", 700, 48, 73, 25)
EndFunc   ;==>_TheButton_UI_Create

Func _TheButton_UI_Create_Button($sLabel, $iLeft, $iTop, $iWidth, $iHeight, $iBackColor = Default, $iForeColor = Default)
	Local $idBtnID = GUICtrlCreateButton($sLabel, $iLeft, $iTop, $iWidth, $iHeight)
	GUICtrlSetOnEvent(-1, "_TheButton_EventHandler")
	If $iForeColor <> Default Then GUICtrlSetColor(-1, $iForeColor)
	If $iBackColor <> Default Then GUICtrlSetBkColor(-1, $iBackColor)
	GUICtrlSetCursor(-1, 0)
	Return $idBtnID
EndFunc

Func _TheButton_TabEvent()
	_TheButton_SetHotKeys($THEBUTTON_HOTKEYS_DEFAULT)
EndFunc

Func _TheButton_EventHandler()
	Switch @GUI_CtrlId
		Case $aTheButtonUI[$idBtnTheButtonColorBLUE]
			_TheButton_Blue_Button()
		Case $aTheButtonUI[$idBtnTheButtonColorRED]
			_TheButton_Red_Button()
		Case $aTheButtonUI[$idBtnTheButtonColorWHITE]
			_TheButton_White_Button()
		Case $aTheButtonUI[$idBtnTheButtonColorYELLOW]
			_TheButton_Yellow_Button()
		Case $aTheButtonUI[$idBtnTheButtonTextABORT]
			_TheButton_Detonate_Button()
		Case $aTheButtonUI[$idBtnTheButtonTextDETONATE]
			_TheButton_Detonate_Button()
		Case $aTheButtonUI[$idBtnTheButtonTextPRESS]
			_TheButton_Press_Button()
		Case $aTheButtonUI[$idBtnTheButtonTextHOLD]
			_TheButton_Hold_Button()
		Case $aTheButtonUI[$idBtnTheButtonIndicatorBLUE]
			_TheButton_Blue_Indicator_Button()
		Case $aTheButtonUI[$idBtnTheButtonIndicatorOTHER]
			_TheButton_Other_Indicator_Button()
		Case $aTheButtonUI[$idBtnTheButtonIndicatorYELLOW]
			_TheButton_Yellow_Indicator_Button()
		Case $aTheButtonUI[$idBtnTheButtonReset]
			_TheButton_UI_Reset()
	EndSwitch
EndFunc

Func _TheButton_UI_Reset()
	_TheButton_Enable_Buttons($THEBUTTON_BLUE + $THEBUTTON_RED + $THEBUTTON_WHITE + $THEBUTTON_YELLOW)
	_TheButton_Enable_Word_Buttons($THEBUTTON_ABORT + $THEBUTTON_DETONATE + $THEBUTTON_HOLD + $THEBUTTON_PRESS)
	_TheButton_Enable_Indicator_Buttons($THEBUTTON_BLUE_INDICATOR + $THEBUTTON_OTHER_INDICATOR + $THEBUTTON_YELLOW_INDICATOR)
	_TheButton_Show_Indicator_Buttons(False)
	_TheButton_Show_Solution("")
	$sTheButtonIndicator = ""
	$sTheButtonInput = ""
	_TheButton_SetHotKeys($THEBUTTON_HOTKEYS_DEFAULT)
	_TheButton_Show_Buttons()
EndFunc

Func _TheButton_Blue_Button()
	_TheButton_Enable_Buttons($THEBUTTON_BLUE)
	If Not StringInstr($sTheButtonInput,"B") > 0 Then $sTheButtonInput &= "B"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Red_Button()
	_TheButton_Enable_Buttons($THEBUTTON_RED)
	If Not StringInstr($sTheButtonInput,"R") > 0 Then $sTheButtonInput &= "R"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_White_Button()
	_TheButton_Enable_Buttons($THEBUTTON_WHITE)
	If Not StringInstr($sTheButtonInput,"W") > 0 Then $sTheButtonInput &= "W"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Yellow_Button()
	_TheButton_Enable_Buttons($THEBUTTON_YELLOW)
	If Not StringInstr($sTheButtonInput,"Y") > 0 Then $sTheButtonInput &= "Y"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Abort_Button()
	_TheButton_Enable_Word_Buttons($THEBUTTON_ABORT)
	If Not StringInstr($sTheButtonInput,"A") > 0 Then $sTheButtonInput &= "A"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Detonate_Button()
	_TheButton_Enable_Word_Buttons($THEBUTTON_DETONATE)
	If Not StringInstr($sTheButtonInput,"D") > 0 Then $sTheButtonInput &= "D"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Press_Button()
	_TheButton_Enable_Word_Buttons($THEBUTTON_PRESS)
	If Not StringInstr($sTheButtonInput,"P") > 0 Then $sTheButtonInput &= "P"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Hold_Button()
	_TheButton_Enable_Word_Buttons($THEBUTTON_HOLD)
	If Not StringInstr($sTheButtonInput,"H") > 0 Then $sTheButtonInput &= "H"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Blue_Indicator_Button()
	_TheButton_Enable_Indicator_Buttons($THEBUTTON_BLUE_INDICATOR)
	$sTheButtonIndicator = "B"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Other_Indicator_Button()
	_TheButton_Enable_Indicator_Buttons($THEBUTTON_OTHER_INDICATOR)
	$sTheButtonIndicator = "O"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Yellow_Indicator_Button()
	_TheButton_Enable_Indicator_Buttons($THEBUTTON_YELLOW_INDICATOR)
	$sTheButtonIndicator = "Y"
	_TheButton_EvalButton()
EndFunc

Func _TheButton_Enable_Buttons($iButtons)
	If BitAND($iButtons, $THEBUTTON_BLUE) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorBLUE],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorBLUE],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_RED) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorRED],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorRED],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_WHITE) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorWHITE],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorWHITE],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_YELLOW) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorYELLOW],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorYELLOW],$GUI_DISABLE)
	EndIf
EndFunc

Func _TheButton_Enable_Word_Buttons($iButtons)
	If BitAND($iButtons, $THEBUTTON_ABORT) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextABORT],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextABORT],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_DETONATE) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextDETONATE],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextDETONATE],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_HOLD) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextHOLD],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextHOLD],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_PRESS) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextPRESS],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextPRESS],$GUI_DISABLE)
	EndIf
EndFunc

Func _TheButton_Enable_Indicator_Buttons($iButtons)
	If BitAND($iButtons, $THEBUTTON_BLUE_INDICATOR) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorBLUE],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorBLUE],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_OTHER_INDICATOR) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorOTHER],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorOTHER],$GUI_DISABLE)
	EndIf
	If BitAND($iButtons, $THEBUTTON_YELLOW_INDICATOR) Then
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorYELLOW],$GUI_ENABLE)
	Else
		GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorYELLOW],$GUI_DISABLE)
	EndIf

EndFunc

Func _TheButton_Show_Indicator_Buttons($iState = $GUI_SHOW)
	If $iState <> $GUI_SHOW Then $iState = $GUI_HIDE
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorBLUE], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorOTHER], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonIndicatorYELLOW], $iState)
	If $iState = $GUI_SHOW Then
		_TheButton_Set_Group_MSG($THEBUTTON_MSG_HOLD_BUTTON & ".  " & $THEBUTTON_MSG_INDICATOR_COLOR)
		;_TheButton_Show_Solution($THEBUTTON_MSG_HOLD_BUTTON)
		_TheButton_SetHotKeys($THEBUTTON_HOTKEYS_INDICATORS)
		_TheButton_Show_Buttons($GUI_HIDE)
	Else
		_TheButton_Set_Group_MSG($THEBUTTON_MSG_GROUP_DEFAULT)
		_TheButton_SetHotKeys($THEBUTTON_HOTKEYS_DEFAULT)
	EndIf
EndFunc

Func _TheButton_Show_Buttons($iState = $GUI_SHOW)
	If $iState <> $GUI_SHOW Then $iState = $GUI_HIDE
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorBLUE], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorRED], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorWHITE], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonColorYELLOW], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextABORT], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextDETONATE], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextHOLD], $iState)
	GUICtrlSetState($aTheButtonUI[$idBtnTheButtonTextPRESS], $iState)
EndFunc

Func _TheButton_EvalButton()
	If StringLen($sTheButtonInput) < 2 Then Return ""
	$sResult = _TheButton_EvaluateTheButton()
	If $sResult = $THEBUTTON_MSG_HOLD_BUTTON Then
		_TheButton_Show_Indicator_Buttons()
		If $sTheButtonIndicator Then _TheButton_Show_Solution(_TheButton_HoldTheButton())
	ElseIf $sResult = $THEBUTTON_MSG_PRESS_AND_RELEASE Then
		_TheButton_Show_Solution($THEBUTTON_MSG_PRESS_AND_RELEASE)
	Else
		Return ""
	EndIf
EndFunc

Func _TheButton_Show_Solution($sSolution)
	If $sSolution Then
		GUICtrlSetData($aTheButtonUI[$idLblTheButtonSolution],$sSolution)
		_TheButton_Enable_Buttons(0)
		_TheButton_Enable_Word_Buttons(0)
		If GUICtrlRead($aTheButtonUI[$idLblTheButtonSolution]) <> $THEBUTTON_MSG_HOLD_BUTTON Then _TheButton_Enable_Indicator_Buttons(0)
	Else
		GUICtrlSetData($aTheButtonUI[$idLblTheButtonSolution],"")
	EndIf
EndFunc

Func _TheButton_Set_Group_MSG($sMsg)
	GUICtrlSetData($aTheButtonUI[$idGrpTheButton],$sMsg)
EndFunc

Func _TheButton_SetHotKeys($iHotkeySet)
	Local $aTheButtonHotkeysDefault[][2] = [["{esc}", $aTheButtonUI[$idBtnTheButtonReset]],["b", $aTheButtonUI[$idBtnTheButtonColorBLUE]], _
		["r", $aTheButtonUI[$idBtnTheButtonColorRED]], ["w", $aTheButtonUI[$idBtnTheButtonColorWHITE]], ["y", $aTheButtonUI[$idBtnTheButtonColorYELLOW]], _
		["a", $aTheButtonUI[$idBtnTheButtonTextABORT]], ["d", $aTheButtonUI[$idBtnTheButtonTextDETONATE]], ["p", $aTheButtonUI[$idBtnTheButtonTextPRESS]], _
		["h", $aTheButtonUI[$idBtnTheButtonTextHOLD]]]
	Local $aTheButtonHotkeysIndicators[][2] = [["{esc}", $aTheButtonUI[$idBtnTheButtonReset]], ["b", $aTheButtonUI[$idBtnTheButtonIndicatorBLUE]], _
		["y", $aTheButtonUI[$idBtnTheButtonIndicatorYELLOW]], ["o", $aTheButtonUI[$idBtnTheButtonIndicatorOTHER]]]
	Switch $iHotkeySet
		Case $THEBUTTON_HOTKEYS_DEFAULT
			GUISetAccelerators($aTheButtonHotkeysDefault)
		Case $THEBUTTON_HOTKEYS_INDICATORS
			GUISetAccelerators($aTheButtonHotkeysIndicators)
	EndSwitch
EndFunc