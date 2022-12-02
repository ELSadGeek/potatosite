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

#Enable PS scripts

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force


#Install deps

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco feature enable -n allowEmptyChecksums
choco upgrade all
choco install wget git googlechrome googledrive -y --ignore-checksums


#Download potato loader

wget.exe http://sysmti.com.mx/TI/load_potato.ps1


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

$UserId = "IT"
# Set the task principal's user ID and run level.
$taskPrincipal = New-ScheduledTaskPrincipal -UserId $UserId -RunLevel Highest 
# Set the task compatibility value to Windows 10.
$taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8
# Update the task principal settings
Set-ScheduledTask -TaskName $taskName -Principal $taskPrincipal -Settings $taskSettings 

#Task Schedule
#Cambiar GUPDATE a los jueves a las 11

$taskName = "gupdate"
# Unregister-ScheduledTask -TaskName $taskname -Confirm:$false
# Describe the scheduled task.
$description = "GUPDATE AGENT"

# Create a new task action

$taskAction = New-ScheduledTaskAction `
    -Execute 'powershell.exe' `
    -Argument '-File "C:\Program Files\MTI\potatosite\gupdate\gupdate.ps1"'

$taskTrigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 10)


# Register the scheduled task

Register-ScheduledTask `
    -TaskName $taskName `
    -Action $taskAction `
    -Trigger $taskTrigger `
    -Description $description


    $UserId = "IT"
# Set the task principal's user ID and run level.
$taskPrincipal = New-ScheduledTaskPrincipal -UserId $UserId -RunLevel Highest 
# Set the task compatibility value to Windows 10.
$taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8 -
# Update the task principal settings
Set-ScheduledTask -TaskName $taskName -Principal $taskPrincipal -Settings $taskSettings 

Restart-Computer
