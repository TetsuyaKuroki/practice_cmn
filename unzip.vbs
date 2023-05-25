Option Explicit

Dim fso, objShell
Set fso = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("Shell.Application")

Const sourceFolder = "" ' zipファイルが存在するフォルダ
Const unzipFolder = "" ' zipファイルを解凍するフォルダ

Dim folder, file, targetFolder

' 指定されたフォルダ内のすべてのzipファイルを解凍する
Set folder = fso.GetFolder(sourceFolder)
For Each file In folder.Files
    If LCase(fso.GetExtensionName(file)) = "zip" Then
        Set targetFolder = objShell.NameSpace(unzipFolder)
        If Not targetFolder Is Nothing Then
            targetFolder.CopyHere objShell.NameSpace(file.Path).Items
        End If
    End If
Next

WScript.Echo "NormalEnd"
