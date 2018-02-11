#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>

Global $aMazesUI[1]=["hwnd|id"]
Global Enum $idComboMazesColumn = 1, $idComboMazesRow, $idPicMazes, $idBtnMazesReset, $idMazesLast
Redim $aMazesUI[$idMazesLast]
Global $iColumn = -1
Global $iRow = -1
Global $aMazesImages[6][6]
$aMazesImages[0][0] = 4
$aMazesImages[0][1] = 1
$aMazesImages[0][3] = 4
$aMazesImages[0][4] = 9
$aMazesImages[1][0] = 7
$aMazesImages[1][3] = 2
$aMazesImages[1][5] = 7
$aMazesImages[2][1] = 9
$aMazesImages[2][3] = 8
$aMazesImages[2][4] = 6
$aMazesImages[3][0] = 8
$aMazesImages[3][3] = 3
$aMazesImages[3][5] = 5
$aMazesImages[4][0] = 6
$aMazesImages[4][1] = 2
$aMazesImages[4][2] = 5
$aMazesImages[5][2] = 1
$aMazesImages[5][3] = 3

Func _Mazes_UI_Create()
	GUICtrlCreateTabItem("Mazes")
	GUICtrlCreateGroup("Enter Coordinates of one of the Green Circles then Help Navigate", 164, 72, 481, 331, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("Column:", 284, 96, 69, 27)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aMazesUI[$idComboMazesColumn] = GUICtrlCreateCombo("", 356, 96, 41, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "_Mazes_EventHandler")
	GUICtrlCreateLabel("Row:", 436, 96, 44, 27)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aMazesUI[$idComboMazesRow] = GUICtrlCreateCombo("", 484, 96, 41, 26, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
	GUICtrlSetOnEvent(-1, "_Mazes_EventHandler")
	$aMazesUI[$idPicMazes] = GUICtrlCreatePic("", 278, 130, 260, 260, BitOR($GUI_SS_DEFAULT_PIC,$SS_CENTERIMAGE,$WS_BORDER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aMazesUI[$idBtnMazesReset] = GUICtrlCreateButton("Reset (Esc)", 700, 48, 73, 25)
	GUICtrlSetOnEvent(-1, "_Mazes_EventHandler")
	GUICtrlSetCursor (-1, 0)
EndFunc

Func _Mazes_UI_Reset()
	_Mazes_Combo_Reset()
	$iColumn = -1
	$iRow = -1
	GUICtrlSetImage($aMazesUI[$idPicMazes],"")
EndFunc

Func _Mazes_TabEvent()
	_Mazes_Combo_Reset()
	_Mazes_SetHotKeys()
EndFunc

Func _Mazes_SetHotKeys()
	Local $aMazesHotKeys[][2] = [["{esc}", $aMazesUI[$idBtnMazesReset]]]
	GUISetAccelerators($aMazesHotKeys)
EndFunc

Func _Mazes_EventHandler()
	Switch @GUI_CtrlId
		Case $aMazesUI[$idBtnMazesReset]
			_Mazes_UI_Reset()
		Case $aMazesUI[$idComboMazesColumn]
			_Mazes_Set_Column()
		Case $aMazesUI[$idComboMazesRow]
			_Mazes_Set_Row()
	EndSwitch
EndFunc

Func _Mazes_Combo_Reset()
	GUICtrlSetData($aMazesUI[$idComboMazesColumn], "")
	GUICtrlSetData($aMazesUI[$idComboMazesRow], "")
	GUICtrlSetData($aMazesUI[$idComboMazesColumn], "1|2|3|4|5|6")
	GUICtrlSetData($aMazesUI[$idComboMazesRow], "1|2|3|4|5|6")
EndFunc

Func _Mazes_Set_Column()
	$iColumn = GUICtrlRead($aMazesUI[$idComboMazesColumn])
	_Mazes_Eval()
EndFunc

Func _Mazes_Set_Row()
	$iRow = GUICtrlRead($aMazesUI[$idComboMazesRow])
	_Mazes_Eval()
EndFunc

Func _Mazes_Eval()
	If $iColumn > 0 And $iRow > 0 Then
		Local $iImageNumber = $aMazesImages[$iColumn-1][$iRow-1]
		If Not $iImageNumber Then
			GUICtrlSetImage($aMazesUI[$idPicMazes],"")
			Return 0
		EndIf
		Local $sImage = "Maze" & $iImageNumber & ".JPG"
		GUICtrlSetImage($aMazesUI[$idPicMazes],@ScriptDir & "\RES\" & $sImage)
	EndIf
EndFunc