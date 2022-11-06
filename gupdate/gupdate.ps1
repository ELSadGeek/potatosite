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
git fetch

choco install 7zip.install adobereader chocolateygui google-drive-file-stream googlechrome greenshot paint.net sysinternals ultravnc vlc libreoffice-fresh microsoft-teams.install zoom webex-meetings naps2 --ignore-checksums

