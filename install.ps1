<#
.Synopsis
    Install potatosite tools & stuff
.Description
	IT WORKS!
#>
#Make Dir & set path

New-Item -ItemType Directory "C:\Program Files\MTI"
Set-Location -Path "C:\Program Files\MTI" -PassThr



#Coloritos

$Host.UI.RawUI.BackgroundColor = ($bckgrnd = 'Black')
$Host.UI.RawUI.ForegroundColor = 'Yellow'
$Host.PrivateData.ErrorForegroundColor = 'Red'
$Host.PrivateData.ErrorBackgroundColor = $bckgrnd
$Host.PrivateData.WarningForegroundColor = 'Magenta'
$Host.PrivateData.WarningBackgroundColor = $bckgrnd
$Host.PrivateData.DebugForegroundColor = 'White'
$Host.PrivateData.DebugBackgroundColor = $bckgrnd
$Host.PrivateData.VerboseForegroundColor = 'Green'
$Host.PrivateData.VerboseBackgroundColor = $bckgrnd
$Host.PrivateData.ProgressForegroundColor = 'Cyan'
$Host.PrivateData.ProgressBackgroundColor = $bckgrnd
$psISE.Options.FontSize = 18

Clear-Host


#Enable PS scripts

Set-ExecutionPolicy Unrestricted -Scopes CurrentUser -Force


#Install deps

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco upgrade all
choco install wget git -y


#Download potato loader

wget.exe http://sysmti.com.mx/TI/load_potato.ps1
git clone https://github.com/ELSadGeek/potatosite.git
git clone https://github.com/0x6d69636b/windows_hardening.git

#Task Schedule

$taskName = "load_potato"
# Unregister-ScheduledTask -TaskName $taskname -Confirm:$false
# Describe the scheduled task.
$description = "load potato"


# Create a new task action

$taskAction = New-ScheduledTaskAction `
    -Execute 'powershell.exe' `
    -Argument '-File "C:\Program Files\MTI\load_potato.ps1"'

# Create a new trigger (Daily at 3 AM)

$taskTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 1)

# Register the scheduled task

Register-ScheduledTask `
    -TaskName $taskName `
    -Action $taskAction `
    -Trigger $taskTrigger `
    -Description $description

$UserId = "TI"
# Set the task principal's user ID and run level.
$taskPrincipal = New-ScheduledTaskPrincipal -UserId $UserId -RunLevel Highest 
# Set the task compatibility value to Windows 10.
$taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8 -Priority Highest -AsJob -
# Update the task principal settings
Set-ScheduledTask -TaskName $taskName -Principal $taskPrincipal -Settings $taskSettings

# Restart-Computer
