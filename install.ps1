New-Item -Path $profile -Value (Get-Item ".\ps_profile.ps1").FullName -ItemType SymbolicLink -Force
