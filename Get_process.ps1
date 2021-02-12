
## Get-Process learning
## Clean way to learn a few of the ways
## to use options with Get-Process
## and get a crisp list

Get-Process |
    Select Handles, NPM, ID, ProcessName |
    Sort ID -Unique |
    Format-Table * -AutoSize 