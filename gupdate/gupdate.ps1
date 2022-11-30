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
git fetch
git pull origin main
choco install libreoffice-still 7zip paint.net adobereader spotify -y



