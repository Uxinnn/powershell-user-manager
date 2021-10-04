function Create-User {
    # Get user input
    $name = Read-Host -Prompt 'Enter username'
    $password = Read-Host -Prompt 'Enter password' -AsSecureString

    $default_description = 'User created using user manager script'
    if (!($description = Read-Host "Enter description [$default_description]")) {
        $description = $default_description
    }

    try {
        New-LocalUser -Name $name -Password $password -Description $description -Confirm -ErrorAction Stop | Out-Null
        Print-UserCreatedSuccessfully $name
    } catch [Microsoft.Powershell.Commands.InvalidNameException] {
        Print-InvalidUsernameError $name
    } catch [Microsoft.PowerShell.Commands.UserExistsException] {
        Print-UsernameInUseError $name
    } catch {
        Print-UnspecifiedError
    }
}
