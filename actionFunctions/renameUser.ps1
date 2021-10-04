function Rename-User {
    Print-UserList  # So that the user can know what users there are

    $old_name = (Read-Host -Prompt 'Enter old username').ToLower()
    $new_name = Read-Host -Prompt 'Enter new username'

    # To prevent the user from removing important user accounts
    if ($restricted_users_list.Contains($old_name)) {
        Print-UserCannotBeModifiedError $old_name
        continue
    }

    try {
        Rename-LocalUser -Name $old_name -NewName $new_name -Confirm -ErrorAction Stop
        Print-UserRenamedSuccessfully $old_name $new_name
    } catch [Microsoft.PowerShell.Commands.UserNotFoundException] {
        Print-UserNotFoundError $old_name
    } catch [Microsoft.PowerShell.Commands.InvalidNameException] {
        Print-InvalidUsernameError $new_name
    } catch [Microsoft.Powershell.Commands.nameInUseException] {
        Print-UsernameInUseError $new_name
    } catch {
        Print-UnspecifiedError
    }
}
