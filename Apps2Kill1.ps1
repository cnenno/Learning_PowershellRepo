## Script to target a list of applications to kill, runs the apps, then iterates through the list an kills them.

if ( Test-Path -Path "C:\Users\Student\Downloads\apps2kill.txt" )
{
    Remove-Item C:\Users\Student\Downloads\apps2kill.txt
}

#Step2
Notepad
Start-Process microsoft-edge:
$a = Get-Process -name Notepad,MicrosoftEdge 


foreach ($r in $a)
{
    $r.id >> C:\Users\Student\Downloads\apps2kill.txt
}
Start-Sleep 2
$id = Get-Content C:\Users\Student\Downloads\apps2kill.txt
Stop-Process -Id $id[0..$id.Length]
