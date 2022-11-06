<#
.Synopsis
    Update MTI\potosite path /main
.Description
	IT WORKS!
#>


#Remove potato_loader task

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

#Update potatosite repo
Set-Location -Path "C:\Program Files\MTI\potatosite" -PassThru
git pull origin main

choco install winrar vscode libreoffice-still greenshot 7zip sysinternals 

