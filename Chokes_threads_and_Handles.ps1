
## Chokes threads and Handles
## Cool script that assesses the
## Chokes and Handles of processes

$choke = $(Get-Process | Get-Random)
if ( $choke.Id -clt 100 )
{
    Write-Host "Low process ID"
}
if ( $choke.Id -gt 100 -and $choke.Id -lt 1000 )
{
    Write-Host "name" $choke.Name "sid" $choke.SI
}
if ( $choke.Threads.Count -gt 3 -and $choke.Id -gt 1000 )
{
    Write-Host "threads" $choke.Threads.Count
}
if ( $choke.Handles -gt 5 -and $choke.Id -gt 1000 )
{
    Write-Host "handles" $choke.Handles
}