<#
.Synopsis
    Update MTI\potosite path /main
.Description
	IT WORKS!
#>


#Remove potato_loader task

Unregister-ScheduledTask -TaskName "load_potato" -Confirm:$false

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

#Update potatosite repo
Set-Location -Path "C:\Program Files\MTI\potatosite" -PassThru
git pull origin main

choco install winrar vscode

#test changes

