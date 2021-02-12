## Powershell with regex practice
## using powershell variables with regex
## to measure the length of a variable

$first = "looooooooooooooongname"

switch -Regex ($first.Length)
{
    { $_ -gt 5 } { Write-Host "$first is a long name" }
    { $_ -gt 10 } { Write-Host "$first is a really long name"; break}
    default { Write-Host "$first is a short name" }
}