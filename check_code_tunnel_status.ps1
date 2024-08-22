# File: check_code_tunnel_status.ps1

if (Test-Path "$PSScriptRoot\tunnel_pid.txt") {
    $tunnel_pid = Get-Content "$PSScriptRoot\tunnel_pid.txt"
    if (Get-Process -Id $tunnel_pid -ErrorAction SilentlyContinue) {
        Write-Output "running"
    } else {
        Write-Output "not running"
    }
} else {
    Write-Output "not running"
}
