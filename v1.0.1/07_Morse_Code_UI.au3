Func _MorseCode_UI_Create()
	$idTabMorseCode = GUICtrlCreateTabItem("Morse Code")
	$idGrpMorseCode = GUICtrlCreateGroup("Use this chart to decode the message", 40, 40, 529, 369)
	GUICtrlSetFont(-1, 11, 400, 0, "Calibri")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlCreateLabel("-  ·-·  ··  -·-·  -", 120, 56, 298, 25)	;trick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.532 MHz", 48, 58, 66, 22)

	GUICtrlCreateLabel("···  -  ·  ·-  -·-", 117, 76, 298, 25)	;steak
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.582 MHz", 48, 80, 66, 22)

	GUICtrlCreateLabel("···  -  ··  -·  --·", 117, 98, 298, 25)	;sting
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.592 MHz", 48, 102, 66, 22)

	GUICtrlCreateLabel("···  -  ·-·  ---  -···  ·", 117, 120, 400, 25)	;strobe
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.545 MHz", 48, 124, 66, 22)

	GUICtrlCreateLabel("···  ····  ·  ·-··  ·-··", 117, 142, 400, 25)	;shell
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.505 MHz", 48, 146, 66, 22)

	GUICtrlCreateLabel("···  ·-··  ··  -·-·  -·-", 117, 164, 400, 25)	;slick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.522 MHz", 48, 168, 66, 22)

	GUICtrlCreateLabel("····  ·-  ·-··  ·-··  ···", 117, 186, 400, 25)	;halls
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.515 MHz", 48, 190, 66, 22)

	GUICtrlCreateLabel("-···  ·  ·-  -  ···", 120, 209, 400, 25)	;beats
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.600 MHz", 48, 212, 66, 22)

	GUICtrlCreateLabel("-···  ··  ···  -  ·-·  ---", 120, 231, 400, 25)	;bistro
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.552 MHz", 48, 234, 66, 22)

	GUICtrlCreateLabel("-···  ---  --  -···  ···", 120, 253, 400, 25)	;bombs
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.565 MHz", 48, 256, 66, 22)

	GUICtrlCreateLabel("-···  ---  -··-  ·  ···", 120, 275, 400, 25)	;boxes
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.535 MHz", 48, 278, 66, 22)

	GUICtrlCreateLabel("-···  ·-·  ·  ·-  -·-", 120, 297, 400, 25)	;break
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.572 MHz", 48, 300, 66, 22)

	GUICtrlCreateLabel("-···  ·-·  ··  -·-·  -·-", 120, 319, 400, 25)	;brick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.575 MHz", 48, 322, 66, 22)

	GUICtrlCreateLabel("·-··  ·  -·  -·-  ···", 117, 340, 400, 25)	;leaks
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.542 MHz", 48, 344, 66, 22)

	GUICtrlCreateLabel("··-·  ·-··  ··  -·-·  -·-", 117, 362, 400, 25)	;flick
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.555 MHz", 48, 366, 66, 22)

	GUICtrlCreateLabel("···-  ·  -·-·  -  ---  ·-·", 117, 384, 400, 25)	;vector
	GUICtrlSetFont(-1, 16, 800, 0, "Lucida Console")
	GUICtrlCreateLabel("3.595 MHz", 48, 388, 66, 22)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc   ;==>_MorseCode_UI_Create
