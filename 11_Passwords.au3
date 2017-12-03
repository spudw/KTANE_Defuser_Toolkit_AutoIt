#include-once
#include <Array.au3>
#Region - Constants and Variables
Global Static $aPasswordsAnswers[34] = ["about", "after", "again", "below", "could", "every", _
	"first", "found", "great", "house", "large", "learn", "never", "other", "place", _
	"plant", "right", "small", "sound", "spell", "still", "study", "their", "there", _
	"these", "thing", "think", "three", "water", "where", "which", "world", "would", "write"]	;Answers Array
Global Const $PASSWORDS_COLUMN_COUNT = 5							;Password Letter Columns (Password Length)
Global Const $PASSWORDS_COLUMN_LETTER_COUNT = 6						;Password Letters per Column
Global $aPasswordsInputs[$PASSWORDS_COLUMN_COUNT][$PASSWORDS_COLUMN_LETTER_COUNT]	;Inputs Tracker
Global $aPasswordsPossibleAnswers = 0
#EndRegion


#Region - Module Functions
Func _Passwords_LetterInput($sLetter,$iColumn,$iIndex)
	$aPasswordsInputs[$iColumn][$iIndex] = $sLetter
EndFunc

Func _Passwords_NarrowDownAnswers()
	Local $iAnswerPossibilityIndex = 0
	Local $aPasswordsPossibilities[UBound($aPasswordsAnswers) - 1][$PASSWORDS_COLUMN_COUNT]
	Local $iBiggestLastElement = 0
	Local $iLastElement = 0
	For $iColumn = 0 to $PASSWORDS_COLUMN_COUNT - 1
		For $iIndex = 0 to $PASSWORDS_COLUMN_LETTER_COUNT - 1
			Local $sLetter = $aPasswordsInputs[$iColumn][$iIndex]
			If $sLetter Then
				For $iAnswer = 0 to UBound($aPasswordsAnswers) - 1
					Local $sAnswer = $aPasswordsAnswers[$iAnswer]
					If StringMid($sAnswer, $iColumn + 1, 1) = $sLetter Then
						If _ArraySearch($aPasswordsPossibilities, $sAnswer, 0, 0, 0, 0, 1, $iColumn) -1 Then
							$aPasswordsPossibilities[$iAnswerPossibilityIndex][$iColumn] = $sAnswer
							$iAnswerPossibilityIndex += 1
						EndIf
					EndIf
				Next
			EndIf
		Next
		$iAnswerPossibilityIndex = 0
		$iLastElement = _ArraySearch($aPasswordsPossibilities,"", 0, 0, 0, 0, 1, $iColumn)
		If $iLastElement > $iBiggestLastElement Then $iBiggestLastElement = $iLastElement
	Next
	ReDim $aPasswordsPossibilities[$iBiggestLastElement][$iColumn]
	$aPasswordsPossibleAnswers = $aPasswordsPossibilities
EndFunc

Func _Passwords_GetAnswerScores()
	Local $iPossibleAnswersColumns = UBound($aPasswordsPossibleAnswers,2)
	Local $iPossibleAnswersRows = UBound($aPasswordsPossibleAnswers,1)
	Local $aPasswordsPossibleAnswerScores[$iPossibleAnswersColumns*$iPossibleAnswersRows]
	Local $iAnswerCounter = 0
	For $iColumn = 0 To $iPossibleAnswersColumns - 1
		For $iIndex = 0 To $iPossibleAnswersRows - 1
			$aPasswordsPossibleAnswerScores[$iAnswerCounter] = $aPasswordsPossibleAnswers[$iIndex][$iColumn]
			$iAnswerCounter +=1
		Next
	Next
	$aPasswordsPossibleAnswerList = _ArrayUnique($aPasswordsPossibleAnswerScores,0,0,0,0)
	If Not _ArraySort($aPasswordsPossibleAnswerList) Then Return 0
	$aPasswordsPossibleAnswerList[0] = UBound($aPasswordsPossibleAnswerList)-1
	Local $aPasswordsPossibleAnswerScores[$aPasswordsPossibleAnswerList[0]][2]
	For $iAnswerIndex = 1 to $aPasswordsPossibleAnswerList[0]
		Local $iAnswerScore = 0
		For $iColumn = 0 to $iPossibleAnswersColumns - 1
			For $iRow = 0 to $iPossibleAnswersRows - 1
				If $aPasswordsPossibleAnswers[$iRow][$iColumn] == $aPasswordsPossibleAnswerList[$iAnswerIndex] Then
					$iAnswerScore += 1
				EndIf
			Next
		Next
		$aPasswordsPossibleAnswerScores[$iAnswerIndex-1][0] = $aPasswordsPossibleAnswerList[$iAnswerIndex]
		$aPasswordsPossibleAnswerScores[$iAnswerIndex-1][1] = $iAnswerScore
	Next
	_ArraySort($aPasswordsPossibleAnswerScores,1,0,0,1)
	Return $aPasswordsPossibleAnswerScores
EndFunc

Func _Passwords_IsPasswordDetermined()
	Local $aPasswords = _Passwords_GetAnswerScores()
;_ArrayDisplay($aPasswords)
	If Not IsArray($aPasswords) Then Return "Undetermined"
	If $aPasswords[0][1] = 5 Then Return StringUpper($aPasswords[0][0])
	If $aPasswords[0][1] > $aPasswords[1][1] Then Return StringUpper($aPasswords[0][0])
	Return "Undetermined"
EndFunc
#EndRegion