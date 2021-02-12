## Simple invoke web request to download a file

#$file = New-Object line-broken.ps1
#$file.DownloadFile("http://<IP-address>", "C:\Users\Student\Downloads\file.txt")
Invoke-WebRequest -Uri "http://<IP-address>" -OutFile "C:\Users\Student\Downloads\file.txt"
Invoke-WebRequest -Uri "http://<IP-address>" -OutFile "C:\Users\Student\Downloads\file.txt"
Invoke-WebRequest -Uri "http://<IP-address>" -OutFile "C:\Users\Student\Downloads\file.txt"