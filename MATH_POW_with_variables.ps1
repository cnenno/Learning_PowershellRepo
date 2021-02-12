## Math Pow with variables
## Similar script as before 
## but with more variables 
## and more math POW


[int]$base= Read-Host "Give me A NUMBA"
[int]$exp= Read-Host "Give me anotha NUMBA"

$math = [math]::Pow($base, $exp)
$math