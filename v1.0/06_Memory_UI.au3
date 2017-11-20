#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <06_Memory.au3>
#include <Array.au3>

Global $aMemoryUI[1] = ["hwnd|id"]
Global Enum $idBtnMemoryReset = 1, $idInputMemoryDisplayNumber, $idInputMemoryNumber1, $idInputMemoryNumber2, _
	$idInputMemoryNumber3, $idInputMemoryNumber4, $idLblMemorySolution, $idBtnMemorySubmit, _
	$idTabMemoryNextDummy, $idTabMemoryPrevDummy, $idMemoryLast
ReDim $aMemoryUI[$idMemoryLast]

Func _Memory_UI_Create()
	GUICtrlCreateTabItem("Memory")
	GUICtrlCreateGroup("Enter the Numbers Displayed", 64, 104, 481, 163, -1, $WS_EX_TRANSPARENT)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("Display #", 266, 128, 81, 30, $SS_CENTER)
	GUICtrlSetFont(-1, 16, 800, 0, "Calibri")
	$aMemoryUI[$idInputMemoryDisplayNumber] = GUICtrlCreateInput("", 216, 160, 177, 41, BitOR($ES_CENTER, $ES_NUMBER))
	GUICtrlSetFont(-1, 20, 800, 0, "Calibri")
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0x000000)
	GUICtrlSetLimit(-1, 1, 0)
	$aMemoryUI[$idInputMemoryNumber1] = GUICtrlCreateInput("", 216, 216, 33, 31, BitOR($ES_CENTER, $ES_NUMBER))
	GUICtrlSetFont(-1, 14, 400, 0, "Calibri")
	GUICtrlSetLimit(-1, 1, 0)
	$aMemoryUI[$idInputMemoryNumber2] = GUICtrlCreateInput("", 264, 216, 33, 31, BitOR($ES_CENTER, $ES_NUMBER))
	GUICtrlSetFont(-1, 14, 400, 0, "Calibri")
	GUICtrlSetLimit(-1, 1, 0)
	$aMemoryUI[$idInputMemoryNumber3] = GUICtrlCreateInput("", 312, 216, 33, 31, BitOR($ES_CENTER, $ES_NUMBER))
	GUICtrlSetFont(-1, 14, 400, 0, "Calibri")
	GUICtrlSetLimit(-1, 1, 0)
	$aMemoryUI[$idInputMemoryNumber4] = GUICtrlCreateInput("", 360, 216, 33, 31, BitOR($ES_CENTER, $ES_NUMBER))
	GUICtrlSetFont(-1, 14, 400, 0, "Calibri")
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$aMemoryUI[$idLblMemorySolution] = GUICtrlCreateLabel("Stage 1", 64, 271, 481, 37, $SS_CENTER)
	GUICtrlSetFont(-1, 20, 400, 4, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$aMemoryUI[$idBtnMemorySubmit] = GUICtrlCreateButton("Submit", 256, 324, 97, 25, $GUI_SS_DEFAULT_BUTTON)
	GUICtrlSetOnEvent(-1, "_Memory_EventHandler")
	GUICtrlSetFont(-1, 16, 400, 4, "Calibri")
	$aMemoryUI[$idBtnMemoryReset] = GUICtrlCreateButton("Reset (Esc)", 504, 48, 73, 25)
	GUICtrlSetOnEvent(-1, "_Memory_EventHandler")
	GUICtrlSetCursor(-1, 0)
	$aMemoryUI[$idTabMemoryNextDummy] = GUICtrlCreateDummy()
	GUISetOnEvent(-1, "_Memory_EventHandler")
	$aMemoryUI[$idTabMemoryPrevDummy] = GUICtrlCreateDummy()
	GUISetOnEvent(-1, "_Memory_EventHandler")
EndFunc   ;==>_Memory_UI_Create

Func _Memory_UI_Reset()
	If MsgBox($MB_YESNO + $MB_ICONERROR + $MB_DEFBUTTON2,"","Are you sure you want to start over?") = $IDNO Then Return 0
	$iMemoryStageNumber = 1
	_Memory_UI_ClearInputs()
	GUICtrlSetData($aMemoryUI[$idLblMemorySolution], "Stage 1")
	ControlFocus("","",$aMemoryUI[$idInputMemoryDisplayNumber])
EndFunc

Func _Memory_TabEvent()
	_Memory_SetHotKeys()
	ControlFocus("","",$aMemoryUI[$idInputMemoryDisplayNumber])
EndFunc

Func _Memory_SetHotKeys()
	Local $aMemoryHotKeys[][2] = [["{esc}", $aMemoryUI[$idBtnMemoryReset]],["{enter}", $aMemoryUI[$idBtnMemorySubmit]], _
	["{RIGHT}",$aMemoryUI[$idTabMemoryNextDummy]], ["{LEFT}",$aMemoryUI[$idTabMemoryPrevDummy]]]
	GUISetAccelerators($aMemoryHotKeys)
EndFunc

Func _Memory_EventHandler()
	Switch @GUI_CtrlId
		Case $aMemoryUI[$idBtnMemoryReset]
			_Memory_UI_Reset()
		Case $aMemoryUI[$idBtnMemorySubmit]
			Local $sAnswer = _Memory_Eval()
			If $sAnswer <> -1 Then
				GUICtrlSetData($aMemoryUI[$idLblMemorySolution], "Stage " & $iMemoryStageNumber & ": " & $sAnswer)
				$iMemoryStageNumber += 1
				_Memory_UI_ClearInputs()
				ControlFocus("","",$aMemoryUI[$idInputMemoryDisplayNumber])
			ElseIf $iMemoryStageNumber = 6 Then
				GUICtrlSetData($aMemoryUI[$idLblMemorySolution], "Module shoule be complete. Click Reset")
			Else
				GUICtrlSetData($aMemoryUI[$idLblMemorySolution], "Stage " & $iMemoryStageNumber & ": Whoops - Looks like bad numbers were input")
			EndIf
		Case $aMemoryUI[$idTabMemoryNextDummy]
			_Memory_Tab_Move(1)
		Case $aMemoryUI[$idTabMemoryPrevDummy]
			_Memory_Tab_Move(-1)
	EndSwitch
EndFunc

Func _Memory_Tab_Move($iMove)
	Execute("_Tab_Move(" & $iMove & ")")
EndFunc

Func _Memory_UI_ClearInputs()
	GUICtrlSetData($aMemoryUI[$idInputMemoryDisplayNumber],"")
	GUICtrlSetData($aMemoryUI[$idInputMemoryNumber1],"")
	GUICtrlSetData($aMemoryUI[$idInputMemoryNumber2],"")
	GUICtrlSetData($aMemoryUI[$idInputMemoryNumber3],"")
	GUICtrlSetData($aMemoryUI[$idInputMemoryNumber4],"")
EndFunc

Func _Memory_Eval()
	If $iMemoryStageNumber >= 6 Then Return SetError(1,0,-1)
	Local $iValueVerification = 0
	$iDisplay = GUICtrlRead($aMemoryUI[$idInputMemoryDisplayNumber])
	If $iDisplay < 1 Or $iDisplay > 4 Then Return SetError(2, 0, -1)
	$iPosition1 = GUICtrlRead($aMemoryUI[$idInputMemoryNumber1])
	$iValueVerification += 2 ^ $iPosition1
	$iPosition2 = GUICtrlRead($aMemoryUI[$idInputMemoryNumber2])
	$iValueVerification += 2 ^ $iPosition2
	$iPosition3 = GUICtrlRead($aMemoryUI[$idInputMemoryNumber3])
	$iValueVerification += 2 ^ $iPosition3
	$iPosition4 = GUICtrlRead($aMemoryUI[$idInputMemoryNumber4])
	$iValueVerification += 2 ^ $iPosition4
	If $iValueVerification <> 30 Then Return SetError(3,0,-1)
	Local $iNumber = 0
	Local $iPosition = 0
	Local $sAnswer = "Click Number "
	Local $iAnswr = 0
	Switch $aMemoryActions[$iMemoryStageNumber-1][$iDisplay-1]
		Case $MEMORY_ACTION_LABEL_4
			Select
				Case $iPosition1 = 4
					$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition1 & "|4"
				Case $iPosition2 = 4
					$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition2 & "|4"
				Case $iPosition3 = 4
					$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition3 & "|4"
				Case $iPosition4 = 4
					$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition4 & "|4"
			EndSelect
			$iAnswer =  4
		Case $MEMORY_ACTION_POSITION_1
			$aMemoryInputs[$iMemoryStageNumber-1] = "1|" & $iPosition1
			$iAnswer =  $iPosition1
		Case $MEMORY_ACTION_POSITION_2
			$aMemoryInputs[$iMemoryStageNumber-1] = "2|" & $iPosition2
			$iAnswer =  $iPosition2
		Case $MEMORY_ACTION_POSITION_3
			$aMemoryInputs[$iMemoryStageNumber-1] = "3|" & $iPosition3
			$iAnswer =  $iPosition3
		Case $MEMORY_ACTION_POSITION_4
			$aMemoryInputs[$iMemoryStageNumber-1] = "4|" & $iPosition4
			$iAnswer =  $iPosition4
		Case $MEMORY_ACTION_POSITION_STAGE_1
			$iPosition = Number(StringLeft($aMemoryInputs[0],1))
			$iNumber = Execute("$iPosition" & $iPosition)
			$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition & "|" & $iNumber
			$iAnswer =  $iNumber
		Case $MEMORY_ACTION_POSITION_STAGE_2
			$iPosition = Number(StringLeft($aMemoryInputs[1],1))
			$iNumber = Execute("$iPosition" & $iPosition)
			$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition & "|" & $iNumber
			$iAnswer =  $iNumber
		Case $MEMORY_ACTION_LABEL_STAGE_1
			$iNumber = Number(StringRight($aMemoryInputs[0],1))
			Select
				Case $iPosition1 = $iNumber
					$iPosition = 1
				Case $iPosition2 = $iNumber
					$iPosition = 2
				Case $iPosition3 = $iNumber
					$iPosition = 3
				Case $iPosition4 = $iNumber
					$iPosition = 4
			EndSelect
			$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition & "|" & $iNumber
			$iAnswer =  $iNumber
		Case $MEMORY_ACTION_LABEL_STAGE_2
			$iNumber = Number(StringRight($aMemoryInputs[1],1))
			Select
				Case $iPosition1 = $iNumber
					$iPosition = 1
				Case $iPosition2 = $iNumber
					$iPosition = 2
				Case $iPosition3 = $iNumber
					$iPosition = 3
				Case $iPosition4 = $iNumber
					$iPosition = 4
			EndSelect
			$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition & "|" & $iNumber
			$iAnswer =  $iNumber
		Case $MEMORY_ACTION_LABEL_STAGE_3
			$iNumber = Number(StringRight($aMemoryInputs[2],1))
			Select
				Case $iPosition1 = $iNumber
					$iPosition = 1
				Case $iPosition2 = $iNumber
					$iPosition = 2
				Case $iPosition3 = $iNumber
					$iPosition = 3
				Case $iPosition4 = $iNumber
					$iPosition = 4
			EndSelect
			$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition & "|" & $iNumber
			$iAnswer =  $iNumber
		Case $MEMORY_ACTION_LABEL_STAGE_4
			$iNumber = Number(StringRight($aMemoryInputs[3],1))
			Select
				Case $iPosition1 = $iNumber
					$iPosition = 1
				Case $iPosition2 = $iNumber
					$iPosition = 2
				Case $iPosition3 = $iNumber
					$iPosition = 3
				Case $iPosition4 = $iNumber
					$iPosition = 4
			EndSelect
			$aMemoryInputs[$iMemoryStageNumber-1] = $iPosition & "|" & $iNumber
			$iAnswer =  $iNumber
	EndSwitch
	Return $sAnswer & $iAnswer
EndFunc