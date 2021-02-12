## More fun math calculator functions
## in powershell so have fun
## Holt: I specifically requested it.

function add( $a, $b ){
    Write-Host $($a + $b)
}
function subtract( $a, $b ){
    Write-Host $($a - $b)
}
function multi( $a, $b ){
    Write-Host $($a * $b)
}
function div( $a, $b ){
    Write-Host $($a / $b)
}
function modular( $a, $b ){
    Write-Host $($a % $b)
}
function expo( $a, $b ){
    Write-Host $([math]::Pow($a, $b))
}
[int]$a = Read-Host -Prompt "Gimma numba"
[int]$b = Read-Host -Prompt "Gimma nother numba"
add $a $b
subtract $a $b
multi $a $b
div $a $b
modular $a $b
expo $a $b