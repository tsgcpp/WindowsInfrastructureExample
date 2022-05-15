$ErrorActionPreference = 'Stop'

. ./install-functions.ps1

$PackageFormat = 'PowerShell-7.*-win-x64.msi'
$InstallFolder = 'C:\Program Files\PowerShell'
$LogFile = ".install-powershell.log.tmp"

$PackageFile = Find-Install-Package-WIE -PackageFormat $PackageFormat
if (!($?))
{
    exit 1
}

Write-Output "Installing $PackageFile"

msiexec.exe `
    /i $PackageFile `
    /quiet `
    /qn `
    INSTALLFOLDER=`"$InstallFolder`" `
    ADD_PATH=0 `
    ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=0 `
    ENABLE_PSREMOTING=0 `
    REGISTER_MANIFEST=0 `
    USE_MU=0 `
    ENABLE_MU=0 `
    /norestart `
    /log $LogFile `
    | Out-Null

$Result = $?

Get-Content $LogFile
Remove-Item $LogFile

if (!($Result))
{
    Write-Error "Installation failed."
    exit 1
}
