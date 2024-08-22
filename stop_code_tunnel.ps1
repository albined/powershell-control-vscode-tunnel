# File: stop_code_tunnel.ps1

# From SO "Terminate process tree in PowerShell given a process ID"
function Kill-Tree {
    Param([int]$ppid)
    Get-CimInstance Win32_Process | Where-Object { $_.ParentProcessId -eq $ppid } | ForEach-Object { Kill-Tree $_.ProcessId }
    Stop-Process -Id $ppid
}

$tunnelProcess = Get-Content "$PSScriptRoot\tunnel_pid.txt"
$tunnelProcessId = [int]$tunnelProcess

Kill-Tree $tunnelProcessId

Remove-Item "$PSScriptRoot\tunnel_pid.txt"
