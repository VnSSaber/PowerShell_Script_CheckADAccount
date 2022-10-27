#Push all code into a function so we can use recursion
$commands = {

    $username = Read-Host 'Username'
    $securepwd = Read-Host 'Password' -AsSecureString #Hide password
    $plainpwd =[Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($securepwd)) #Make secure string readable
    $currentdomain = "LDAP://" + ([ADSI]"").distinguishedName
    $domain = New-Object System.DirectoryServices.DirectoryEntry($currentdomain,$username,$plainpwd)
    if ($domain.name -eq $null)
    {
        Write-Host "Incorrect user name or password or account is temporarily locked, please contact your system administrator."
        &$commands #Recursion
    }
    else 
    {
        Write-Host "Authentication success on domain " $domain.name
        &$commands #Another recursion
    }

}
&$commands #Run main function
