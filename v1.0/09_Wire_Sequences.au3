#include-once
#Region - Constants and Variables
Global Enum $WIRESEQUENCES_RED_WIRE = 1, $WIRESEQUENCES_BLUE_WIRE, $WIRESEQUENCES_BLACK_WIRE, $WIRESEQUENCES_WIRES	;Wires (Red = 1, BLUE = 2, BLACK = 3)
Global Enum Step * 2 $WIRESEQUENCES_A_CONN, $WIRESEQUENCES_B_CONN, $WIRESEQUENCES_C_CONN 			;Connection Points (A = 1, B = 2, C = 4)
Global Const $WIRESEQUENCES_OCCURRENCES_MAX = 9 								;Max Wire Occurrences
Global Static $aWireSequencesSolutions[$WIRESEQUENCES_WIRES][$WIRESEQUENCES_OCCURRENCES_MAX] = [[$WIRESEQUENCES_C_CONN, $WIRESEQUENCES_B_CONN, $WIRESEQUENCES_A_CONN, _	;Red Solutions 1 - 3 (c,b,a)
		$WIRESEQUENCES_A_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_B_CONN, $WIRESEQUENCES_A_CONN + $WIRESEQUENCES_C_CONN, _								 	;Red Solutions 4 - 6 (ac, b, ac)
		$WIRESEQUENCES_A_CONN + $WIRESEQUENCES_B_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_A_CONN + $WIRESEQUENCES_B_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_B_CONN], _ 	 	;Red Solutions 7 - 9 (abc, abc, b)
		[$WIRESEQUENCES_B_CONN, $WIRESEQUENCES_A_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_B_CONN, _											 	;Blue Solutions 1 - 3 (b, ac, b)
		$WIRESEQUENCES_A_CONN, $WIRESEQUENCES_B_CONN, $WIRESEQUENCES_B_CONN + $WIRESEQUENCES_C_CONN, _											 	;Blue Solutions 4 - 6 (a, b, bc)
		$WIRESEQUENCES_C_CONN, $WIRESEQUENCES_A_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_A_CONN], _											 	;Blue Solutions 7 - 9 (c, ac, a)
		[$WIRESEQUENCES_A_CONN + $WIRESEQUENCES_B_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_A_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_B_CONN, _				 	;Black Solutions 1 - 3 (abc, ac, b)
		$WIRESEQUENCES_A_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_B_CONN, $WIRESEQUENCES_B_CONN + $WIRESEQUENCES_C_CONN, _								 	;Black Solutions 4 - 6 (ac, b, bc)
		$WIRESEQUENCES_A_CONN + $WIRESEQUENCES_B_CONN + $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_C_CONN, $WIRESEQUENCES_C_CONN]] 								 	;Black Solutions 7 - 9 (abc, c, c)
Global Static $aWireSequencesWireColorNames[4] = [Null, "Red", "Blue", "Black"]	 	;Wire Color Strings
Global Static $aWireSequencesConnectionNames[5] = [Null, "A", "B", Null, "C"]	;Connection Points Strings
Global Const $WIRESEQUENCES_MSG_CUT = "Cut the wire"						 	;Cut the wire Message
Global Const $WIRESEQUENCES_MSG_DONT = "Don't " & StringLower($WIRESEQUENCES_MSG_CUT)  	;Don't cut the wire Message
Global $aWireSequencesOccurrenceTracker[$WIRESEQUENCES_WIRES]							 	;Wire Occurrences Tracker (zero-based)
Global $aWireSequencesInputs[$WIRESEQUENCES_WIRES][$WIRESEQUENCES_OCCURRENCES_MAX]				 	;Inputs Tracker
#EndRegion - Constants and Variables


#Region - Module Functions
Func _WireSequences_InputEval($iWireColor, $iWireConnection, $iWireOccurrence)		;Evaluate Wire Occurrence Connection Point Value
	If BitAND($iWireConnection, $aWireSequencesSolutions[$iWireColor][$iWireOccurrence]) = $iWireConnection Then Return $WIRESEQUENCES_MSG_CUT
	Return $WIRESEQUENCES_MSG_DONT
EndFunc   ;==>_WireSequences_InputEval
#EndRegion - Module Functions
