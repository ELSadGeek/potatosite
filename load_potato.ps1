<#
.Synopsis
    Clone repos / Init Hardenning
.Description
	IT WORKS!
#>


Set-Location -Path "C:\Program Files\MTI\" -PassThru

git clone https://github.com/ELSadGeek/potatosite.git
git clone https://github.com/0x6d69636b/windows_hardening.git


Set-Location -Path "C:\Program Files\MTI\windows_hardening" -PassThru

Import-Module .\HardeningKitty.psm1
Invoke-HardeningKitty -EmojiSupport