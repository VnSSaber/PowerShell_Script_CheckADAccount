$commands = {

    $username = Read-Host 'Nhap username cua user can kiem tra '
    $securepwd = Read-Host 'Nhap password cua user can kiem tra ' -AsSecureString
    $plainpwd =[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($securepwd))
    $currentdomain = "LDAP://" + ([ADSI]"").distinguishedName
    $domain = New-Object System.DirectoryServices.DirectoryEntry($currentdomain,$username,$plainpwd)
    if ($domain.name -eq $null)
    {
        Write-Host "Xac thuc that bai, vui long kiem tra lai username/password"
        &$commands
    }
    else 
    {
        Write-Host "Xac thuc thanh cong tren domain" $domain.name
        &$commands
    }

}
&$commands