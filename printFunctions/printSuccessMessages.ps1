<#
This file contains all success messages that will be printed when the program
successfully creates, rename or remove a user.
#>

function Print-UserCreatedSuccessfully($name) {
    Write-Host "User $name created successfully." -ForegroundColor Green
}


function Print-UserRenamedSuccessfully($old_name, $new_name) {
    Write-Host "User $old_name has been renamed to $new_name successfully." -ForegroundColor Green
}


function Print-UserRemovedSuccessfully($name) {
    Write-Host "User $name has been removed successfully." -ForegroundColor Green
}
