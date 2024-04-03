Clear-Host
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Set-Alias ll Get-ChildItem
Set-Alias vim nvim
Set-Alias cat bat
Set-Alias grep rg
Set-Alias ls lsd_func
function lsd_func { lsd --classic $args }
function scoop-update { scoop update *; scoop cleanup * }

function ip { curl -s  https://api.myip.com | jq }

Set-PSReadLineOption -BellStyle None
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

New-Alias open ii


$env:Path += ";$env:USERPROFILE\.local\bin\"


# scoop-search
Invoke-Expression (&scoop-search --hook)
Invoke-Expression (&starship init powershell)

# zoxide
Invoke-Expression (& {
        $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
    })