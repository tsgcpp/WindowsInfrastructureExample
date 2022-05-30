$ErrorActionPreference = 'Stop'

. ./install-functions.ps1

$PackageFormat = 'PowerShell-7.*-win-x64.msi'
$InstallFolder = 'C:\Program Files\PowerShell'
$LogFile = ".install-powershell.log.tmp"

# Invoke-WebRequest https://github.com/PowerShell/PowerShell/releases/download/v7.2.3/PowerShell-7.2.3-win-x64.msi -OutFile PowerShell-7.2.3-win-x64.msi

$PackageFile = Find-Install-Package-WIE -PackageFormat $PackageFormat
if (!($?))
{
    exit 1
}

Write-Output "Installing $PackageFile"

$Result = Start-Process -NoNewWindow -Wait -PassThru -FilePath "msiexec.exe" `
    -ArgumentList `
    "/i $PackageFile", `
    "/quiet", `
    "/qn", `
    "INSTALLFOLDER=`"$InstallFolder`"", `
    "ADD_PATH=0", `
    "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=0", `
    "ENABLE_PSREMOTING=0", `
    "REGISTER_MANIFEST=0", `
    "USE_MU=0", `
    "ENABLE_MU=0", `
    "/norestart", `
    "/log $LogFile"

Get-Content $LogFile
Remove-Item $LogFile

if ($Result.ExitCode -ne  0)
{
    Write-Error "Installation failed. The exit code was $($Result.ExitCode)"
    exit 1
}

Write-Output "$PackageFile was installed successfully"
