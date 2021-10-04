$printFunctionsPath = "$PSScriptRoot\printFunctions"
$actionFunctionsPath = "$PSScriptRoot\actionFunctions"

# Import functions in the specified directories
Get-ChildItem -Path $printFunctionsPath -Filter *.ps1 | ForEach-Object {
    . $_.FullName
}
Get-ChildItem -Path $actionFunctionsPath -Filter *.ps1 | ForEach-Object {
    . $_.FullName
}

# Exits the program if it does not have admin privileges
if ((Check-AdminPrivilege) -eq 0) {
    Print-NoAdminPrivilegeError
    Read-Host -Prompt 'Press Enter to exit...'
    Exit
}

$is_exit = 0  # Set this flag to exit the program

# List of users that the program should not modify
$restricted_users_list = @('administrator', 'defaultaccount', 
                           'guest', 'wdagutilityaccount', "$env:UserName")


Print-Banner
Print-Help

# Main program loop
while ($is_exit -eq 0) {
    Print-Line
    $state = Read-Host -Prompt 'Enter command here'

    Switch ($state) {
        'create' {
            Create-User
            break
        }
        'rename' {
            Rename-User
            break
        }
        'remove' {
            Remove-User
            break
        }
        'help' {
            Print-Help
            break
        }
        'exit' {
            $is_exit = 1
            break
        }
        default {
            Print-InvalidCommandError
        }
    }
}
Exit
