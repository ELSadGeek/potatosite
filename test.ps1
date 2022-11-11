for ($num = 1 ; $num -le 10 ; $num++){    "I count $num"}

for ($x='' ;$x.length -le 100;$x=$x+'x'){
    Write-Host $x
    Start-Sleep -Milliseconds 200
}

$colors = @("Green","Cyan","Red","Magenta","Yellow","White")
for (($x=''),($fgcolor = $colors | Get-Random) ;$x.length -le 30;($x=$x+'x'),($fgcolor = $colors | Get-Random)){
    Write-Host $x -ForegroundColor $fgcolor
    Start-Sleep -Milliseconds 200
}

for ($counter = 1; $counter -le 100; $counter++ )
{
		# ADD YOUR CODE HERE
    Write-Progress -Activity "Update Progress" -Status "$counter% Complete:" -PercentComplete $counter;
}

for ($counter = 1; $counter -le 2; $counter++ )
{
    $colors = @("Green","Cyan","Red","Magenta","Yellow","White")
    for (($x=''),($fgcolor = $colors | Get-Random) ;$x.length -le 30;($x=$x+'x'),($fgcolor = $colors | Get-Random)){
        Write-Host $x -ForegroundColor $fgcolor
        Start-Sleep -Milliseconds 200
    }

    Write-Progress -Activity "Update Progress" -Status "$counter% Complete:" -PercentComplete $counter;
}


