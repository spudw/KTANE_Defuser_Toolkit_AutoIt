#include-once
Global Const $COMPLICATEDWIRES_MSG_CUT = "Cut the Wire"
Global Const $COMPLICATEDWIRES_MSG_DONT = "Don't Cut the Wire"
Global Const $COMPLICATEDWIRES_MSG_BATTERY = "Cut the Wire if Two or More Batteries are Present"
Global Const $COMPLICATEDWIRES_MSG_PARALLEL = "Cut the Wire if a Parallel Port is Present"
Global Const $COMPLICATEDWIRES_MSG_SERIAL = "Cut the Wire is the Last Serial Digit is Even"

Func _ComplicatedWires_Eval($sWire)
	If (StringInstr($sWire, "R") And StringInstr($sWire, "B") And StringInstr($sWire, "L") And StringInstr($sWire, "S")) Then _		;RBLS = D
		Return $COMPLICATEDWIRES_MSG_DONT
	If (StringInstr($sWire, "R") And StringInstr($sWire, "B") And StringInstr($sWire, "L")) Then _									;RBL = S
		Return $COMPLICATEDWIRES_MSG_SERIAL
	If (StringInstr($sWire, "R") And StringInstr($sWire, "B") And StringInstr($sWire, "S")) Or _									;RBS = P
		(StringInstr($sWire, "B") And StringInstr($sWire, "L") And StringInstr($sWire, "S")) Or _									;BLS = P
		(StringInstr($sWire, "B") And StringInstr($sWire, "L")) Then _																;BL = P
		Return $COMPLICATEDWIRES_MSG_PARALLEL
	If 	(StringInstr($sWire, "B") And StringInstr($sWire, "S")) Or _																;BS = D
		$sWire = "L" Then _																											;L = D
		Return $COMPLICATEDWIRES_MSG_DONT
	If 	(StringInstr($sWire, "R") And StringInstr($sWire, "B")) Or _																;RB = S
		$sWire = "R" Or _																											;R = S
		$sWire = "B" Then _																											;B = S
		Return $COMPLICATEDWIRES_MSG_SERIAL
	If (StringInstr($sWire, "R") And StringInstr($sWire, "L") And StringInstr($sWire, "S")) Or _									;RLS = B
		(StringInstr($sWire, "R") And StringInstr($sWire, "L")) Or _																;RL = B
		(StringInstr($sWire, "L") And StringInstr($sWire, "S")) Then _																;LS = B
		Return $COMPLICATEDWIRES_MSG_BATTERY
	If 	(StringInstr($sWire, "R") And StringInstr($sWire, "S")) Or _																;RS = C
		$sWire = "" Or _																											;W = C
		$sWire = "S" Then _																											;S = C
		Return $COMPLICATEDWIRES_MSG_CUT
EndFunc