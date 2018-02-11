Func _MorseCode_UI_Create()
	$idTabMorseCode = GUICtrlCreateTabItem("Morse Code")
	$idGrpMorseCode = GUICtrlCreateGroup("Use this chart to decode the message", 140, 40, 529, 369)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("-  ·-·  ··  -·-·  -", 220, 56, 298, 25)	;trick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.532 MHz", 148, 58, 66, 22)

	GUICtrlCreateLabel("···  -  ·  ·-  -·-", 217, 76, 298, 25)	;steak
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.582 MHz", 148, 80, 66, 22)

	GUICtrlCreateLabel("···  -  ··  -·  --·", 217, 98, 298, 25)	;sting
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.592 MHz", 148, 102, 66, 22)

	GUICtrlCreateLabel("···  -  ·-·  ---  -···  ·", 217, 120, 400, 25)	;strobe
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.545 MHz", 148, 124, 66, 22)

	GUICtrlCreateLabel("···  ····  ·  ·-··  ·-··", 217, 142, 400, 25)	;shell
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.505 MHz", 148, 146, 66, 22)

	GUICtrlCreateLabel("···  ·-··  ··  -·-·  -·-", 217, 164, 400, 25)	;slick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.522 MHz", 148, 168, 66, 22)

	GUICtrlCreateLabel("····  ·-  ·-··  ·-··  ···", 217, 186, 400, 25)	;halls
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.515 MHz", 148, 190, 66, 22)

	GUICtrlCreateLabel("-···  ·  ·-  -  ···", 220, 209, 400, 25)	;beats
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.600 MHz", 148, 212, 66, 22)

	GUICtrlCreateLabel("-···  ··  ···  -  ·-·  ---", 220, 231, 400, 25)	;bistro
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.552 MHz", 148, 234, 66, 22)

	GUICtrlCreateLabel("-···  ---  --  -···  ···", 220, 253, 400, 25)	;bombs
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.565 MHz", 148, 256, 66, 22)

	GUICtrlCreateLabel("-···  ---  -··-  ·  ···", 220, 275, 400, 25)	;boxes
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.535 MHz", 148, 278, 66, 22)

	GUICtrlCreateLabel("-···  ·-·  ·  ·-  -·-", 220, 297, 400, 25)	;break
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.572 MHz", 148, 300, 66, 22)

	GUICtrlCreateLabel("-···  ·-·  ··  -·-·  -·-", 220, 319, 400, 25)	;brick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.575 MHz", 148, 322, 66, 22)

	GUICtrlCreateLabel("·-··  ·  -·  -·-  ···", 217, 340, 400, 25)	;leaks
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.542 MHz", 148, 344, 66, 22)

	GUICtrlCreateLabel("··-·  ·-··  ··  -·-·  -·-", 217, 362, 400, 25)	;flick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.555 MHz", 148, 366, 66, 22)

	GUICtrlCreateLabel("···-  ·  -·-·  -  ---  ·-·", 217, 384, 400, 25)	;vector
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.595 MHz", 148, 388, 66, 22)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc   ;==>_MorseCode_UI_Create
