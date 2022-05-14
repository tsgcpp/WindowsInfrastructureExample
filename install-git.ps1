. ./install-functions.ps1

$PackageFormat = 'Git-2.*64-bit.exe'
$LogFile = ".install-git.log.tmp"

$PackageFile = Find-Install-Package-WIE -PackageFormat $PackageFormat
if (!($?))
{
    exit 1
}

Write-Output "Installing $PackageFile"

# See the install folder in PowerShellOptions.inf
& ./$PackageFile `
    /LANG=en `
    /ALLUSERS `
    /VERYSILENT `
    /NORESTART `
    /NOCANCEL `
    /SP- `
    /SUPPRESSMSGBOXES `
    /CLOSEAPPLICATIONS `
    /RESTARTAPPLICATIONS `
    /LOG=$LogFile `
    /LOADINF=git-for-windows.inf `
    | Out-Null

$Result = $?

Get-Content $LogFile
Remove-Item $LogFile

if (!($Result))
{
    Write-Error "Installation failed."
    exit 1
}
