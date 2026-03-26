function ServiceRestarter {
    param (
        [parameter(mandatory)][string]$Service,
        [int]$WaitingTime = 2,
        [int]$Count = 1
    )
    
    for ($i = 1; $i -le $Count; $i++) {
        Write-Output "Attempt $i : Restarting $Service..."
        Restart-Service -Name $Service -ErrorAction SilentlyContinue

        Start-Sleep -Seconds $WaitingTime

        $Status = (Get-Service -Name $Service).Status
 
        if ($Status -eq 'Running') {
            Write-Output "Success: $Service is now Running."
            return 
        }
        
        Write-Output "Warning: $Service is currently $Status."
    }

    Write-Output "Error: Failed to start $Service after $Count attempts."
}

