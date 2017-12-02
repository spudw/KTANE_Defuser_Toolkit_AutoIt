#include <array.au3>
#Region - Constants and Variables
Global Const $WHOSONFIRST_TL = "Top Left"
Global Const $WHOSONFIRST_TR = "Top Right"
Global Const $WHOSONFIRST_ML = "Middle Left"
Global Const $WHOSONFIRST_MR = "Middle Right"
Global Const $WHOSONFIRST_BL = "Bottom Left"
Global Const $WHOSONFIRST_BR = "Bottom Right"
Global Static $aWhosOnFirstDisplayWords[]=[" ", "BLANK", "C", "CEE", "DISPLAY", "FIRST", "HOLD ON", "LEAD", "LED", "LEED", "NO", "NOTHING", "OKAY", "READ", _
	"RED", "REED", "SAYS", "SEE", "THEIR", "THERE", "THEY ARE", "THEY'RE", "UR", "YES", "YOU", "YOU ARE", "YOUR", "YOU'RE"]
Global Static $aWhosOnFirstDisplayWordsButton[]=[$WHOSONFIRST_BL, $WHOSONFIRST_MR, $WHOSONFIRST_TR, $WHOSONFIRST_BR, $WHOSONFIRST_BR, $WHOSONFIRST_TR, _
	$WHOSONFIRST_BR, $WHOSONFIRST_BR, $WHOSONFIRST_ML, $WHOSONFIRST_BL, $WHOSONFIRST_BR, $WHOSONFIRST_ML, _
	$WHOSONFIRST_TR, $WHOSONFIRST_MR, $WHOSONFIRST_MR, $WHOSONFIRST_BL, $WHOSONFIRST_BR, $WHOSONFIRST_BR, _
	$WHOSONFIRST_MR, $WHOSONFIRST_BR, $WHOSONFIRST_ML, $WHOSONFIRST_BL, $WHOSONFIRST_TL, $WHOSONFIRST_ML, _
	$WHOSONFIRST_MR, $WHOSONFIRST_BR, $WHOSONFIRST_MR, $WHOSONFIRST_MR]
Global Static $aWhosOnFirstWordList[] = ["BLANK","DONE","FIRST","HOLD","LEFT", _	;0-4
	"LIKE","MIDDLE","NEXT","NO","NOTHING", _	;5-9
	"OKAY", "PRESS","READY","RIGHT","SURE", _	;10-14
	"U","UH","UH UH","UH HUH","UHHH", _	;15-19
	"UR","WAIT","WHAT","WHAT?","YES", _	;20-24
	"YOU","YOU ARE","YOUR","YOU'RE"]	;25-28
Global Static $aWhosOnFirstWordListWords[][14] = [[21,13,10,6,0,Null,Null,Null,Null,Null,Null,Null,Null,Null],[14,18,7,23,27,20,28,3,5,25,15,26,17,1], _	;0-1
	[4,10,24,6,8,13,9,19,21,12,0,22,11,2],[23,18,17,27,3,Null,Null,Null,Null,Null,Null,Null,Null,Null],[13,4,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null], _	;2-4
	[28,7,15,20,3,1,17,23,18,25,5,Null,Null,Null],[0,12,10,22,9,11,8,21,4,6,Null,Null,Null,Null], _	;5-6
	[23,18,17,27,3,14,7,Null,Null,Null,Null,Null,Null,Null],[0,19,21,2,22,12,13,24,9,4,11,10,8,Null],[19,13,10,6,24,0,8,11,4,22,21,2,9,Null], _	;7-9
	[6,8,2,24,19,9,21,10,Null,Null,Null,Null,Null,Null],[13,6,24,12,11,Null,Null,Null,Null,Null,Null,Null,Null,Null], _	;10-11
	[24,10,22,6,4,11,13,0,12,Null,Null,Null,Null,Null],[24,9,12,11,8,21,22,13,Null,Null,Null,Null,Null,Null],[26,1,5,28,25,3,18,20,14,Null,Null,Null,Null,Null], _	;12-14
	[18,14,7,23,28,20,17,1,15,Null,Null,Null,Null,Null],[16,16,16,16,16,16,16,16,16,16,16,16,16,16], _	;15-16
	[20,15,26,28,7,17,Null,Null,Null,Null,Null,Null,Null,Null],[18,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null],[12,9,4,22,10,24,13,8,11,0,19,Null,Null,Null], _	;17-19
	[1,15,20,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null],[19,8,0,10,24,4,2,11,22,21,Null,Null,Null,Null], _	;20-21
	[19,22,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null],[25,3,28,27,15,1,17,5,26,18,20,7,23,Null],[10,13,19,6,2,22,11,12,9,24,Null,Null,Null,Null], _	;22-24
	[14,26,27,28,7,18,20,3,23,25,Null,Null,Null,Null],[27,7,5,18,23,1,17,3,25,15,28,14,20,26], _	;25-26
	[17,26,18,27,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null],[25,28,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null,Null]]	;27-28
#EndRegion - Constants and Variables