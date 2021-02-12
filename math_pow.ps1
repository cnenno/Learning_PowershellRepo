## Simple Math Power Script to show how to use Math Pow
## MATH POW

foreach ($number in 1..100)
{
write-host $([math]::Pow($number, 2))
}