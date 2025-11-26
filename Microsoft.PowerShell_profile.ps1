# Set-PSDebug -Trace 1

# ================================
# =========== Imports ============
# ================================
Import-Module -Name Microsoft.WinGet.CommandNotFound
Import-Module -Name Terminal-Icons
Import-Module Get-ChildItemColor
Import-Module PSReadLine
Import-Module CredentialManager


# ================================
# ========== Functions ===========
# ================================
function ll() {
	Get-ChildItemColor -HumanReadableSize
}

function prompt {
	$loc = $executionContext.SessionState.Path.CurrentLocation;
	$out = ""

	if ($loc.Provider.Name -eq "FileSystem") {
		$out += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
	}

	$out += "PS $loc$('>' * ($nestedPromptLevel + 1)) ";

	return $out
}


# ================================
# ============ Setup =============
# ================================
oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH\tokyo.omp.json" | Invoke-Expression
# Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
# Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-Alias -Name ls -Value ll -option AllScope


# Set-PSDebug -Trace 0