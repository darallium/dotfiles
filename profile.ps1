
$psdir="$env:HOMEPATH\.config\PowerShell"
Write-Host ("Load PS Profiles from {0}\autoload" -f $psdir) -ForegroundColor DarkCyan
Get-ChildItem $psdir\autoload | where Extension -eq ".ps1" | %{.$_.FullName}

Import-Module "D:\home\darallium\AppData\Local\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
#34de4b3d-13a8-4540-b76d-b9e8d3851756



