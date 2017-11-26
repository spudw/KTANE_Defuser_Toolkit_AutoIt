#include-once
#include <MsgBoxConstants.au3>
#Region - Constants and Variables
Global Const $THEBUTTON_MSG_PRESS_AND_RELEASE = "Immediately Press and Release the Button"
Global Const $THEBUTTON_MSG_HOLD_BUTTON = "Hold Down the Button"
Global Const $THEBUTTON_MSG_RELEASE_WHEN = "Release the Button when the Countdown Timer has a ~ in any position"
Global $sTheButtonInput = ""
Global $sTheButtonIndicator = ""
#EndRegion - Constants and Variables


#Region - Module Functions
Func _TheButton_EvaluateTheButton()
	If StringInstr($sTheButtonInput,"R") And StringInStr($sTheButtonInput, "H") Then Return $THEBUTTON_MSG_PRESS_AND_RELEASE	;If the button is red and the button says "Hold", press and immediately release the button.
	If StringInstr($sTheButtonInput,"D") And Not $sTheButtonIndicator Then
		If MsgBox($MB_YESNO + $MB_ICONERROR, "Inspect Bomb", "Is there more than One Battery?") = $IDYES Then Return $THEBUTTON_MSG_PRESS_AND_RELEASE	;If there is more than 1 battery on the bomb and the button says "Detonate", press and immediately release the button.
	EndIf
	If Not $sTheButtonIndicator Then
		If MsgBox($MB_YESNO + $MB_ICONERROR, "Inspect Bomb", "Are there more than Two Batteries and a Lit Indicator labeled FRK?") = $IDYES Then Return $THEBUTTON_MSG_PRESS_AND_RELEASE	;If there are more than 2 batteries on the bomb and there is a lit indicator with label FRK, press and immediately release the button.
	EndIf
	Return $THEBUTTON_MSG_HOLD_BUTTON
EndFunc

Func _TheButton_HoldTheButton()
	If $sTheButtonIndicator = "B" Then Return _TheButton_ReleaseWhen("4")
	If $sTheButtonIndicator = "Y" Then Return _TheButton_ReleaseWhen("5")
	If $sTheButtonIndicator = "O" Then Return _TheButton_ReleaseWhen("1")
EndFunc

Func _TheButton_ReleaseWhen($sNumber)
	Return StringReplace($THEBUTTON_MSG_RELEASE_WHEN, "~", $sNumber)
EndFunc
#EndRegion - Module Functions