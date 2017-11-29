#include <Array.au3>
#Region - Constants and Variables
Global Static $aKeypadsCharacterMap[] = ["¿","©","¶","☆","★","҂","ƛ","ͼ","ͽ","ψ","Ω","Ϟ","Ϙ", _
	"ϗ","б","Җ","ҋ","Ҩ","Ҍ","Ӭ","Ѧ","Ѭ","Ѯ","Ѽ","ӕ","Ԇ","ټ"]
Global Const $KEYPADS_SET_COUNT = 6
Global Const $KEYPADS_SYMBOLS_PER_SET = 7
Global Const $KEYPADS_BUTTON_COUNT = 4
Global Static $aKeypadsSets[$KEYPADS_SET_COUNT][$KEYPADS_SYMBOLS_PER_SET] = [[12,20,6,11,21,13,8], _
	[19,12,8,17,3,13,0], _
	[1,23,17,15,25,6,3], _
	[14,2,18,21,15,0,26], _
	[9,26,18,7,2,22,4], _
	[14,19,5,24,9,16,10]]
Global $aKeypadsInputs[$KEYPADS_BUTTON_COUNT]
Global $aKeypadsAnswers[$KEYPADS_BUTTON_COUNT]
Global $iKeypadsInputCount = 0
Global $sKeypadsPossibleSets = ""
#EndRegion - Constants and Variables


#Region - Test Routine
;$aTest = $aKeypadsSets
;_ArrayShuffle($aTest)
;$iRandSet = Random(0,5,1)
;$aKeypadsInputs[0] = $aTest[$iRandSet][Random(0,1,1)]
;$aKeypadsInputs[1] = $aTest[$iRandSet][Random(2,3,1)]
;$aKeypadsInputs[2] = $aTest[$iRandSet][Random(4,5,1)]
;$aKeypadsInputs[3] = $aTest[$iRandSet][6]
;_ArrayDisplay($aKeypadsInputs)
;Local $iSet = _Keypads_FindSet()
;_Keypads_GetSequence($iSet)
;_ArrayDisplay($aKeypadsAnswers,$iSet)
#EndRegion - Test Routine


#Region - Module Functions
Func _Keypads_InputSymbol($iSymbolValue)
	If $iKeypadsInputCount >= 4 Then Return 0
	$aKeypadsInputs[$iKeypadsInputCount] = $iSymbolValue
	$iKeypadsInputCount += 1
EndFunc

Func _Keypads_FindSet()
	$sKeypadsPossibleSets = ""
	For $iSet = 0 To $KEYPADS_SET_COUNT-1
		For $iSymbolIndex = 0 to $KEYPADS_SYMBOLS_PER_SET -1
			For $iSymbolInput = 0 To $KEYPADS_BUTTON_COUNT - 1
				If $aKeypadsInputs[$iSymbolInput] = $aKeypadsSets[$iSet][$iSymbolIndex] Then
					$sKeypadsPossibleSets &= $iSet
				EndIf
			Next
		Next
	Next
	Local $iSetNumber = -1
	For $iSet = 0 To $KEYPADS_SET_COUNT-1
		$sSetString = StringReplace($sKeypadsPossibleSets,String($iSet),"")
		If StringLen($sKeypadsPossibleSets) - StringLen($sSetString) = 4 Then
			$iSetNumber = $iSet
			$iSet = $KEYPADS_SET_COUNT
		EndIf
	Next
	Return $iSetNumber
EndFunc

Func _Keypads_GetSequence($iSetNumber)
	For $iSymbols = 0 To $KEYPADS_BUTTON_COUNT-1
		For $iSymbolIndex = 0 To $KEYPADS_SYMBOLS_PER_SET -1
			If $aKeypadsInputs[$iSymbols] = $aKeypadsSets[$iSetNumber][$iSymbolIndex] Then
				$aKeypadsAnswers[$iSymbols] = $iSymbolIndex
			EndIf
		Next
	Next
	_ArraySort($aKeypadsAnswers)
	For $iSymbols = 0 To $KEYPADS_BUTTON_COUNT-1
		$aKeypadsAnswers[$iSymbols] = $aKeypadsSets[$iSetNumber][$aKeypadsAnswers[$iSymbols]]
	Next
EndFunc
#EndRegion - Module Functions