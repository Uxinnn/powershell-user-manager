<#
This file contains all error messages that will be printed when the program
encounters an error.
#>

function Print-NoAdminPrivilegeError {
    Write-Host "User manager needs admin privileges."
    Write-Host "Please run as administrator."
}


function Print-InvalidUsernameError($name) {
    Write-Host "Username $name is invalid." -ForegroundColor Yellow
    Write-Host 'Username should not contain /\[]:;|=,+*?<>' -ForegroundColor Yellow
}


function Print-UsernameInUseError($name) {
    Write-Host "Username $name is already in use." -ForegroundColor Yellow
}


function Print-UserCannotBeModifiedError($name) {
    Write-Host "User $name cannot be modified." -ForegroundColor Yellow
}


function Print-UserNotFoundError($name) {
    Write-Host "The user $name cannot be found." -ForegroundColor Yellow
}


function Print-UnspecifiedError {
    Write-Host 'An unspecified error has occurred.' -ForegroundColor Red
}


function Print-InvalidCommandError {
    Write-Host 'Invalid command entered.' -ForegroundColor Yellow
}
