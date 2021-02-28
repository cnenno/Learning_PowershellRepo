
###################################################
# Understanding the basics of cmdlets
#
# This script is for tutorial purposes ONLY
# You made need to make corrections to some of the 
# lines in order to make them work on your VM or 
# home PC. Make sure not to run cmdlets directly
# against your system when possible!

###################################################
# Start-Transcript H:\Lesson1_1.txt


###################################################
# Using the Get-ChildItem cmdlet
#

# cmdlets and aliases
Get-ChildItem C:\users\jonat\PowerShell

# dir is aliased to Get-ChildItem
Get-Alias dir

# format table parameters
Get-Help dir | select name, synopsis | Format-Table -Autosize

Get-Help Get-ChildItem | select name, synopsis | Format-Table -Autosize

Get-ChildItem C:\users\jonat\PowerShell | Format-List

Get-ChildItem C:\users\jonat\PowerShell | Format-List -property name

Get-ChildItem C:\users\jonat\PowerShell | Format-List -property name, length

###################################################
# Using the Format-Wide cmdlet
#

Get-ChildItem C:\users\jonat\PowerShell | Format-Wide -Column 3 -property name

Get-ChildItem C:\users\jonat\PowerShell | Format-Wide -Property name -AutoSize

Get-ChildItem C:\users\jonat\PowerShell | Format-Wide -Property name -Column 8 

###################################################
# Formatting a directory listing using Format-Table
#

# introducing format table
Get-ChildItem C:\users\jonat

Get-ChildItem C:\users\jonat -Recurse -Include *.txt -ea 0

Get-ChildItem C:\users\jonat -Recurse -Include *.txt -ea 0 | Format-Table

Get-ChildItem C:\users\jonat -Recurse -Include *.txt -ea 0 | Format-Table -Property name, legth, LastWriteTime

GCI
###############################################################
# Formatting output with Out-GridView
#

# out grid view

gps | Out-GridView

gsv | ogv

Get-Process | Get-Member
Get-Process | Sort-Object CPU
Get-Process | Sort-Object CPU -Descending

Get-Process | Sort-Object CPU -Descending | Out-GridView


##### Working Script #####
Get-Process | Sort-Object ProcessName | Format-Table ID, ProcessName,




Get-Help Format-table -examples
##########################################
# Taking advantage of the power of Get-Command
#

# searching cmdlets using wildcard characters
Get-Command *

# return all aliases that start with g
Get-Alias g*

# use Get-Command alias
gcm Get-Command

gcm Get-Command | Format-List *

# We can use the -property parameter and specify definition property
gcm Get-Command | Format-List -Property Definition

# Get a name of a process
Get-Process | get-unique| format-list -Property name
# Get the information about the process
Get-Process -Name msedge | format-list
# Pick an ID and process to get all the properties of this process.
Get-Process -name msedge | Get-Member -MemberType Property|format-table -Property Name
Get-Process msedge | Format-List *
# gcm get-command returns objects, so we can retrieve the definition property using the dotted notation
(gcm Get-Command).Definition

gcm Get-Command | Format-List -Property Definition

# return -verb listing of all the comdlets that contain a verb beginning with se
gcm -ver se*

# retrun -noun starting with o
gcm -noun o*

# return syntax for the Get-Command
gcm -Syntax Get-Command

gcm -Syntax gcm

####################################################
# Using the Get-Member cmdlet
#

# objects, properties and methods
# Powershell cmdlets return objects
# object gives the ability to describe somthing or to do something
#
Get-ChildItem C:\users\jonat\ | Get-Member

Get-Alias g*

gal g*

gal g* | Sort-Object -property definition

gal –definition Get-ChildItem

gci | gm

Get-ChildItem -Force | Get-Member -membertype property

Get-ChildItem | Get-Member -membertype method

Get-ChildItem | Get-Member -membertype m*



