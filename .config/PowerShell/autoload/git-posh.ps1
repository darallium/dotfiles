

Import-Module posh-git
$global:GitPromptSettings.BeforeStatus = '['
$global:GitPromptSettings.AfterStatus  = '] '

$GitPromptSettings.DefaultPromptPrefix.Text = '$(Get-Date -f "MM-dd HH:mm:ss") '
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Magenta

