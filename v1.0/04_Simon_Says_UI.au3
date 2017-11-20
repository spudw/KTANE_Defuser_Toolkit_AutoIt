#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <WindowsConstants.au3>
#include <04_Simon_Says.au3>

Global $aSimonSaysUI[1] = ["hwnd|id"]
Global Enum $idBtnSimonSaysBLUE = 1, $idBtnSimonSaysGREEN, $idBtnSimonSaysRED, $idBtnSimonSaysYELLOW, $idBtnSimonSaysReset, _
	$idRadioSimonSaysStrike0, $idRadioSimonSaysStrike1, $idRadioSimonSaysStrike2, _
	$idListSimonSaysDisplaySequence, $idListSimonSaysResponseSequence, $idSimonSaysLast
ReDim $aSimonSaysUI[$idSimonSaysLast]
Global $iVowel = -1
Global $iStrikes = 0
Global $sDisplaySequenceInputs = ""

Func _SimonSays_UI_Create()
	GUICtrlCreateTabItem("Simon Says")
	GUICtrlCreateGroup("Enter Strike Count and Displayed Sequence", 64, 77, 481, 320, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aSimonSaysUI[$idBtnSimonSaysRED] = GUICtrlCreateButton("&RED", 308, 149, 81, 33)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0xFF0000)
	GUICtrlSetCursor (-1, 0)
	$aSimonSaysUI[$idBtnSimonSaysBLUE] = GUICtrlCreateButton("&BLUE", 353, 109, 81, 33)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0x0000FF)
	GUICtrlSetCursor (-1, 0)
	$aSimonSaysUI[$idBtnSimonSaysYELLOW] = GUICtrlCreateButton("&YELLOW", 401, 149, 81, 33)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	GUICtrlSetBkColor(-1, 0xFFFF00)
	GUICtrlSetCursor (-1, 0)
	$aSimonSaysUI[$idBtnSimonSaysGREEN] = GUICtrlCreateButton("&GREEN", 353, 189, 81, 33)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0x008000)
	GUICtrlSetCursor (-1, 0)
	GUICtrlCreateLabel("Strike Count", 102, 108, 102, 27)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aSimonSaysUI[$idRadioSimonSaysStrike0] = GUICtrlCreateRadio("0 Strikes", 115, 136, 73, 17)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	GUICtrlSetState(-1, $GUI_CHECKED)
	$aSimonSaysUI[$idRadioSimonSaysStrike1] = GUICtrlCreateRadio("1 Strike", 115, 160, 73, 17)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	$aSimonSaysUI[$idRadioSimonSaysStrike2] = GUICtrlCreateRadio("2 Strikes", 115, 184, 73, 17)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	GUICtrlCreateLabel("Response Sequence", 314, 244, 162, 27, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	GUICtrlCreateLabel("Displayed Sequence", 107, 244, 163, 27, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aSimonSaysUI[$idListSimonSaysDisplaySequence] = GUICtrlCreateList("", 104, 272, 169, 100, BitOR($LBS_NOTIFY,$LBS_NOSEL,$WS_VSCROLL,$WS_BORDER))
	$aSimonSaysUI[$idListSimonSaysResponseSequence] = GUICtrlCreateList("", 311, 272, 169, 100, BitOR($LBS_NOTIFY,$LBS_NOSEL,$WS_VSCROLL,$WS_BORDER))
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aSimonSaysUI[$idBtnSimonSaysReset] = GUICtrlCreateButton("Reset (Esc)", 504, 48, 73, 25)
	GUICtrlSetOnEvent(-1, "_SimonSays_EventHandler")
	GUICtrlSetCursor (-1, 0)
EndFunc

Func _SimonSays_TabEvent()
	_SimonSays_SetHotKeys()
	GUICtrlSetState($aSimonSaysUI[Execute("$idRadioSimonSaysStrike" & $iStrikes)],$GUI_FOCUS)
	_SimonSays_IsVowelPresent()
EndFunc

Func _SimonSays_UI_Reset()
	$iVowel = -1
	$sDisplaySequenceInputs = ""
	$sDisplaySequence = ""
	$sResponseSequence = ""
	GUICtrlSetState($aSimonSaysUI[Execute("$idRadioSimonSaysStrike" & $iStrikes)],$GUI_FOCUS)
	_SimonSays_Set_Sequence_Lists()
	_SimonSays_IsVowelPresent()
EndFunc

Func _SimonSays_SetHotKeys()
	Local $aSimonSaysHotKeys[][2] = [["r", $aSimonSaysUI[$idBtnSimonSaysRED]], ["b", $aSimonSaysUI[$idBtnSimonSaysBLUE]], _
		["g", $aSimonSaysUI[$idBtnSimonSaysGREEN]], ["y", $aSimonSaysUI[$idBtnSimonSaysYELLOW]], _
		["{esc}", $aSimonSaysUI[$idBtnSimonSaysReset]], ["{NUMPAD0}", $aSimonSaysUI[$idRadioSimonSaysStrike0]], _
		["{NUMPAD1}", $aSimonSaysUI[$idRadioSimonSaysStrike1]], ["{NUMPAD2}", $aSimonSaysUI[$idRadioSimonSaysStrike2]]]
	GUISetAccelerators($aSimonSaysHotKeys)
EndFunc

Func _SimonSays_EventHandler()
	Switch @GUI_CtrlId
		Case $aSimonSaysUI[$idBtnSimonSaysRED]
			_SimonSays_Display_Sequence_Add($SIMONSAYS_RED)
		Case $aSimonSaysUI[$idBtnSimonSaysBLUE]
			_SimonSays_Display_Sequence_Add($SIMONSAYS_BLUE)
		Case $aSimonSaysUI[$idBtnSimonSaysGREEN]
			_SimonSays_Display_Sequence_Add($SIMONSAYS_GREEN)
		Case $aSimonSaysUI[$idBtnSimonSaysYELLOW]
			_SimonSays_Display_Sequence_Add($SIMONSAYS_YELLOW)
		Case $aSimonSaysUI[$idBtnSimonSaysReset]
			_SimonSays_UI_Reset()
		Case $aSimonSaysUI[$idRadioSimonSaysStrike0]
			$iStrikes = 0
			GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
			_SimonSays_Set_Sequence_Lists()
		Case $aSimonSaysUI[$idRadioSimonSaysStrike1]
			$iStrikes = 1
			GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
			_SimonSays_Set_Sequence_Lists()
		Case $aSimonSaysUI[$idRadioSimonSaysStrike2]
			$iStrikes = 2
			GUICtrlSetState(@GUI_CtrlId, $GUI_CHECKED)
			_SimonSays_Set_Sequence_Lists()
	EndSwitch
EndFunc

Func _SimonSays_IsVowelPresent()
	Local $iVowelPresent = MsgBox($MB_YESNO + $MB_ICONQUESTION,"Vowel Present?","Is there a Vowel in the Serial #?")
	Switch $iVowelPresent
		Case $IDYES
			$iVowel = 1
		Case $IDNO
			$iVowel = 0
	EndSwitch
EndFunc

Func _SimonSays_Display_Sequence_Add($iColor)
	$sDisplaySequenceInputs &= $iColor
	_SimonSays_Set_Sequence_Lists()
EndFunc

Func _SimonSays_Set_Sequence_Lists()
	GUICtrlSetData($aSimonSaysUI[$idListSimonSaysDisplaySequence],"")
	GUICtrlSetData($aSimonSaysUI[$idListSimonSaysResponseSequence],"")
	Local $aDisplaySequence = StringSplit($sDisplaySequenceInputs,"", $STR_NOCOUNT)
	If Not IsArray($aDisplaySequence) Then	Return SetError(1,0,0)
	Local $sDisplaySequence = ""
	Local $sResponseSequence = ""
	Local $iColorCount = UBound($aDisplaySequence)-1
	For $iColor = 0 To $iColorCount
		Switch $aDisplaySequence[$iColor]
			Case $SIMONSAYS_RED
				$sDisplaySequence &= "RED"
				$sResponseSequence &= _SimonSays_Get_ResponseColor($SIMONSAYS_RED)
			Case $SIMONSAYS_BLUE
				$sDisplaySequence &= "BLUE"
				$sResponseSequence &= _SimonSays_Get_ResponseColor($SIMONSAYS_BLUE)
			Case $SIMONSAYS_GREEN
				$sDisplaySequence &= "GREEN"
				$sResponseSequence &= _SimonSays_Get_ResponseColor($SIMONSAYS_GREEN)
			Case $SIMONSAYS_YELLOW
				$sDisplaySequence &= "YELLOW"
				$sResponseSequence &= _SimonSays_Get_ResponseColor($SIMONSAYS_YELLOW)
		EndSwitch
		If $iColor < $iColorCount Then
			$sDisplaySequence &= "|"
			$sResponseSequence &= "|"
		EndIf
	Next
	GUICtrlSetData($aSimonSaysUI[$idListSimonSaysDisplaySequence], $sDisplaySequence)
	GUICtrlSetData($aSimonSaysUI[$idListSimonSaysResponseSequence], $sResponseSequence)
EndFunc

Func _SimonSays_Get_ResponseColor($iColor)
	Local $iResponseColor = $aSimonSaysAnswers[$iVowel][$iStrikes][$iColor]
	Switch $iResponseColor
		Case $SIMONSAYS_RED
			Return "RED"
		Case $SIMONSAYS_BLUE
			Return "BLUE"
		Case $SIMONSAYS_GREEN
			Return "GREEN"
		Case $SIMONSAYS_YELLOW
			Return "YELLOW"
	EndSwitch
EndFunc