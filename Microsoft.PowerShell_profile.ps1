# Set-PSDebug -Trace 1

# ================================
# =========== Imports ============
# ================================
Import-Module -Name Microsoft.WinGet.CommandNotFound
Import-Module -Name Terminal-Icons
Import-Module Get-ChildItemColor
Import-Module PSReadLine


# ================================
# ========== Functions ===========
# ================================
function ll() {
	Get-ChildItemColor -HumanReadableSize
}


# ================================
# ============ Setup =============
# ================================
oh-my-posh --init --shell pwsh --config "$env:POSH_THEMES_PATH\tokyo.omp.json" | Invoke-Expression
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-Alias -Name ls -Value ll -option AllScope


# Set-PSDebug -Trace 0