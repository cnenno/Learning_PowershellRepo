## do until loop
## This script is to teach about do-until loops
## really straight forward, clears previous screen
## prints the explanation
## then it conducts the loop until it hits the "until!"


$i =0
DO
{cls; Write-Host
"Do-Until Loop:
    This loop will execute at least one time. It isn't until the
    end of this loop that the keyword `"Until`" is checked, if the 
    expression (`$i -eq 10) is FALSE, the loop repeats."
$i++; sleep 3
}
Until ($i -eq 10)
"`n"
Write-host Do-Until Loop Complete