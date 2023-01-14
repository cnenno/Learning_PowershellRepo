## Execution policy and silently use cmdlets
## This is called "do this first"
## When performing more complex actions
## it is recommended to include these cmdlets 
## to not see excessive errors
## if you know your commands will cause errors
## and you do not want to see them

Update-Help -Verbose -Force -ErrorAction SilentlyContinue
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
