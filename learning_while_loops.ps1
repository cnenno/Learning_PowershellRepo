
## while loop
## another learning script for while loops
## this one is based on what number
## the input variable is

$i=0
while ($i -lt 10)
{cls; Write-Host
"While Loop:
    This loop isn't guaranteed to execute. It will execute only if
    the While Expression (`$i -lt 10) is TRUE to begin with. The loop will
    continue while that expression remains TRUE."
$i++; sleep 3
}
"`n"
Write-Host while loop complete