## DO WHILE
## This script teaches you about the do-while loop
## it clears the screen, prints the description
## then starts the loop until it is not true.



$i=0
DO
{cls; Write-Host -ForegroundColor Red -NoNewline
"Do-While Loop:
    The while condition loops while true."
$i++; sleep 3
}

while ($i -lt 10)
"`n"
Write-Host Do-While Loop Complete