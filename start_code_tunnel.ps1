# File: start_code_tunnel.ps1

$tunnelProcess = Start-Process cmd.exe -ArgumentList "/c code tunnel" -PassThru
$tunnelProcess.Id | Out-File "$PSScriptRoot\tunnel_pid.txt"


