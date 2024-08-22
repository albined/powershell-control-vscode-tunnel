# Unified script: code_tunnel_manager.ps1

param (
    [switch]$start,
    [switch]$stop,
    [switch]$check
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
    Execute-Script -scriptPath ".\start_code_tunnel.ps1"
} elseif ($stop) {
    Write-Host "Stopping code tunnel..."
    Execute-Script -scriptPath ".\stop_code_tunnel.ps1"
} elseif ($check) {
    Write-Host "Checking code tunnel status..."
    Execute-Script -scriptPath ".\check_code_tunnel_status.ps1"
} else {
    Write-Host "Please provide a valid option: --start, --stop, or --check"
}
