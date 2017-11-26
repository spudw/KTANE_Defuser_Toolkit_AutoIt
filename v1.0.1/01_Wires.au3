#include-once
#include <MsgBoxConstants.au3>
#Region - Constants and Variables
Global $sWiresWireSequence = ""
Global $sWiresSerialOdd = ""
#EndRegion - Constants and Variables


#Region - Module Functions
Func _Wires_EvaluateWireSequence()
	Local $iWireSequenceLength = StringLen($sWiresWireSequence)
	Switch $iWireSequenceLength
		Case 3
			Return _Wires_EvaluateThreeWireSequence()
		Case 4
			Return _Wires_EvaluateFourWireSequence()
		Case 5
			Return _Wires_EvaluateFiveWireSequence()
		Case 6
			Return _Wires_EvaluateSixWireSequence()
	EndSwitch
EndFunc

Func _Wires_EvaluateThreeWireSequence()
	If StringInStr($sWiresWireSequence, "R") = 0 Then Return "Cut the 2nd Wire"							;Red count = 0, Cut 2nd Wire
	If StringRight($sWiresWireSequence,1) = "W" Then Return "Cut the 3rd Wire"							;White = 3rd, Cut 3rd Wire
	If StringLen(StringReplace($sWiresWireSequence,"B","")) < 2 Then Return "Cut the Last Blue Wire"	;Blue count > 1, Cut Last Blue Wire
	Return "Cut the 3rd Wire"																			;else Cut 3rd Wire
EndFunc

Func _Wires_EvaluateFourWireSequence()
	If StringLen(StringReplace($sWiresWireSequence,"R","")) < 3 Then
		If Not $sWiresSerialOdd Then Return ""
		If $sWiresSerialOdd = "Y" Then Return "Cut the Last Red Wire"
	EndIf																															;Red count > 1, Is Serial is Odd, Cut Last Red Wire
	If StringRight($sWiresWireSequence,1) = "Y" And Not StringInstr($sWiresWireSequence, "R") = 4 Then Return "Cut the 1st Wire"	;Yellow = 4th and R count = 0, Cut 1st Wire
	If StringLen(StringReplace($sWiresWireSequence,"B","")) = 3 Then Return "Cut the 1st Wire"										;Blue count = 1, Cut 1st Wire
	If StringLen(StringReplace($sWiresWireSequence,"Y","")) < 3 Then Return "Cut the 4th Wire"										;Yellow count > 1, Cut 4th Wire
	Return "Cut the 2nd Wire"																										;else Cut 2nd Wire
EndFunc

Func _Wires_EvaluateFiveWireSequence()
	If StringRight($sWiresWireSequence,1) = "K" Then
		If Not $sWiresSerialOdd Then Return ""
		If $sWiresSerialOdd = "Y" Then Return "Cut the 4th Wire"
	EndIf																																	;Black = 5th, Is Serial Odd, Cut 4th Wire
	If StringInstr($sWiresWireSequence,"R") And StringLen(StringReplace($sWiresWireSequence,"Y","")) < 4 Then Return "Cut the 1st Wire"		;Red count = 1 and Yellow count > 1, Cut 1st Wire
	If Not StringInstr($sWiresWireSequence, "K") Then Return "Cut the 2nd Wire"																;Black = 0, Cut 2nd Wire
	Return "Cut the 1st Wire"																												;else Cut 1st Wire
EndFunc

Func _Wires_EvaluateSixWireSequence()
	If Not StringInstr($sWiresWireSequence,"Y") Then
		If Not $sWiresSerialOdd Then Return ""
		If $sWiresSerialOdd = "Y" Then Return "Cut the 3rd Wire"
	EndIf																								;Yellow count = 0, Is Serial Odd, Cut 3rd Wire
	If StringLen(StringReplace($sWiresWireSequence,"Y","")) = 5 And _
		StringLen(StringReplace($sWiresWireSequence, "W", "")) < 5 Then Return "Cut the 4th Wire"		;Yellow count = 1 and White count > 1, Cut 4th Wire
	If Not StringInstr($sWiresWireSequence, "R") Then Return "Cut the 6th Wire"							;Red = 0, Cut 6th Wire
	Return "Cut the 4th Wire"																			;else Cut 4th Wire
EndFunc
#EndRegion - Module Functions