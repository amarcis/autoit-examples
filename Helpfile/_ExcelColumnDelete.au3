; Write to a Cell using a Loop, after opening a workbook and returning its object identifier.  Delete 1 Column, then Save and Close file.

#include <Excel.au3>
#include <MsgBoxConstants.au3>

Local $oExcel = _ExcelBookNew() ;Create new book, make it visible

For $i = 1 To 5 ;Loop
	_ExcelWriteCell($oExcel, $i, 1, $i) ;Write to the Cell Horizontally using values 1 to 5
Next

ToolTip("Deleting Column Soon...")
Sleep(3500)

_ExcelColumnDelete($oExcel, 1, 1) ;Delete Column 1 and only delete 1 column

MsgBox($MB_SYSTEMMODAL, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; Now we save it into the temp directory; overwrite existing file if necessary
_ExcelBookClose($oExcel) ; And finally we close out
