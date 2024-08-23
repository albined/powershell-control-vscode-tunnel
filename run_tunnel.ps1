# Unified script: code_tunnel_manager.ps1

param (
    [switch]$start,
    [switch]$stop,
    [switch]$check,
    [switch]$test
)

function Execute-Script {
    param (
        [string]$scriptPath
    )
    if (Test-Path $scriptPath) {
        & $scriptPath
    } else {
        Write-Error "The script $scriptPath does not exist."
    }
}

if ($start) {
    Write-Host "Starting code tunnel..."
    Execute-Script -scriptPath "$PSScriptRoot\start_code_tunnel.ps1"
} elseif ($stop) {
    Write-Host "Stopping code tunnel..."
    Execute-Script -scriptPath "$PSScriptRoot\stop_code_tunnel.ps1"
} elseif ($check) {
    Write-Host "Checking code tunnel status..."
    Execute-Script -scriptPath "$PSScriptRoot\check_code_tunnel_status.ps1"
} elseif ($test) {
    echo "$PSScriptRoot"
} else {
    Write-Host "Please provide a valid option: -start, -stop, or -check"
}
