function Print-UserList {
    Write-Host 'Here is a list of current users'
    Get-LocalUser | Select-Object -Property Name, Description | Out-Host
}
