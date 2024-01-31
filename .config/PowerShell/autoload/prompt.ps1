Import-Module posh-git
$global:GitPromptSettings.BeforeStatus = '['
$global:GitPromptSettings.AfterStatus  = '] '
function prompt {
    $origLastExitCode = $LASTEXITCODE
    Write-VcsStatus
    Write-Host $ExecutionContext.SessionState.Path.CurrentLocation -ForegroundColor Green
    $LASTEXITCODE = $origLastExitCode
    "$('>' * ($nestedPromptLevel + 1)) "
    if ($?) {
        Write-Host " (*'-')"  -NoNewLine -ForegroundColor "DarkGreen"
    } else {
        Write-Host " (*;-;)"  -NoNewLine -ForegroundColor "Red"
    }
    return ""
}

Import-Module Catppuccin

$Flavor = $Catppuccin['Mocha']

Write-Host $Flavor.Blocks()

$Colors = $null
$Colors = @{
	
	# Powershell colours
	ContinuationPrompt     = $Flavor.Teal.Foreground()
	Emphasis               = $Flavor.Red.Foreground()
	Selection              = $Flavor.Surface0.Background()
	
	# PSReadLine prediction colours
	InlinePrediction       = $Flavor.Overlay0.Foreground()
	ListPrediction         = $Flavor.Mauve.Foreground()
	ListPredictionSelected = $Flavor.Surface0.Background()

	# Syntax highlighting
	Command                = $Flavor.Blue.Foreground()
	Comment                = $Flavor.Overlay0.Foreground()
	Default                = $Flavor.Text.Foreground()
	Error                  = $Flavor.Red.Foreground()
	Keyword                = $Flavor.Mauve.Foreground()
	Member                 = $Flavor.Rosewater.Foreground()
	Number                 = $Flavor.Peach.Foreground()
	Operator               = $Flavor.Sky.Foreground()
	Parameter              = $Flavor.Pink.Foreground()
	String                 = $Flavor.Green.Foreground()
	Type                   = $Flavor.Yellow.Foreground()
	Variable               = $Flavor.Lavender.Foreground()
}

# Set the colours
Set-PSReadLineOption -Colors $Colors
