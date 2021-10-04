function Print-Help {
    Write-Host "Welcome to powershell user manager!`n"
    Write-Host "User Manager is a script to help you create, rename,"
    Write-Host "or delete local users on your computer."
    Write-Host "Simply type the options below to get started!`n"
    Print-Command 'create' 'create a local user'
    Print-Command 'rename' 'rename a local user'
    Print-Command 'remove' 'remove a local user'
    Print-Command 'help' 'print this help text'
    Print-Command 'exit' 'exit the user manager'
}


function Print-Command($command, $elaboration) {
    Write-Host "`tEnter " -NoNewline
    Write-Host "$command " -ForegroundColor Green -NoNewline
    Write-Host "to " -NoNewline
    Write-Host "$elaboration."
}
