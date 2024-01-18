function ghq-peco {
    cd $(ghq list -p | peco)
}

Set-PSReadLineKeyHandler -Chord Ctrl+] -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("ghq-peco")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
