Invoke-Expression (& { (zoxide init powershell --hook prompt | Out-String) })
Invoke-Expression (& { (rye self completion -s powershell | Out-String) })

