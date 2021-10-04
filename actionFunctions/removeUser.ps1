function Remove-User {
    Print-UserList  # So that the user can know what users there are

    $name = (Read-Host -Prompt 'Enter user to be removed').ToLower()

    # To prevent the user from removing important user accounts
    if ($restricted_users_list.Contains($name)) {
        Print-UserCannotBeModifiedError $name
        continue
    }

    try {
        Remove-LocalUser -Name $name -Confirm -ErrorAction Stop
        Print-UserRemovedSuccessfully $name
    } catch [Microsoft.PowerShell.Commands.UserNotFoundException] {
        Print-UserNotFoundError $name
    } catch {
        Print-UnspecifiedError
    }
}
