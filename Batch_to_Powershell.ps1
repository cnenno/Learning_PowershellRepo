## Batch to Powershell
## Using net user to create a list
## then move to powershell

net user > list.txt
$names = Get-Content .\list.txt
foreach ($line in Get-Content .\list.txt)
{
    if ($line -contains [A]) 
    { Write-Output $lines > list2.txt }
}
$y = Get-Content .\list2.txt
Write-Host $y