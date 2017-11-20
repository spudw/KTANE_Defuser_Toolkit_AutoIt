#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <ButtonConstants.au3>
#include <Array.au3>
#include <11_Passwords.au3>

Global $aPasswordsUI[1] = ["hwnd|id"]
Global Enum $idBtnPasswordsReset = 1, $idLblPasswordsSolution, $idInputPasswords00, $idInputPasswords01, $idInputPasswords02, $idInputPasswords03, $idInputPasswords04, $idInputPasswords05, _
	$idInputPasswords10, $idInputPasswords11, $idInputPasswords12, $idInputPasswords13, $idInputPasswords14, $idInputPasswords15, _
	$idInputPasswords20, $idInputPasswords21, $idInputPasswords22, $idInputPasswords23, $idInputPasswords24, $idInputPasswords25, _
	$idInputPasswords30, $idInputPasswords31, $idInputPasswords32, $idInputPasswords33, $idInputPasswords34, $idInputPasswords35, _
	$idInputPasswords40, $idInputPasswords41, $idInputPasswords42, $idInputPasswords43, $idInputPasswords44, $idInputPasswords45, $idBtnPasswordsSubmit, _
	$idTabPasswordsNextDummy, $idTabPasswordsPrevDummy,$idPasswordsLast
ReDim $aPasswordsUI[$idPasswordsLast]

Func _Passwords_UI_Create()
	GUICtrlCreateTabItem("Passwords")
	GUICtrlCreateGroup("Enter the Letters listed in each position", 88, 72, 425, 265, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aPasswordsUI[$idInputPasswords00] = GUICtrlCreateInput("", 176, 94, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords01] = GUICtrlCreateInput("", 176, 134, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords02] = GUICtrlCreateInput("", 176, 174, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords03] = GUICtrlCreateInput("", 176, 214, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords04] = GUICtrlCreateInput("", 176, 254, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords05] = GUICtrlCreateInput("", 176, 294, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords10] = GUICtrlCreateInput("", 232, 94, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords11] = GUICtrlCreateInput("", 232, 134, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords12] = GUICtrlCreateInput("", 232, 174, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords13] = GUICtrlCreateInput("", 232, 214, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords14] = GUICtrlCreateInput("", 232, 254, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords15] = GUICtrlCreateInput("", 232, 294, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords20] = GUICtrlCreateInput("", 288, 94, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords21] = GUICtrlCreateInput("", 288, 134, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords22] = GUICtrlCreateInput("", 288, 174, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords23] = GUICtrlCreateInput("", 288, 214, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords24] = GUICtrlCreateInput("", 288, 254, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords25] = GUICtrlCreateInput("", 288, 294, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords30] = GUICtrlCreateInput("", 344, 94, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords31] = GUICtrlCreateInput("", 344, 134, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords32] = GUICtrlCreateInput("", 344, 174, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords33] = GUICtrlCreateInput("", 344, 214, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords34] = GUICtrlCreateInput("", 344, 254, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords35] = GUICtrlCreateInput("", 344, 294, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords40] = GUICtrlCreateInput("", 400, 94, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords41] = GUICtrlCreateInput("", 400, 134, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords42] = GUICtrlCreateInput("", 400, 174, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords43] = GUICtrlCreateInput("", 400, 214, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords44] = GUICtrlCreateInput("", 400, 254, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aPasswordsUI[$idInputPasswords45] = GUICtrlCreateInput("", 400, 294, 25, 31, BitOR($ES_CENTER, $ES_UPPERCASE))
	GUICtrlSetLimit(-1, 1)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aPasswordsUI[$idBtnPasswordsSubmit] = GUICtrlCreateButton("SUBMIT", 260, 344, 80, 34, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetOnEvent(-1,"_Passwords_EventHandler")
	GUICtrlSetFont(-1, 14, 400, 0, "Calibri")
	$aPasswordsUI[$idLblPasswordsSolution] = GUICtrlCreateLabel("", 88, 378, 425, 37, $SS_CENTER)
	GUICtrlSetFont(-1, 20, 400, 4, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aPasswordsUI[$idBtnPasswordsReset] = GUICtrlCreateButton("Reset (Esc)", 504, 48, 73, 25)
	GUICtrlSetOnEvent(-1,"_Passwords_EventHandler")
	GUICtrlSetCursor(-1, 0)
	$aPasswordsUI[$idTabPasswordsNextDummy] = GUICtrlCreateDummy()
	GUICtrlSetOnEvent(-1,"_Passwords_EventHandler")
	$aPasswordsUI[$idTabPasswordsPrevDummy] = GUICtrlCreateDummy()
	GUICtrlSetOnEvent(-1,"_Passwords_EventHandler")
EndFunc   ;==>_Passwords_UI_Create

Func _Passwords_TabEvent()
	_Passwords_SetHotKeys()
	ControlFocus("","",$aPasswordsUI[$idInputPasswords00])
EndFunc

Func _Passwords_SetHotKeys()
	Local $aPasswordsHotkeys[][2] = [["{esc}", $aPasswordsUI[$idBtnPasswordsReset]],["{enter}", $aPasswordsUI[$idBtnPasswordsSubmit]], _
	["{RIGHT}",$aPasswordsUI[$idTabPasswordsNextDummy]], ["{LEFT}",$aPasswordsUI[$idTabPasswordsPrevDummy]]]
	GUISetAccelerators($aPasswordsHotkeys)
EndFunc

Func _Passwords_EventHandler()
	Switch @GUI_CtrlId
		Case $aPasswordsUI[$idBtnPasswordsSubmit]
			_Passwords_Eval()
		Case $aPasswordsUI[$idBtnPasswordsReset]
			_Passwords_UI_Reset()
		Case $aPasswordsUI[$idTabPasswordsNextDummy]
			_Passwords_Tab_Move(1)
		Case $aPasswordsUI[$idTabPasswordsPrevDummy]
			_Passwords_Tab_Move(-1)
	EndSwitch
EndFunc

Func _Passwords_Tab_Move($iMove)
	Execute("_Tab_Move(" & $iMove & ")")
EndFunc

Func _Passwords_UI_Reset()
	If MsgBox($MB_YESNO + $MB_ICONERROR,"","Are you sure you want to clear the inputs?") = $IDNO Then Return 0
	ReDim $aPasswordsInputs[0]
	ReDim $aPasswordsInputs[$PASSWORDS_COLUMN_COUNT][$PASSWORDS_COLUMN_LETTER_COUNT]
	_Passwords_Clear_Inputs()
	GUICtrlSetData($aPasswordsUI[$idLblPasswordsSolution],"")
EndFunc

Func _Passwords_Eval()
	For $iX = 0 to 4
		For $iY = 0 to 5
			$sLetter = GUICtrlRead(Execute("$aPasswordsUI[$idInputPasswords" & $iX & $iY & "]"))
			_Passwords_LetterInput($sLetter, $iX, $iY)
		Next
	Next
	_Passwords_NarrowDownAnswers()
	GUICtrlSetData($aPasswordsUI[$idLblPasswordsSolution],"The Password is " & _Passwords_IsPasswordDetermined())
EndFunc

Func _Passwords_Clear_Inputs()
	For $iX = 0 to 4
		For $iY = 0 to 5
			GUICtrlSetData(Execute("$aPasswordsUI[$idInputPasswords" & $iX & $iY & "]"),"")
		Next
	Next
EndFunc