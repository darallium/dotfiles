ln -s $ENV:HOMEPATH\dotfiles\.config $ENV:HOMEPATH\.config

ln -s $ENV:HOMEPATH\.config\glaze-wm $ENV:HOMEPATH\dotfiles\.config
ln -s $ENV:HOMEPATH\dotfiles\neovim $ENV:LOCALAPPDATA



mkdir $ENV:HOMEPATH\Documents\PowerShell

mv setup.ps1 $ENV:HOMEPATH\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

mv setup.ps1 $ENV:HOMEPATH\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force

git clone https://github.com/catppuccin/powershell $ENV:HOMEPATH\Documents\PowerShell\Modules\catppuccin



