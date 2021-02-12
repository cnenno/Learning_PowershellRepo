## Friendly Greeting Script
## This is a simple script that 
## Based on the time of day pulled from your computer
## Will greet you!

function friendlydate{
param ([int]$time, [switch]$output)
if ( $time -ge 0600 -and $time -le 1159 )
{
    Write-Output "Good Morning"
    if ( $output ) {Write-Host "Good Morning"}
}
elseif ( $time -ge 1200 -and $time -le 1659 )
{
    Write-Output "Good afternoon"
    if ( $output ) {Write-Host "Good Afternoon"}
}
elseif ( $time -ge 1700 -and $time -le 2159 )
{
    Write-Output "Good evening"
    if ( $output ) {Write-Host "Good Evening"}
}
elseif ( $time -ge 2200 -and $time -le 2400 -or $time -le 0559 )
{
    Write-Output "Good night"
    if ( $output ) {Write-Host "Good Night"}
}
else {
    Write-Output "Good day" 
    Write-Host "Good Day"}
}


$a = read-host "time"
[string]$b = friendlydate $a -output
