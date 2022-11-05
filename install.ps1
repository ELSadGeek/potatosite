<#
.Synopsis
    Install potatosite tools & stuff
.Description
	IT WORKS!
#>

#Make Dir & set path
New-Item -ItemType Directory "C:\Program Files\MTI"
Set-Location -Path "C:\Program Files\MTI" -PassThru

#Install deps

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install git

#Clone latest version

git clone https://github.com/ELSadGeek/potatosite.git


#Task Manager schedule

Write-Host "Hola Mundo" >> hola.txt
