# PowerShell Step by step 
# PowerShell Providers:
#
# This script is for tutorial purposes ONLY
# You may need to make corrections to some of the 
# lines in order to make them work on your VM or 
# home PC. Make sure not to run cmdlets directly
# against your system when possible!


Get-ChildItem C:\Users -Directory 
Get-ChildItem C:\Users | Where-Object {$_.PSIsContainer eq $true}
Get-ChildItem C:\Users | Where-Object {$_.Mode -like '*R*'}

Test-path C:\Users\

Get-Process | Where-Object {$_.ProcessName -Match "^pw.*"}
Get-Process | Where-Object {($_.Name -eq "MSEdge") -or ($_.Name -eq "chrome") -or ($_.Name -eq "firefox")}



# Understanding the Alias Provider
# Get-PSProvider lists providers installed with windows powershell
Get-PSProvider 

# Use Set-Location alias to change PowerShell Drive "Alias" Provider
#
# NOTE:
#  When using the Set-Location cmdlet to switch to a different PS drive, 
#  you must follow the name of the PS drive with a colon. 
#  A trailing forward slash or backward slash is optional. 
#
### PowerPoint Demo Page 66
sl alias:\

# Get-ChildItem alias gci
gci

# Where-Object cmdlet filter
gci | Where-Object name -like "s*"

# Get-ChildItem piped into Get-Member
Get-ChildItem | Get-Member

# Use Where-Object filter with definition "set*"
gci | Where-Object definition -like "set*"

# Where-Object filter "*w*"
gci | Where-Object name -like "*w*"

# Creating a new Alias
New-Item -Name listing -Value Get-ChildItem -Confirm
New-Item -Name listing -Value Get-ChildItem -WhatIf
Listing
#################################################################################
# Understanding the certificate provider
#

# Get-Help about_providers you can use wild cards to find the provider
Get-Help  *cer*
Set-Location cert:\ 

### Searching for specific certificates
dir Cert:\CurrentUser -Recurse | ? subject –match 'symantec'

### Deleting Certificates
dir Cert:\CurrentUser -Recurse | ? subject -match 'Symantec' | Remove-Item –WhatIf


# Use Set-Location alias to change PowerShell Drive "Cert" Provider
Set-Location cert:\ 

# Get-ChildItem for list of Certificates
Get-ChildItem

# all certificate stores and certificates
Get-ChildItem -Recurse 

# Certificates for a specific store without using Set-Location
GCI -Path currentUser

# Change your working location to the currentuser\authroot certifcate store
sl currentuser\authroot

### Review $psitem variable
Get-Help about_Automatic_Variables    #-ShowWindow (ISE ONLY)

### Get process with Where-Object Filter 
### "^" Identifies Starts with and the "." ends the starts with declaration
Get-Process | Where-Object {$_.ProcessName -Match "^po.*"}
Get-Process | Where-Object ProcessName -Match "^p.*"

### Get-Help on Operators
Get-Help about_Comparison_Operators -ShowWindow

### Finding Expiring Certificates Using Alias of Where-Object "where"
dir -Recurse | `
where { !$_.psiscontainer -AND $_.notafter -lt (Get-Date)} | `
ft notafter, thumbprint, subject -AutoSize –Wrap

dir -Recurse | `
where { !$_.psiscontainer -AND $_.notafter -lt (Get-Date).AddDays(400)} | `
ft notafter, thumbprint, subject -AutoSize –Wrap


dir -Recurse | `
where { !$_.psiscontainer -AND $_.notafter -lt (Get-Date).AddDays(-400)} | `
ft notafter, thumbprint, subject -AutoSize –Wrap


dir -Recurse | where { $_.NotAfter -gt (Get-Date) -AND $_.NotAfter -le (Get-Date).AddDays(120) }

dir -Recurse | where { $_.NotAfter -gt (Get-Date) -AND $_.NotAfter -le (Get-Date).AddDays(400) } |ft notafter, thumbprint, subject -AutoSize –Wrap

dir -Recurse | where { $_.NotAfter -gt (Get-Date) -AND $_.NotAfter -le (Get-Date).AddDays(400) }
get-childitem | where { $_.NotAfter -gt (Get-Date) -AND $_.NotAfter -le (Get-Date).AddDays(400) }
# use GEt-ChildItem to provide a listing of Certificates in the current location
# using where method instead of Where-Object

(gci).where({$psitem.subject -match 'entrust'})

(gci).where({$_.subject -match '2006'}) | ft -Autosize -wrap

# using Thumprint match copy from previous output
(gci).where({$psitem.thumbprint -eq 'B31EB1B740E36C8402DADC37D44DF5D4674952F9'})
(gci).where({$psitem.thumbprint -Like 'B31E*'})

# PowerShell Quick Edit for 5.1 & 7.0
# right-click the Windows PowerShell icon in the upper-left corner of the Windows PowerShell window. 

# View all properties of the certificate using Format-List
(gci).where({$psitem.thumbprint -eq 'B31EB1B740E36C8402DADC37D44DF5D4674952F9'}) | Format-List *

# Open the Certificates MMC file
certmgr.msc

# Another way to open
Invoke-Item cert:\

#################################################################################
# Understanding Environment provider
#

# Using Cmd(command) in PowerShell
#####################
cmd 
# show the environment variable for windir
echo %windir%
# show all environment variables defined on the system
set
# Return to Windows PowerShell Default Prompt = "PS <working-directory> >"
exit
###################


### Page 77-80 Demo
# list PS Drives
Get-PSDrive

# Change to Environment PSDrive
Set-Location Env:\

# List all the environment variables on the system
Get-Item *

# Produce an alphabetical listing using property parameter and name as value
Get-Item * | Sort-Object -Property name

# Produce the properties of windir in a list format
Get-Item windir 
Get-Item windir | Format-List *

#
# Create new variable - Verify prompt shows "PS Env:\>"
New-Item -Name admin -Value mred

# retrieve data for new environment variable
Get-Item admin 

# Pipe all values for admin to format list for all properties
Get-Item TEMP | Format-List *

#
# Renaming an environment variable

# get listing of all enviroment variables and sort list on name property
gci | sort -Property name 

# Rename admin variable
Rename-Item admin -NewName super 

# check renaming of the variable
Get-Item super 
Get-Item super | Format-List *

#
# Removing an environment variable
gci | sort -Property name

Get-Item super | Format-List *

# remove environment variable
Remove-Item super 

gci | sort -Property name

# Set Location back to C: drive
Set-Location C:\

# change to home directory
cd ~

#################################################################################
# Understanding the filesytem Provider
#

#
# Working with directory listings (Page 80-85)

# directory Listing
gci C:\  

# look for containers
gci C:\ | where psiscontainer 

# Use the Up Arrow key to retrieve the gci C:\ | where psiscontainer command,
# and use the exclamation point (!) (meaning not) to retrieve only items in the PS drive that are not directories.
#The simplifed Where-Object syntax does not support using the not operator directly on the input property.
gci "~\Powershell"| where {!($psitem.psiscontainer)}

get-childitem "~\Powershell" | where { $_.CreationTime -lt (Get-Date)  }#-AND $_.CreationTime -gt (Get-Date).AddDays(400) }

# Use directory parameter to display only containers(directrories)
gci -Directory

# Look for Files
gci -File 

#
# Identifying properties of directories

# Get-ChildItem and pass to Get-Member
gci -Path C:\ | gm

# Use where object to find only property MemberTypes
gci | gm | Where {$_.membertype -eq "property"}

# to view hidden items use Force
gci -Force | gm -MemberType Property 

gci -Force -File | gm -MemberType Property 

#
# Creating Folders & Files 

# Change Location from C:\ to C:\Users\<uname>\AppData\Local\Temp
sl $env:TEMP

# Get-Item
gi *

# Create a Folder in the current directory
New-Item -Name mytempfolder -ItemType Directory

# Create an empty text File
New-Item -Name mytempfile -ItemType File

# investigating the io.path class and static methods 
[io.path] | Get-Member
[io.path] | Get-Member -Static
[io.path] | Get-Member -Static -MemberType Method
[io.path] | Get-Member -Static -Name GetRandomFileName

# using mkdir function with the GetRandomFileName from io.path class 
md -path ([io.path]::GetRandomFileName())

# Creating a temporary file name the New-TemporaryFile cmdlet 
# NOTE: The requires using a variable to store the name of the fileinfo object.
$tempfile = New-TemporaryFile
$tempfile

# Delete the files and folders in the temp folder
dir | ri -Recurse -WhatIf
dir | ri -Recurse

#
# Reading and writing files

# Create file with text
Remove-Item mytempfile
New-Item -Name mytempfile -ItemType File -Value "My file"

# Read the contents of the file
Get-Content mytempfile

Add-Content mytempfile -Value "ADDITIONAL INFORMATION"

echo "jim" > jim.txt
echo "JAMES" > jim.txt

echo "123" >> jim.txt


# Overwrite the contents of the file
Set-Content mytempfile -Value "Setting information"

Get-Content jim.txt

#
# Listing all functions on the system

# Switch to the Function PS Drive
Set-Location function:\

gci

# using cmdlet with Where method to filter definitions that contain the word set
(Get-ChildItem).where({$psitem.definition -match 'set'})

# using the -notmatch operator instead of match
(Get-ChildItem).where({$psitem.definition -notmatch 'set'})

# use the Get-Content for information on pause function
Get-Content pause
gc pause

#
# Using the Registry Provider
sl HKCR:\
# Registry Drives
Get-PSDrive -PSProvider registry | select name, root 

# Creating new registry drives
New-PSDrive -PSProvider Registry -Root HKEY_CLASSES_ROOT -Name HKCR

# Behavior for Registry is the same as fileSystem provider
Set-location HKCR:\

# Find current location
Get-Location

# View values in registry key (Note: one default property)
Get-Item .\.ps1 |fl *

# Access the value of the default property
Get-ItemProperty .\.ps1 | fl *

# Return only the default property value
(Get-ItemProperty .\.ps1 -Name '(default)').'(default)'

# Listing Registry Keys
GCI -path HKlM:\software

#
# Searching for software
gci -Path 'HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall'

# Filtering for office
gci -path 'HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' | where name -match 'office'

#
# New registry key
# Store current working Location
Push-Location

# Set location for HKCU
Set-Location HKCU:\

# Use Test-Path to verify key exists
Test-Path .\Software\test2

# Create a new registry key using New-Item
New-Item -Path .\Software\ -Name test2

# We can return to the starting location using Pop-Location
Pop-Location

# We can create a new registry, 
# or overwrite an existing registry from a different location by using full path and adding -Force
# The Short Way to create a new registry key

# without -Force option
New-Item -Path HKCU:\Software -Name test1

# WE can use -Verbose to see the actions being performed by the New-Item cmdlet
New-Item -Path HKCU:\Software -Name test -Force -Verbose

# Use Set-Item to set a value for the registry key
Set-Item -Path HKCU:\Software\test2 -Value "test key"

# Creating a registry and Setting value in the same command using New-Item
New-Item -Path HKCU:\Software\hsg1 -Value "default value"

#
# Modifying Registry values
Push-Location
Set-Location HKCU:\Software\test
Set-ItemProperty . newproperty "mynewvalue"
Pop-Location
Set-location HKCR:\
#
# The Short Way to Change a registry Property Value
Set-ItemProperty -Path HKCU:\Software\test -Name newproperty -Value anewvalue

#If you need to set a registry property value, you can set the value of that property easily by using the
#Set-ItemProperty cmdlet. But what if the registry property does not exist? How do you set the property value then? You can still use the Set-ItemProperty cmdlet to set a registry property value, even if
#the registry property does not exist, as shown in the following code.

Set-ItemProperty -Path HKCU:\Software\test -Name missingproperty -Value avalue

# Test Path for the previous updates
Test-Path HKCU:\Software\test

Test-Path HKCU:\Software\test\newproperty

# Unfortunately, this technique does not work for a registry key property. It always returns false
# even if the registry property exists. This is shown here.
Test-Path HKCU:\Software\test\newproperty

Test-Path HKCU:\Software\test\bogus

#
# Testing for a registry key property prior to writing a new value
# Specify the -ErrorAction (ea is an alias) parameter of SilentlyContinue (0 is the enumeration value associated with SilentlyContinue).
if((Get-ItemProperty -Path HKCU:\Software\test -Name bogus -ea 0).bogus)`
{'Property already exists'}`
ELSE { Set-ItemProperty -Path HKCU:\Software\test -Name bogus -Value 'initial value'}

#
# Variable Provider 
#The variable provider provides access to the variables that are defined within Windows PowerShell.

# use Get-Help with Where-Object to return category of cmdlet
Get-Help *variable | Where-Object category -eq "cmdlet"

# Format List and provide only the Properties desired
Get-Help *variable | Where-Object category -eq "cmdlet"| Format-List name, category, synopsis
Get-Help *variable | Where-Object category -eq "cmdlet"| Format-Table name, category, synopsis
#
# Working with variables

# Set Location to variable
SL variable:\

# get a listing of variables
Get-ChildItem

# Sort on the name property
Get-ChildItem | Sort-Object Name

#retrieve a specific variable
Get-Variable ShellId 

Get-Variable ShellId | Format-List *

# Create a new variable called administrator. 
New-Variable administrator

# Use the Get-Variable cmdlet to retrieve the new administrator variable. 
Get-Variable administrator

# Set variable value.
Set-Variable administrator -value mred

# Get Variable information
Get-Variable administrator

# Remove Variable
Remove-Variable administrator

# Optional removal
del .\administrator

# Verify removal
Get-Variable administrator
