Attribute VB_Name = "AppSagaCommMod"
Option Explicit

Private Declare Function GetStdHandle Lib "kernel32" (ByVal nStdHandle As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, _
    lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, _
    lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, _
    lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, _
    lpNumberOfBytesWritten As Long, lpOverlapped As Any) As Long

Private Const STD_OUTPUT_HANDLE = -11&
Private Const STD_INPUT_HANDLE = -10&

Function ReadStdIn(Optional ByVal NumBytes As Long = -1) As String
    Dim StdIn As Long
    Dim result As Long
    Dim Buffer As String
    Dim BytesRead As Long
    StdIn = GetStdHandle(STD_INPUT_HANDLE)
    Buffer = Space$(1024)
    Do
        result = ReadFile(StdIn, ByVal Buffer, Len(Buffer), BytesRead, ByVal 0&)
        If result = 0 Then
            Err.Raise 1001, , "Unable to read from standard input"
        End If
        ReadStdIn = ReadStdIn & Left$(Buffer, BytesRead)
    Loop Until BytesRead < Len(Buffer)
End Function

Sub WriteStdOut(ByVal Text As String)
    Dim StdOut As Long
    Dim result As Long
    Dim BytesWritten As Long
    StdOut = GetStdHandle(STD_OUTPUT_HANDLE)
    result = WriteFile(StdOut, ByVal Text, Len(Text), BytesWritten, ByVal 0&)
    If result = 0 Then
        Err.Raise 1001, , "Unable to write to standard output"
    ElseIf BytesWritten < Len(Text) Then
        Err.Raise 1002, , "Incomplete write operation"
    End If
End Sub

Sub Main()
Dim cmd2exec As String
Dim exista_erori As String
Dim errfile As String
Dim result As String
Dim is_ready As String
Dim dummy As Boolean

errfile = App.Path & "\erori.err"

'primim comanda de executat
cmd2exec = Command()

'stergem fisierul erori.err, daca acesta exista
exista_erori = Dir(errfile)
If exista_erori <> "" Then Kill errfile

'lansam comanda si asteptam sa dispara busy.txt
dummy = Shell(cmd2exec, vbHide)
Do
is_ready = Dir(App.Path & "\busy.sem")
Loop Until is_ready = ""

Open errfile For Input As #1
Line Input #1, result
Close #1
DoEvents
If result <> "0 OK" Then
    WriteStdOut ("APPSAGACOMM-ERR")
Else
    WriteStdOut ("APPSAGACOMM-OK")
End If
End Sub
