function Check-AdminPrivilege {
    $has_admin_privilege = 1
    if (![bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")) {
        $has_admin_privilege = 0
    }
    $has_admin_privilege
}
