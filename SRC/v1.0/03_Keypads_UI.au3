#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <03_Keypads.au3>

Global $aKeypadsUI[1] = ["hwnd|id"]
Global Enum $idBtnKeypadsSymbol0 = 1, $idBtnKeypadsSymbol1, $idBtnKeypadsSymbol2, $idBtnKeypadsSymbol3, $idBtnKeypadsSymbol4, _
	$idBtnKeypadsSymbol5, $idBtnKeypadsSymbol6, $idBtnKeypadsSymbol7, $idBtnKeypadsSymbol8, $idBtnKeypadsSymbol9, _
	$idBtnKeypadsSymbol10, $idBtnKeypadsSymbol11, $idBtnKeypadsSymbol12, $idBtnKeypadsSymbol13, $idBtnKeypadsSymbol14, _
	$idBtnKeypadsSymbol15, $idBtnKeypadsSymbol16, $idBtnKeypadsSymbol17, $idBtnKeypadsSymbol18, $idBtnKeypadsSymbol19, _
	$idBtnKeypadsSymbol20, $idBtnKeypadsSymbol21, $idBtnKeypadsSymbol22, $idBtnKeypadsSymbol23, $idBtnKeypadsSymbol24, _
	$idBtnKeypadsSymbol25, $idBtnKeypadsSymbol26, $idLblKeypadsSolution, $idBtnKeypadsReset, _
	$idBtnKeypadsSolution1, $idBtnKeypadsSolution2, $idBtnKeypadsSolution3, $idBtnKeypadsSolution4, $idKeypadsLast
Redim $aKeypadsUI[$idKeypadsLast]

Func _Keypads_UI_Create()
	GUICtrlCreateTabItem("Keypads")
	GUICtrlCreateGroup("Which Symbols are Displayed", 72, 72, 465, 227, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aKeypadsUI[$idBtnKeypadsSymbol0] = GUICtrlCreateButton("¿", 96, 102, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol1] = GUICtrlCreateButton("©", 160, 102, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol2] = GUICtrlCreateButton("¶", 224, 102, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol3] = GUICtrlCreateButton("☆", 288, 102, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 20, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol4] = GUICtrlCreateButton("★", 352, 102, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 20, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol5] = GUICtrlCreateButton("҂", 416, 102, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol6] = GUICtrlCreateButton("ƛ", 480, 102, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol7] = GUICtrlCreateButton("ͼ", 96, 150, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 20, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol8] = GUICtrlCreateButton("ͽ", 160, 150, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 20, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol9] = GUICtrlCreateButton("ψ", 224, 150, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol10] = GUICtrlCreateButton("Ω", 288, 150, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol11] = GUICtrlCreateButton("Ϟ", 352, 150, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol12] = GUICtrlCreateButton("Ϙ", 416, 150, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol13] = GUICtrlCreateButton("ϗ", 480, 150, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol14] = GUICtrlCreateButton("б", 96, 198, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol15] = GUICtrlCreateButton("Җ", 160, 198, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol16] = GUICtrlCreateButton("ҋ", 224, 198, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol17] = GUICtrlCreateButton("Ҩ", 288, 198, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol18] = GUICtrlCreateButton("Ҍ", 352, 198, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 20, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol19] = GUICtrlCreateButton("Ӭ", 416, 198, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol20] = GUICtrlCreateButton("Ѧ", 480, 198, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol21] = GUICtrlCreateButton("Ѭ", 128, 246, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol22] = GUICtrlCreateButton("Ѯ", 192, 246, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol23] = GUICtrlCreateButton("Ѽ", 256, 246, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol24] = GUICtrlCreateButton("ӕ", 320, 246, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol25] = GUICtrlCreateButton("Ԇ", 384, 246, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSymbol26] = GUICtrlCreateButton("ټ", 448, 246, 33, 33)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetFont(-1, 20, 400, 0, "Arial")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aKeypadsUI[$idLblKeypadsSolution] = GUICtrlCreateLabel("", 72, 303, 465, 37, $SS_CENTER)
	GUICtrlSetFont(-1, 20, 400, 4, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aKeypadsUI[$idBtnKeypadsSolution1] = GUICtrlCreateButton("", 156, 346, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSolution2] = GUICtrlCreateButton("", 244, 346, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSolution3] = GUICtrlCreateButton("", 332, 346, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "Arial")
	$aKeypadsUI[$idBtnKeypadsSolution4] = GUICtrlCreateButton("", 420, 346, 33, 33)
	GUICtrlSetFont(-1, 18, 400, 0, "Arial")
	GUICtrlCreateLabel("1", 163, 381, 15, 30, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("2", 253, 380, 15, 30, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("3", 341, 381, 15, 30, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("4", 429, 381, 15, 30, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aKeypadsUI[$idBtnKeypadsReset] = GUICtrlCreateButton("Reset (Esc)", 504, 48, 73, 25)
	GUICtrlSetOnEvent(-1, "_Keypads_EventHandler")
	GUICtrlSetCursor(-1, 0)
EndFunc   ;==>_Keypads_UI_Create

Func _Keypads_UI_Reset()
	ReDim $aKeypadsAnswers[0]
	ReDim $aKeypadsAnswers[$KEYPADS_BUTTON_COUNT]
	$iKeypadsInputCount = 0
	_Keypads_Set_Solution_Buttons(False)
	_Keypads_EnableAllButtons()
	GUICtrlSetData($aKeypadsUI[$idLblKeypadsSolution],"")
EndFunc

Func _Keypads_TabEvent()
	_Keypads_SetHotKeys()
EndFunc

Func _Keypads_SetHotKeys()
	Local $aKeypadsHotKeys[][2] = [["{esc}",$aKeypadsUI[$idBtnKeypadsReset]]]
	GUISetAccelerators($aKeypadsHotKeys)
EndFunc

Func _Keypads_EventHandler()
	Switch @GUI_CtrlId
		Case $aKeypadsUI[$idBtnKeypadsReset]
			_Keypads_UI_Reset()
		Case $aKeypadsUI[$idBtnKeypadsSymbol0]
			_Keypads_ButtonPress(0)
		Case $aKeypadsUI[$idBtnKeypadsSymbol1]
			_Keypads_ButtonPress(1)
		Case $aKeypadsUI[$idBtnKeypadsSymbol2]
			_Keypads_ButtonPress(2)
		Case $aKeypadsUI[$idBtnKeypadsSymbol3]
			_Keypads_ButtonPress(3)
		Case $aKeypadsUI[$idBtnKeypadsSymbol4]
			_Keypads_ButtonPress(4)
		Case $aKeypadsUI[$idBtnKeypadsSymbol5]
			_Keypads_ButtonPress(5)
		Case $aKeypadsUI[$idBtnKeypadsSymbol6]
			_Keypads_ButtonPress(6)
		Case $aKeypadsUI[$idBtnKeypadsSymbol7]
			_Keypads_ButtonPress(7)
		Case $aKeypadsUI[$idBtnKeypadsSymbol8]
			_Keypads_ButtonPress(8)
		Case $aKeypadsUI[$idBtnKeypadsSymbol9]
			_Keypads_ButtonPress(9)
		Case $aKeypadsUI[$idBtnKeypadsSymbol10]
			_Keypads_ButtonPress(10)
		Case $aKeypadsUI[$idBtnKeypadsSymbol11]
			_Keypads_ButtonPress(11)
		Case $aKeypadsUI[$idBtnKeypadsSymbol12]
			_Keypads_ButtonPress(12)
		Case $aKeypadsUI[$idBtnKeypadsSymbol13]
			_Keypads_ButtonPress(13)
		Case $aKeypadsUI[$idBtnKeypadsSymbol14]
			_Keypads_ButtonPress(14)
		Case $aKeypadsUI[$idBtnKeypadsSymbol15]
			_Keypads_ButtonPress(15)
		Case $aKeypadsUI[$idBtnKeypadsSymbol16]
			_Keypads_ButtonPress(16)
		Case $aKeypadsUI[$idBtnKeypadsSymbol17]
			_Keypads_ButtonPress(17)
		Case $aKeypadsUI[$idBtnKeypadsSymbol18]
			_Keypads_ButtonPress(18)
		Case $aKeypadsUI[$idBtnKeypadsSymbol19]
			_Keypads_ButtonPress(19)
		Case $aKeypadsUI[$idBtnKeypadsSymbol20]
			_Keypads_ButtonPress(20)
		Case $aKeypadsUI[$idBtnKeypadsSymbol21]
			_Keypads_ButtonPress(21)
		Case $aKeypadsUI[$idBtnKeypadsSymbol22]
			_Keypads_ButtonPress(22)
		Case $aKeypadsUI[$idBtnKeypadsSymbol23]
			_Keypads_ButtonPress(23)
		Case $aKeypadsUI[$idBtnKeypadsSymbol24]
			_Keypads_ButtonPress(24)
		Case $aKeypadsUI[$idBtnKeypadsSymbol25]
			_Keypads_ButtonPress(25)
		Case $aKeypadsUI[$idBtnKeypadsSymbol26]
			_Keypads_ButtonPress(26)

	EndSwitch
EndFunc

Func _Keypads_Set_Solution_Buttons($bShowAnswers = True)
	If $bShowAnswers Then
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution1],$aKeypadsCharacterMap[$aKeypadsAnswers[0]])
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution2],$aKeypadsCharacterMap[$aKeypadsAnswers[1]])
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution3],$aKeypadsCharacterMap[$aKeypadsAnswers[2]])
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution4],$aKeypadsCharacterMap[$aKeypadsAnswers[3]])
	Else
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution1],"")
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution2],"")
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution3],"")
		GUICtrlSetData($aKeypadsUI[$idBtnKeypadsSolution4],"")
	EndIf
EndFunc

Func _Keypads_ButtonPress($iButtonNumber)
	_Keypads_InputSymbol($iButtonNumber)
	GUICtrlSetState($aKeypadsUI[Execute("$idBtnKeypadsSymbol" & $iButtonNumber)], $GUI_DISABLE)
	If $iKeypadsInputCount >= 4 Then
		_Keypads_DisableAllButtons()
		Local $iSet = _Keypads_FindSet()
		If $iSet = -1 Then
			MsgBox(0,"","Could not Determine Symbol Set")
			Return _Keypads_UI_Reset()
		EndIf
		_Keypads_GetSequence($iSet)
		_Keypads_Set_Solution_Buttons()
		GUICtrlSetData($aKeypadsUI[$idLblKeypadsSolution],"Enter the Symbols in this Order")
	EndIf
EndFunc

Func _Keypads_DisableAllButtons()
	For $iButtonNumber = 0 to 26
		GUICtrlSetState($aKeypadsUI[Execute("$idBtnKeypadsSymbol" & $iButtonNumber)], $GUI_DISABLE)
	Next
EndFunc

Func _Keypads_EnableAllButtons()
	For $iButtonNumber = 0 to 26
		GUICtrlSetState($aKeypadsUI[Execute("$idBtnKeypadsSymbol" & $iButtonNumber)], $GUI_ENABLE)
	Next
EndFunc