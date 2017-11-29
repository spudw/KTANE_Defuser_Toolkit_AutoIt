#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <GuiListView.au3>
#include <09_Wire_Sequences.au3>

Global $aWireSequencesUI[1] = ["hwnd|id"]
Global Enum $idBtnWireSequencesRED = 1, $idBtnWireSequencesBLUE, $idBtnWireSequencesBLACK, $idBtnWireSequencesA, $idBtnWireSequencesB, $idBtnWireSequencesC, _
	$idBtnWireSequencesReset, $idListViewWireSequences, $idLblWireSequencesSolution, $idWireSequencesLast
ReDim $aWireSequencesUI[$idWireSequencesLast]
Global $iWireSequencesWireColor = ""
Global $iWireSequencesWireConnection = ""
Global $iWireSequencesRedOccurrence = 0
Global $iWireSequencesBlueOccurrence = 0
Global $iWireSequencesBlackOccurrence = 0

Func _WireSequences_UI_Create()
	GUICtrlCreateTabItem("Wire Sequences")
	GUICtrlCreateGroup("Enter the Wire Colors and Connection Points", 64, 80, 481, 147, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aWireSequencesUI[$idBtnWireSequencesRED] = GUICtrlCreateButton("&RED", 172, 104, 81, 33)
	GUICtrlSetOnEvent(-1, "_WireSequences_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0xFF0000)
	GUICtrlSetCursor(-1, 0)
	$aWireSequencesUI[$idBtnWireSequencesBLUE] = GUICtrlCreateButton("B&LUE", 172, 144, 81, 33)
	GUICtrlSetOnEvent(-1, "_WireSequences_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0x0000FF)
	GUICtrlSetCursor(-1, 0)
	$aWireSequencesUI[$idBtnWireSequencesBLACK] = GUICtrlCreateButton("BLAC&K", 172, 184, 81, 33)
	GUICtrlSetOnEvent(-1, "_WireSequences_EventHandler")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetCursor(-1, 0)
	$aWireSequencesUI[$idBtnWireSequencesA] = GUICtrlCreateButton("&A", 356, 104, 81, 33)
	GUICtrlSetOnEvent(-1, "_WireSequences_EventHandler")
	GUICtrlSetCursor(-1, 0)
	$aWireSequencesUI[$idBtnWireSequencesB] = GUICtrlCreateButton("&B", 356, 144, 81, 33)
	GUICtrlSetOnEvent(-1, "_WireSequences_EventHandler")
	GUICtrlSetCursor(-1, 0)
	$aWireSequencesUI[$idBtnWireSequencesC] = GUICtrlCreateButton("&C", 356, 184, 81, 33)
	GUICtrlSetOnEvent(-1, "_WireSequences_EventHandler")
	GUICtrlSetCursor(-1, 0)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aWireSequencesUI[$idBtnWireSequencesReset] = GUICtrlCreateButton("Reset (Esc)", 504, 48, 73, 25)
	GUICtrlSetOnEvent(-1, "_WireSequences_EventHandler")
	GUICtrlSetCursor(-1, 0)
	$aWireSequencesUI[$idLblWireSequencesSolution] = GUICtrlCreateLabel("", 64, 228, 481, 37, $SS_CENTER)
	GUICtrlSetFont(-1, 20, 400, 4, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateGroup("Tally", 64, 260, 481, 140, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aWireSequencesUI[$idListViewWireSequences] = GUICtrlCreateListView("Wire Occurence|Action", 128, 280, 370, 110, BitOR($LVS_REPORT, $LVS_NOSORTHEADER))
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 175)
	GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 171)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc   ;==>_WireSequences_UI_Create

Func _WireSequences_TabEvent()
	_WireSequences_SetHotKeys()
EndFunc

Func _WireSequences_EventHandler()
	Switch @GUI_CtrlId
		Case $aWireSequencesUI[$idBtnWireSequencesRED]
			_WireSequences_Red_Button()
		Case $aWireSequencesUI[$idBtnWireSequencesBLUE]
			_WireSequences_Blue_Button()
		Case $aWireSequencesUI[$idBtnWireSequencesBLACK]
			_WireSequences_Black_Button()
		Case $aWireSequencesUI[$idBtnWireSequencesA]
			_WireSequences_A_Button()
		Case $aWireSequencesUI[$idBtnWireSequencesB]
			_WireSequences_B_Button()
		Case $aWireSequencesUI[$idBtnWireSequencesC]
			_WireSequences_C_Button()
		Case $aWireSequencesUI[$idBtnWireSequencesReset]
			_WireSequences_UI_Reset()
	EndSwitch
EndFunc

Func _WireSequences_SetHotKeys()
	Local $aWireSequencesHotkeys[][2] = [["r", $aWireSequencesUI[$idBtnWireSequencesRED]], ["l", $aWireSequencesUI[$idBtnWireSequencesBLUE]], _
		["k", $aWireSequencesUI[$idBtnWireSequencesBLACK]], ["a", $aWireSequencesUI[$idBtnWireSequencesA]], ["b", $aWireSequencesUI[$idBtnWireSequencesB]], _
		["c", $aWireSequencesUI[$idBtnWireSequencesC]],["{esc}", $aWireSequencesUI[$idBtnWireSequencesReset]]]
	GUISetAccelerators($aWireSequencesHotkeys)
EndFunc

Func _WireSequences_UI_Reset()
	$aWireSequencesInputs = 0
	$iWireSequencesBlackOccurrence = 0
	$iWireSequencesBlueOccurrence = 0
	$iWireSequencesRedOccurrence = 0
	$iWireSequencesWireColor = 0
	$iWireSequencesWireConnection = 0
	_GUICtrlListView_DeleteAllItems($aWireSequencesUI[$idListViewWireSequences])
	GUICtrlSetData($aWireSequencesUI[$idLblWireSequencesSolution], "")
EndFunc

Func _WireSequences_Red_Button()
	$iWireSequencesWireColor = $WIRESEQUENCES_RED_WIRE
	If $iWireSequencesWireConnection Then _WireSequencesEval()
EndFunc

Func _WireSequences_Blue_Button()
	$iWireSequencesWireColor = $WIRESEQUENCES_BLUE_WIRE
	If $iWireSequencesWireConnection Then _WireSequencesEval()
EndFunc

Func _WireSequences_Black_Button()
	$iWireSequencesWireColor = $WIRESEQUENCES_BLACK_WIRE
	If $iWireSequencesWireConnection Then _WireSequencesEval()
EndFunc

Func _WireSequences_A_Button()
	$iWireSequencesWireConnection = $WIRESEQUENCES_A_CONN
	If $iWireSequencesWireColor Then _WireSequencesEval()
EndFunc

Func _WireSequences_B_Button()
	$iWireSequencesWireConnection = $WIRESEQUENCES_B_CONN
	If $iWireSequencesWireColor Then _WireSequencesEval()
EndFunc

Func _WireSequences_C_Button()
	$iWireSequencesWireConnection = $WIRESEQUENCES_C_CONN
	If $iWireSequencesWireColor Then _WireSequencesEval()
EndFunc

Func _WireSequences_Tally_Connection($iWireSequencesWireColor, $iWireSequencesWireConnection, ByRef $iWireOccurrence, $sAction)
	$sColor = $aWireSequencesWireColorNames[$iWireSequencesWireColor]
	$sConnection = $aWireSequencesConnectionNames[$iWireSequencesWireConnection]
	$iWireOccurrence += 1
	;GUICtrlCreateListViewItem($sColor & " #" & $iWireOccurrence & " " & $sConnection & "|" & $sAction, $aWireSequencesUI[$idListViewWireSequences])
	Local $iIndex = _GUICtrlListView_AddItem($aWireSequencesUI[$idListViewWireSequences],$sColor & " #" & $iWireOccurrence & " is Connected to " & $sConnection)
	_GUICtrlListView_AddSubItem($aWireSequencesUI[$idListViewWireSequences],$iIndex,$sAction,1)
	_GUICtrlListView_EnsureVisible($aWireSequencesUI[$idListViewWireSequences],$iIndex)
	GUICtrlSetData($aWireSequencesUI[$idLblWireSequencesSolution], $sAction)
EndFunc

Func _WireSequencesEval()
	Local $sAction = 0
	Local $iOccurrence = 0
	Switch $iWireSequencesWireColor
		Case 1
			If $iWireSequencesRedOccurrence >= 9 Then Return ""
			$sAction = _WireSequences_InputEval($iWireSequencesWireColor-1, $iWireSequencesWireConnection, $iWireSequencesRedOccurrence)
			_WireSequences_Tally_Connection($iWireSequencesWireColor, $iWireSequencesWireConnection, $iWireSequencesRedOccurrence, $sAction)
		Case 2
			If $iWireSequencesBlueOccurrence >= 9 Then Return ""
			$sAction = _WireSequences_InputEval($iWireSequencesWireColor-1, $iWireSequencesWireConnection, $iWireSequencesBlueOccurrence)
			_WireSequences_Tally_Connection($iWireSequencesWireColor, $iWireSequencesWireConnection, $iWireSequencesBlueOccurrence, $sAction)
		Case 3
			If $iWireSequencesBlackOccurrence >= 9 Then Return ""
			$sAction = _WireSequences_InputEval($iWireSequencesWireColor-1, $iWireSequencesWireConnection, $iWireSequencesBlackOccurrence)
			_WireSequences_Tally_Connection($iWireSequencesWireColor, $iWireSequencesWireConnection, $iWireSequencesBlackOccurrence, $sAction)
	EndSwitch
	$iWireSequencesWireColor = 0
	$iWireSequencesWireConnection = 0
EndFunc