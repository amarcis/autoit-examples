#include <GUIConstantsEx.au3>
#include <EventLog.au3>

Global $iMemo

Example()

Func Example()
	Local $hEventLog

	; Create GUI
	GUICreate("EventLog", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 300, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	$hEventLog = _EventLog__Open("", "Application")
	MemoWrite("Log full ........: " & _EventLog__Full($hEventLog))
	MemoWrite("Log record count : " & _EventLog__Count($hEventLog))
	MemoWrite("Log oldest record: " & _EventLog__Oldest($hEventLog))
	_EventLog__Close($hEventLog)

	; Loop until the user exits.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Write a line to the memo control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
