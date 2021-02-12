## filter filter-ipv4
## this script looks through the Address Family
## filters out anything that is not IPv4
## and prints it to the screen.

{
    if($_.AddressFamily -eq "IPv4")
    {
        Write-Output $_
    }
}
