<#
.Synopsis
    Update MTI\potosite path /main
.Description
	IT WORKS!
#>

#Update potatosite repo
Set-Location -Path "C:\Program Files\MTI\potatosite" -PassThru
git pull origin main
#test changes

