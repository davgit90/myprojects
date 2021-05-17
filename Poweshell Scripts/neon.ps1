# Eclipse neon dump file

New-Item -Force -ItemType directory -Path D:\Eclipse-neon

$Url = "https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/neon/R/eclipse-java-neon-R-win32-x86_64.zip"

$DownloadZipFile = "D:\Eclipse-neon" + $(Split-Path -Path $Url -Leaf)

$ExtractPath = "D:\Eclipse-neon"

Invoke-WebRequest -Uri $Url -OutFile $DownloadZipFile

$ExtractShell = New-Object -ComObject Shell.Application 

$ExtractFiles = $ExtractShell.Namespace($DownloadZipFile).Items() 

$ExtractShell.NameSpace($ExtractPath).CopyHere($ExtractFiles)

Start-Process $ExtractPath

Remove-Item -Path D:\Eclipse-neoneclipse-java-neon-R-win32-x86_64.zip -Force 