#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ------------
    Copyright (C) 2011 by Zakaria Almatar, Husain Al-Matar, and Osamh Hamali
	License can be found at https://github.com/zak22/FTVisualizer/wiki/License
#ce ------------

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#Include <String.au3>

; code start here
Global $msg,$guiW=685,$guiH=380

$gui = GUICreate("FTVisualizer", $guiW, $guiH, -1, -1, -1, $WS_EX_TOPMOST)
GUISetBkColor(0xCCBA96)

GUICtrlCreateLabel("FTVisualizer",10,10,120)
GUICtrlSetFont(-1, 15,800)

; birth gui elements
Global $gBirthH=50, $gBirthW=15
$gBirth = GUICtrlCreateRadio("Birth:",15,$gBirthH, 55)
GUICtrlSetFont(-1, 10,700)
GUICtrlSetState(-1,$GUI_CHECKED)
GUICtrlCreateLabel("Date",95,$gBirthH+4)
$gBirthDate = GUICtrlCreateInput("",120,$gBirthH,65)
GUICtrlCreateLabel("Name",205,$gBirthH+4)
$gBirthName = GUICtrlCreateInput("",235,$gBirthH,65)
GUICtrlCreateLabel("Gender",320,$gBirthH+4)
$gBirthGender = GUICtrlCreateInput("",358,$gBirthH,65)
GUICtrlCreateLabel("Father",445,$gBirthH+4)
$gBirthFather = GUICtrlCreateInput("",478,$gBirthH,65)
GUICtrlCreateLabel("Mother",565,$gBirthH+4)
$gBirthMother = GUICtrlCreateInput("",600,$gBirthH,65)

; Marriage gui elements
$gMarriageH = 90
$gMarriage = GUICtrlCreateRadio("Marriage:",15,$gMarriageH, 80)
GUICtrlSetFont(-1, 10,700)
GUICtrlCreateLabel("Date",95,$gMarriageH+4)
$gMarriageDate = GUICtrlCreateInput("",120,$gMarriageH,65)
GUICtrlCreateLabel("Name",205,$gMarriageH+4)
$gMarriageName = GUICtrlCreateInput("",235,$gMarriageH,65)
GUICtrlCreateLabel("Partner",320,$gMarriageH+4)
$gMarriagePartner = GUICtrlCreateInput("",358,$gMarriageH,65)
GUICtrlCreateLabel("Birthday",445,$gMarriageH+4)
$gMarriageBirthday = GUICtrlCreateInput("",485,$gMarriageH,65)

; divorce gui elements
$gDivorceH = 130
$gDivorce = GUICtrlCreateRadio("Divorce:",15,$gDivorceH, 70)
GUICtrlSetFont(-1, 10,700)
GUICtrlCreateLabel("Date",95,$gDivorceH+4)
$gDivorceDate = GUICtrlCreateInput("",120,$gDivorceH,65)
GUICtrlCreateLabel("Name",205,$gDivorceH+4)
$gDivorceName = GUICtrlCreateInput("",235,$gDivorceH,65)
GUICtrlCreateLabel("Partner",320,$gDivorceH+4)
$gDivorcePartner= GUICtrlCreateInput("",358,$gDivorceH,65)

; death gui elements
$gDeathH = 170
$gDeath = GUICtrlCreateRadio("Death:",15,$gDeathH, 60)
GUICtrlSetFont(-1, 10,700)
GUICtrlCreateLabel("Date",95,$gDeathH+4)
$gDeathDate = GUICtrlCreateInput("",120,$gDeathH,65)
GUICtrlCreateLabel("Name",205,$gDeathH+4)
$gDeathName = GUICtrlCreateInput("",235,$gDeathH,65)


; here is edited box
$gEdit = GUICtrlCreateEdit("",($guiW/2)-320,220,640,100)

; add button
$gAdd = GUICtrlCreateButton("Add",($guiW/2)-75,340,70, 30)

; draw button
$gDraw = GUICtrlCreateButton("Draw",($guiW/2),340,70, 30)



GUISetState()
while 1
	$msg = GUIGetMsg()

	Switch $msg
		Case $gAdd
			_add()
		Case $GUI_EVENT_CLOSE
			Exit
        Case $gDraw
           _draw()
	EndSwitch
	sleep(30)
	_update()
WEnd
    GUISetState(@SW_HIDE)

; updates ui elements (disable/enable)
Func _update()
	If GUICtrlRead($gBirth) = $GUI_UNCHECKED  And GUICtrlGetState($gBirthDate) = 80 Then
		GUICtrlSetState($gBirthDate, $GUI_DISABLE)
		GUICtrlSetState($gBirthName, $GUI_DISABLE)
		GUICtrlSetState($gBirthFather, $GUI_DISABLE)
		GUICtrlSetState($gBirthGender, $GUI_DISABLE)
		GUICtrlSetState($gBirthMother, $GUI_DISABLE)
	ElseIf GUICtrlRead($gBirth) = $GUI_CHECKED  And GUICtrlGetState($gBirthDate) <> 80 Then
		GUICtrlSetState($gBirthDate, $GUI_ENABLE)
		GUICtrlSetState($gBirthName, $GUI_ENABLE)
		GUICtrlSetState($gBirthFather, $GUI_ENABLE)
		GUICtrlSetState($gBirthGender, $GUI_ENABLE)
		GUICtrlSetState($gBirthMother, $GUI_ENABLE)
	EndIf
	If GUICtrlRead($gMarriage) = $GUI_UNCHECKED  And GUICtrlGetState($gMarriageDate) = 80 Then
		GUICtrlSetState($gMarriageDate, $GUI_DISABLE)
		GUICtrlSetState($gMarriageName, $GUI_DISABLE)
		GUICtrlSetState($gMarriagePartner, $GUI_DISABLE)
		GUICtrlSetState($gMarriageBirthday, $GUI_DISABLE)
	ElseIf GUICtrlRead($gMarriage) = $GUI_CHECKED  And GUICtrlGetState($gMarriageDate) <> 80 Then
		GUICtrlSetState($gMarriageDate, $GUI_ENABLE)
		GUICtrlSetState($gMarriageName, $GUI_ENABLE)
		GUICtrlSetState($gMarriagePartner, $GUI_ENABLE)
		GUICtrlSetState($gMarriageBirthday, $GUI_ENABLE)
	EndIf
	If GUICtrlRead($gDivorce) = $GUI_UNCHECKED  And GUICtrlGetState($gDivorceDate) = 80 Then
		GUICtrlSetState($gDivorceDate, $GUI_DISABLE)
		GUICtrlSetState($gDivorceName, $GUI_DISABLE)
		GUICtrlSetState($gDivorcePartner, $GUI_DISABLE)
	ElseIf GUICtrlRead($gDivorce) = $GUI_CHECKED  And GUICtrlGetState($gDivorceDate) <> 80 Then
		GUICtrlSetState($gDivorceDate, $GUI_ENABLE)
		GUICtrlSetState($gDivorceName, $GUI_ENABLE)
		GUICtrlSetState($gDivorcePartner, $GUI_ENABLE)
	EndIf
	If GUICtrlRead($gDeath) = $GUI_UNCHECKED  And GUICtrlGetState($gDeathDate) = 80 Then
		GUICtrlSetState($gDeathDate, $GUI_DISABLE)
		GUICtrlSetState($gDeathName, $GUI_DISABLE)
	ElseIf GUICtrlRead($gDeath) = $GUI_CHECKED  And GUICtrlGetState($gDeathDate) <> 80 Then
		GUICtrlSetState($gDeathDate, $GUI_ENABLE)
		GUICtrlSetState($gDeathName, $GUI_ENABLE)
	EndIf
EndFunc

;adds an event to the edit box
Func _add()
	$results = GUICtrlRead($gEdit)
	If $results <> "" Then $results &= @CRLF

	; adds birth info to edit box
	If GUICtrlRead($gBirth) = $GUI_CHECKED Then
		$results &= GUICtrlRead($gBirthDate) & ",1," & GUICtrlRead($gBirthName) & "," & GUICtrlRead($gBirthGender) & ","
		If GUICtrlRead($gBirthFather) = "" Then
			$results &= "0,"
		Else
			$results &= GUICtrlRead($gBirthFather)&","
		EndIf
		If GUICtrlRead($gBirthMother) = "" Then
			$results &= "0"
		Else
			$results &= GUICtrlRead($gBirthMother)
		EndIf

	; adds marriage info to edit box
	ElseIf GUICtrlRead($gMarriage) = $GUI_CHECKED Then
		$results &= GUICtrlRead($gMarriageDate) & ",2," & GUICtrlRead($gMarriageName) & "," & GUICtrlRead($gMarriagePartner) & ","
		If GUICtrlRead($gMarriageBirthday) = "" Then
			$results &= "0,"
		Else
			$results &= GUICtrlRead($gMarriageBirthday)
		EndIf

	; adds divorce info to edit box
	ElseIf GUICtrlRead($gDivorce) = $GUI_CHECKED Then
		$results &= GUICtrlRead($gDivorceDate) & ",3," & GUICtrlRead($gDivorceName) & "," & GUICtrlRead($gDivorcePartner)

	; adds death info to edit box
	ElseIf GUICtrlRead($gDeath) = $GUI_CHECKED Then
		$results &= GUICtrlRead($gDeathDate) & ",4," & GUICtrlRead($gDeathName)
	EndIf

	GUICtrlSetData($gEdit,$results)

EndFunc


Func _draw()
	$results = GUICtrlRead($gEdit)
	$hfile = FileOpen("events",2)
	FileWrite($hfile, $results)
	Fileclose($hfile)

	ShellExecute("FTVisualizer.exe","events")
EndFunc
