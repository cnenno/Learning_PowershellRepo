## Silly Calculator
## Just a function math calculator in PS




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

function CalcMenu
{
    Param (
        [string]$Title = 'CalCuLator!'
    )
    Write-Host "~~~~~~~~$Title~~~~~~~~"

    Write-Host "1: Press '1' for addition."
    Write-Host "2: Press '2' for subtraction."
    Write-Host "3: Press '3' for multiplication."
    Write-Host "4: Press '4' for division."
    Write-Host "5: Press '5' for modulus."
    Write-Host "6: Press '6' for exponents."
    Write-Host "q: Press 'q' to quit like a b."
}
do
{
CalcMenu -Title 'My Menu'
$selection = Read-Host "Please make a selection"
switch ($selection)
{
    '1' {
        Write-Host 'You chose addition'
        [int]$a = Read-Host -Prompt "Gimma numba"
        [int]$b = Read-Host -Prompt "Gimma nother numba"
        add $a $b
    }
    '2' {
        Write-Host 'You chose subtraction'
        [int]$a = Read-Host -Prompt "Gimma numba"
        [int]$b = Read-Host -Prompt "Gimma nother numba"
        subtract $a $b
    }
    '3' {
        Write-Host 'You chose multiplication'
        [int]$a = Read-Host -Prompt "Gimma numba"
        [int]$b = Read-Host -Prompt "Gimma nother numba"
        multi $a $b
    }
    '4' {
        Write-Host 'You chose division'
        [int]$a = Read-Host -Prompt "Gimma numba"
        [int]$b = Read-Host -Prompt "Gimma nother numba"
        div $a $b
    }
    '5' {
        Write-Host 'You chose modulus'
        [int]$a = Read-Host -Prompt "Gimma numba"
        [int]$b = Read-Host -Prompt "Gimma nother numba"
        modular $a $b
    }
    '6' {
        Write-Host 'You chose exponents'
        [int]$a = Read-Host -Prompt "Gimma numba"
        [int]$b = Read-Host -Prompt "Gimma nother numba"
        expo $a $b
    }
    'q' {
        'You chose option q to quit like b'
    }
}
}
until ($selection -eq 'q')







