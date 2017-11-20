#include-once
Global Const $COMPLICATEDWIRES_MSG_CUT = "Cut the Wire"
Global Const $COMPLICATEDWIRES_MSG_DONT = "Don't Cut the Wire"
Global Const $COMPLICATEDWIRES_MSG_BATTERY = "Cut the Wire if Two or More Batteries are Present"
Global Const $COMPLICATEDWIRES_MSG_PARALLEL = "Cut the Wire if a Parallel Port is Present"
Global Const $COMPLICATEDWIRES_MSG_SERIAL = "Cut the Wire is the Last Serial Digit is Even"

Func _ComplicatedWires_Eval($sWire)
	If (StringInstr($sWire, "R") And StringInstr($sWire, "B") And StringInstr($sWire, "L") And StringInstr($sWire, "S")) Then _
		Return $COMPLICATEDWIRES_MSG_DONT
	If (StringInstr($sWire, "R") And StringInstr($sWire, "B") And StringInstr($sWire, "L")) Then _
		Return $COMPLICATEDWIRES_MSG_SERIAL
	If (StringInstr($sWire, "R") And StringInstr($sWire, "B") And StringInstr($sWire, "S")) Or _
		(StringInstr($sWire, "B") And StringInstr($sWire, "L") And StringInstr($sWire, "S")) Or _
		(StringInstr($sWire, "B") And StringInstr($sWire, "L")) Then _
		Return $COMPLICATEDWIRES_MSG_PARALLEL
	If 	(StringInstr($sWire, "B") And StringInstr($sWire, "S")) Or _
		(StringInstr($sWire, "R") And StringInstr($sWire, "L") And StringInstr($sWire, "S")) Or _
		$sWire = "L" Then _
		Return $COMPLICATEDWIRES_MSG_DONT
	If 	(StringInstr($sWire, "R") And StringInstr($sWire, "B")) Or _
		$sWire = "R" Or _
		$sWire = "B" Then _
		Return $COMPLICATEDWIRES_MSG_SERIAL
	If (StringInstr($sWire, "R") And StringInstr($sWire, "L")) Or _
		(StringInstr($sWire, "L") And StringInstr($sWire, "S")) Then _
		Return $COMPLICATEDWIRES_MSG_BATTERY
	If (StringInstr($sWire, "R") And StringInstr($sWire, "S")) Or _
		$sWire = "" Or _
		$sWire = "S" Then _
		Return $COMPLICATEDWIRES_MSG_CUT
EndFunc