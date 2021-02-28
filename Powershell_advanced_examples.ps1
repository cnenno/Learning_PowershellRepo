# Powershell more advanced examples!
#
# This script is for tutorial purposes ONLY
# You made need to make corrections to some of the 
# lines in order to make them work on your VM or 
# home PC. Make sure not to run cmdlets directly
# against your system when possible!


# Create a Folder
New-Item -Path 'H:\padmini\NewPowerShellFolder' -ItemType Directory
New-Item -Path 'H:\padmini\SourceFolder' -ItemType Directory
New-Item -Path 'C:\SourceFolder' -ItemType Directory
New-Item -Path 'H:\padmini\padmini images' -ItemType Directory
New-Item -Path 'H:\padmini\SourceFolder\NewText.txt'-ItemType File
New-Item -Path 'H:\padmini\SourceFolder\PSNote.txt'-ItemType File
New-Item -Path 'H:\padmini\SourceFolder\NewPSNote.txt'-ItemType File
Add-Content H:\padmini\SourceFolder\NewPSNote.txt 'PowerShell is a scripting language.
PowerShell supports programming.
PowerShell more potent than Command Line editor.'
Add-Content H:\padmini\SourceFolder\PSNote.txt 'PowerShell is a scripting language.
PowerShell supports programming.
PowerShell more potent than Command Line editor.
Welcome to the Wonderful World of PowerShell'

# Copy Folder
Copy-Item 'H:\padmini\SourceFolder' 'C:\DestinationFolder'

# Delete Folder
Remove-Item 'C:\DestinationFolder\SourceFolder'

# Move Folder
Move-Item C:\SourceFolder G:\padmini

# Rename Folder
Rename-Item 'H:\padmini\padmini images'

# Test to see if a folder exists
Test-Path 'H:\padmini\SiteCollectionFolder'

### FILES

#Create New File
New-Item -Path 'H:\padmini\NewPowerShellFolder\ImportantNoteRelatedToPowerShell.txt'-ItemType File

# Copy File
Copy-Item 'H:\padmini\SourceFolder\NewText.txt' 'C:\DestinationFolder\NewText.txt'

# Remove File
Remove-Item 'C:\NewFolderForPowerShell\ImportantNoteRelatedToPowerShell.txt'

# Move File
Move-Item 'H:\padmini\SourceFolder\PSNote.txt' C:\DestinationFolder

# Rename File 
Rename-Item 'C:\NewFolderForPowerShell\PowerShell.txt'

# Test if File exists
Test-Path 'C:\NewFolderForPowerShell\New File.txt'

# Add Content to Text file
Set-Content 'C:\DestinationFolder\PSnote.txt' 'PowerShell Content Note'

# Retrieve Content from a file
Get-Content 'C:\DestinationFolder\PSNote.txt'

### XML file

# Create XML File
New-Item H:\padmini\SourceFolder\NewFile.xml -ItemType File

# Add Content to an XML file
Set-Content H:\padmini\SourceFolder\NewFile.xml '<title>Welcome to Top 51 PowerShell Example</title>'

# Retrieve Content from XLM file
Get-Content H:\padmini\SourceFolder\NewFile.xml

### HTML file

# Create HTML file
New-Item H:\padmini\SourceFolder\NewHtmlFile.html -ItemType File

# Add Content to HTML file
Set-Content H:\padmini\SourceFolder\NewHtmlFile.html '<html><h1>Welcome To Top 51 PowerShell Example</h1></html>'

# Retrieve Content from HTML file
Get-Content H:\padmini\SourceFolder\NewHtmlFile.html

### CSV File
New-Item H:\padmini\SourceFolder\NewCSVFile.csv -ItemType File

# Add Content to CSV file
Set-Content H:\padmini\SourceFolder\NewCSVFile.csv 'Monday,Sunday,Tuesday'

# Retrieve Content from CSV file
Get-Content H:\padmini\SourceFolder\NewCSVFile.csv

### Erase file Content
Set-Content H:\padmini\SourceFolder\NewHtmlFile2.html '<html><h1>Welcome To Top 51 PowerShell Example</h1></html>'

Clear-Content H:\padmini\SourceFolder\NewHtmlFile2.html

Get-Content H:\padmini\SourceFolder\NewHtmlFile2.html

# Append to a Text
Add-Content H:\padmini\SourceFolder\NewHtmlFile.html "<html><h2>PowerShell is a more powerful scripting language</h2></html>"

Get-Content H:\padmini\SourceFolder\NewHtmlFile.html

### Variables

$variableValue

$variableValue_1

$VariableValue

# The ”-” is not allowed, in order to use "-" Set in {}

${variable-Value}=100

${Variable-Value}

# Assign a value to a variable

$variableValue= 10

# Assign multiple variables same value
$variableValue=$integerValue=$a=1

# Assign multiple variables values on the same line
$p,$q,$r=10,34,23

# Store lists in variable
$listValue=123,12345,1234567,123,12345678,124

# Show list information
$listValue

# Sort by unique values
$listValue| sort | get-unique

Get-content|Measure-object -character -line -word

# Measure the object count
Get-Content 'C:\DestinationFolder\PSNote.txt'| measure-object -character -line -word

# Get Child Item Examples
Get-ChildItem H:\padmini\SourceFolder

Get-ChildItem H:\padmini\SourceFolder *.txt -Recurse -Force

# Comparison of files
Compare-Object -ReferenceObject $(Get-Content H:\padmini\SourceFolder\NewPSNote.txt) -DifferenceObject $(Get-Content H:\padmini\SourceFolder\PSNote.txt)

# Sleep / Wait
Start-Sleep -m 120 # for minutes
Start-Sleep -s 20 # for Seconds

### LOOPS

# For loops Returning ArrayItem by number
# for (<init>; <condition>; <repeat>)
# {code to be execute till the condition is true}

$arrayItem = @("Laptop", "Mobile", "Tablet")
for($i = 0; $i -lt $arrayItem.length; $i++)
{
$arrayItem[$i]
}

# For Each Loop
$arrayList = @("Laptop", "Mobile", "Tablet")
foreach ($item in $array)
{
$item
}

# For While Loop
$arrayItem = @("Laptop", "Mobile", "Tablet")
$counter = 0;
while($counter -lt $arrayItem.length){
$arrayItem[$counter]
$counter += 1
}

# Do While loop
$arrayItem = @(“laptop”, “Mobile”, “Tablet”)
$counter = 0;

do {
$arrayItem[$counter] $counter += 1
}
while($counter -lt $arrayItem.length)

### IF Statements

$x = 60
$y=70
if($x -le $y){
write-host("x is smaller than y")
}

# If Else
$x = 60
$y=50
if($x -le $y){
write-host("x is smaller than y")
}
else
{
write-host("x is greater than y")
}

# ElseIF
$x = 30
$y=30
if($x -ne $y){
write-host("x not equal to y")
} elseif($x -ge $y){
write-host("x is greater than y")
} elseif($x-le$y){
write-host("x is less than y")
}
else
{
write-host("x is equal to y")
}

# Nested If
$x = 30
$y = 10
$z =5
if($x -gt $y){
if($x -gt $z) {
write-host(“X is larger than y and z”)
}
}


### ARRAY
$NumberList = 1,2,3,4,5,6,7,8
write-host("Display all the Array element:")
$NumberList

write-host("Get the length of array:")
$NumberList.Length

write-host("Get fourth element of array")
$NumberList[3]

write-host("Get partial array")
$subList = $NumberList[1..3]

write-host("print subList")
$subList

write-host("using for loop")
for ($i = 0; $i -le ($NumberList.length - 1); $i += 1) {
$NumberList[$i]
}

write-host("Assign values")
$NumberList[1] = 10
$NumberList

### HashTable
$hash = @{ ID = 13; Name = "Purnima"; Color = "fair"}
$HashValue= @{ ID = 13; Name = "Purnima"; Color = "fair"}

write-host("Print all hashtable keys")
$HashValue.keys

write-host("Print all hashtable values")
$HashValue.values

write-host("Get ID")
$HashValue["ID"]

write-host("print Size")
$HashValue.Count

write-host("Add key-value")
$HashValue["Updated"] = "Now"

write-host("sort by key")
$HashValue.GetEnumerator() | Sort-Object -Property key


### Functions
#function functionName
#{
#code
#}
function displayDate
{
Get-Date
}

DisplayDate

