# Single Page - Format Preserver

Option Explicit
 
Private Sub Worksheet_Change(ByVal Target As Range)
    Dim UndoList As String
 
    Application.ScreenUpdating = False
    Application.EnableEvents = False
 
    On Error GoTo Whoa
 
    '~~> Get the undo List to capture the last action performed by user
    UndoList = Application.CommandBars("Standard").Controls("&Undo").list(1)
 
    '~~> Check if the last action was not a paste nor an autofill
    If Left(UndoList, 5) <> "Paste" And UndoList <> "Auto Fill" _
    Then GoTo LetsContinue
 
    '~~> Undo the paste that the user did but we are not clearing the
    '~~> clipboard so the copied data is still in memory
    Application.Undo
 
    If UndoList = "Auto Fill" Then Selection.Copy
 
    '~~> Do a pastespecial to preserve formats
    On Error Resume Next
    '~~> Handle text data copied from a website
    Target.Select
    ActiveSheet.PasteSpecial format:="Text", Link:=False, _
    DisplayAsIcon:=False
 
    Target.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, _
    SkipBlanks:=False, Transpose:=False
    On Error GoTo 0
 
    '~~> Retain selection of the pasted data
    Union(Target, Selection).Select
 
LetsContinue:
    Application.ScreenUpdating = True
    Application.EnableEvents = True
    Exit Sub
Whoa:
    Resume LetsContinue
End Sub

