<#
.Synopsis
    Install potatosite tools & stuff
.Description
	IT WORKS!
#>


Set-ExecutionPolicy Unrestricted -Confirm CurrentUser -Force


#Install deps

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco upgrade all
choco install wget git -y


#Make Dir & set path

New-Item -ItemType Directory "C:\Program Files\MTI"
Set-Location -Path "C:\Program Files\MTI" -PassThr

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

# # Set the task principal's user ID and run level.
# # $taskPrincipal = New-ScheduledTaskPrincipal -UserId $UserId -RunLevel Highest 
# # # Set the task compatibility value to Windows 10.
# # $taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8
# # # Update the task principal settings
# # Set-ScheduledTask -TaskName $taskName -Principal $taskPrincipal -Settings $taskSettings

Restart-Computer
