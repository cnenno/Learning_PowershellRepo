## Super simple ping through PS

"8.8.8.8
8.8.4.4
9.9.9.9" > C:\Users\Student\Downloads\file.txt
foreach ($ip in $(Get-Content C:\Users\Student\Downloads\file.txt))
{
    ping -n 1 $ip
}