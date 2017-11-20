#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <05_Whos_on_First.au3>

Global $aWhosOnFirstUI[1] = ["hwnd|id"]
Global Enum $idBtnModeulNameReset = 1, $idLblWhosOnFirstWordList, $idLblWhosOnFirstKeywordLocation, _
	$idListWhosOnFirstDisplayWords, $idListWhosOnFirstKeyWords, $idWhosOnFirstLast
ReDim $aWhosOnFirstUI[$idWhosOnFirstLast]

Func _WhosOnFirst_UI_Create()
	GUICtrlCreateTabItem("Who's On First")
	GUICtrlCreateGroup("Select the Display Word, then Select the Word in the Key Location", 64, 72, 481, 251, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("Key Location Word", 377, 92, 152, 27, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	$aWhosOnFirstUI[$idListWhosOnFirstDisplayWords] = GUICtrlCreateList("", 88, 120, 137, 186, $WS_VSCROLL)
	GUICtrlSetOnEvent(-1, "_WhosOnFirst_EventHandler")
	$aWhosOnFirstUI[$idListWhosOnFirstKeyWords] = GUICtrlCreateList("", 384, 120, 137, 186, $WS_VSCROLL)
	GUICtrlSetOnEvent(-1, "_WhosOnFirst_EventHandler")
	GUICtrlCreateLabel("Keyword Location", 241, 168, 128, 23, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Calibri")
	$aWhosOnFirstUI[$idLblWhosOnFirstKeywordLocation] = GUICtrlCreateLabel("", 241, 192, 128, 30, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 800, 0, "Calibri")
	GUICtrlCreateLabel("Display Words", 98, 93, 118, 27, $SS_CENTER)
	GUICtrlSetFont(-1, 14, 800, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aWhosOnFirstUI[$idBtnModeulNameReset] = GUICtrlCreateButton("Reset (Esc)", 504, 48, 73, 25)
	GUICtrlSetOnEvent(-1, "_WhosOnFirst_EventHandler")
	GUICtrlSetCursor (-1, 0)
	GUICtrlCreateGroup("Have the Defuser Click the Button of the First Word that appears in the list below", 64, 328, 481, 73)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aWhosOnFirstUI[$idLblWhosOnFirstWordList] = GUICtrlCreateLabel("", 100, 352, 412, 48, $SS_CENTER)
	GUICtrlSetFont(-1, 12, 800, 0, "Calibri")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc

Func _WhosOnFirst_UI_Reset()
	_WhosOnFirst_ResetDisplayWordList()
	_WhosOnFirst_ResetKeywordList()
	GUICtrlSetData($aWhosOnFirstUI[$idLblWhosOnFirstKeywordLocation],"")
	GUICtrlSetData($aWhosOnFirstUI[$idLblWhosOnFirstWordList],"")
EndFunc

Func _WhosOnFirst_TabEvent()
	_WhosOnFirst_SetHotKeys()
	_WhosOnFirst_ResetDisplayWordList()
	_WhosOnFirst_ResetKeywordList()
EndFunc

Func _WhosOnFirst_SetHotKeys()
	Local $aWhosOnFirstHotKeys[][2] = [["{esc}", $aWhosOnFirstUI[$idBtnModeulNameReset]]]
	GUISetAccelerators($aWhosOnFirstHotKeys)
EndFunc

Func _WhosOnFirst_EventHandler()
	Switch @GUI_CtrlId
		Case $aWhosOnFirstUI[$idBtnModeulNameReset]
			_WhosOnFirst_UI_Reset()
		Case $aWhosOnFirstUI[$idListWhosOnFirstDisplayWords]
			_WhosOnFirst_Set_DisplayWord()
		Case $aWhosOnFirstUI[$idListWhosOnFirstKeyWords]
			_WhosOnFirst_Set_Keyword()
	EndSwitch
EndFunc

Func _WhosOnFirst_Set_DisplayWord()
	$iIndex = _GUICtrlListBox_FindString($aWhosOnFirstUI[$idListWhosOnFirstDisplayWords],GUICtrlRead($aWhosOnFirstUI[$idListWhosOnFirstDisplayWords]))
	GUICtrlSetData($aWhosOnFirstUI[$idLblWhosOnFirstKeywordLocation],$aWhosOnFirstDisplayWordsButton[$iIndex])
EndFunc

Func _WhosOnFirst_Set_Keyword()
	$iIndex = _GUICtrlListBox_FindString($aWhosOnFirstUI[$idListWhosOnFirstKeyWords],GUICtrlRead($aWhosOnFirstUI[$idListWhosOnFirstKeyWords]))
	Local $sWords = ""
	Local $iWord = -1
	For $iWords = 0 to 13
		$iWord = $aWhosOnFirstWordListWords[$iIndex][$iWords]
		$sWords &= $aWhosOnFirstWordList[$iWord]
		If $iWords < 13 Then $sWords &= ", "
	Next
	GUICtrlSetData($aWhosOnFirstUI[$idLblWhosOnFirstWordList], $sWords)
EndFunc

Func _WhosOnFirst_ResetDisplayWordList()
	GUICtrlSetData($aWhosOnFirstUI[$idListWhosOnFirstDisplayWords],"")
	Local $sDisplayWords = _ArrayToString($aWhosOnFirstDisplayWords)
	GUICtrlSetData($aWhosOnFirstUI[$idListWhosOnFirstDisplayWords],$sDisplayWords)
EndFunc

Func _WhosOnFirst_ResetKeywordList()
	GUICtrlSetData($aWhosOnFirstUI[$idListWhosOnFirstKeyWords],"")
	Local $sKeyWords = _ArrayToString($aWhosOnFirstWordList)
	GUICtrlSetData($aWhosOnFirstUI[$idListWhosOnFirstKeyWords],$sKeyWords)
EndFunc